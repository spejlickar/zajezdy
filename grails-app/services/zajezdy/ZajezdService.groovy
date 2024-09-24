package zajezdy

import grails.gorm.transactions.Transactional

@Transactional
class ZajezdService {

    def saveFoto(Zajezd zajezd, photo){
        if (photo && !photo.empty) {
            def storagePath = "/assets/images"
            def filename = UUID.randomUUID().toString() + "-" + photo.originalFilename  // Vytvoření unikátního názvu souboru
            def filePath = new File(storagePath, filename)
            
            try {
                // Uložení souboru na server
                photo.transferTo(filePath)

                // Uložení URL souboru do domeny databinding
                zajezd.addToFotografie(id:null,url:filename, popis:"HaHa")
                zajezdInstance.save(flush: true)
                
            } catch (IOException e) {
                return [success: false, zajezd: zajezd]
                
            }
        } else {
            return [success: false, zajezd: zajezd]
        }
        return [success: true, zajezd: zajezd]
    }

    def updateZajezd(Long id,Map params) {
        def zajezdInstance = Zajezd.get(id)
        if (!zajezdInstance) {
            return [success: false, message: "Zájezd nenalezen."]
        }
        println params
        zajezdInstance.properties = params

        // Uchování seznamu existujících fotek
        def stavajiciFotky = zajezdInstance.fotografie.collect()

        def x = Fotografie.get(1)

        //x.properties['popis'] = "HaHa"
        //x.save(flush: true)

        // Aktualizace nebo přidání fotek
        params.list('fotky').each { fotkaParams ->
            if (fotkaParams.id) {
                // Aktualizace existující fotky
                def fotka = Fotografie.get(fotkaParams.id as Long)
                if (fotka) {
                    fotka.properties['popis'] = fotkaParams
                    fotka.save(flush: true)
                }

            } else {
                // Přidání nové fotky
              //  def fotka = new Fotografie(fotkaParams)
              //  zajezdInstance.addToFotografie(fotka)
           }
        }

        // Odstranění fotek, které nebyly v params (byly odebrány ve view)
        /*stavajiciFotky.each { fotka ->
            if (!params.fotky.find { it.id?.toLong() == fotka.id }) {
                zajezdInstance.removeFromFotografie(fotka)
                fotka.delete()
            }
        }*/

        if (!zajezdInstance.save(flush: true)) {
            return [success: false, zajezdInstance: zajezdInstance]
        }

        return [success: true, zajezdInstance: zajezdInstance]
    }
}