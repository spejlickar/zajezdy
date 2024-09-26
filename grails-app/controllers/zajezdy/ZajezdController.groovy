package zajezdy

import grails.validation.ValidationException

class ZajezdController {

    //static allowedMethods = [index: "GET", create: "GET", show:"GET", save: "POST", update: "PUT", delete: "DELETE"]
    ZajezdService zajezdService

    def index() {
        respond Zajezd.list()
    }

    def create() {
        def newZajezd = new Zajezd()
        render view:"create", model:[zajezd:newZajezd]
    }

    def save(Long id) {
        def photo = request.getFile('photo')  // Přijímá nahraný soubor
        
        def result = zajezdService.saveFoto(id, photo)

        redirect(action: "index")
        //render view:"edit", model:result.zajezd
    }

    def show(Long id) {
        respond Zajezd.get(id)
    }

    def edit(Long id) {
        //def editZajezd = Zajezd.get(id)
        //render view:"form", model:[zajezd:editZajezd]
        respond Zajezd.get(id)
        
    }

    def update(Long id, Zajezd zajezd) {
        //def zajezdStavajici = Zajezd.get(id)
        //zajezdStavajici.setNazev(zajezd.getNazev())
        //zajezdStavajici.nazev = params.nazev
        //zajezdStavajici.save(params)
       //redirect action: "index"
       println params
        def result = zajezdService.updateZajezd(id, params)
        if (!result.success) {
            if (result.message) {
                flash.message = result.message
                redirect(action: "index")
            } else {
                render(view: "edit", model: [zajezdInstance: result.zajezdInstance])
            }
            return
        }

        flash.message = "Zájezd byl úspěšně aktualizován."
        redirect(action: "index")
    }

    def delete(Long id) {
        Zajezd.get(id)?.delete(flush: true)
        redirect action: "index"
    }
}