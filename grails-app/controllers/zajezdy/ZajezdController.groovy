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

    def save(Zajezd zajezd) {
        if (zajezd == null) {
            notFound()
            return
        }

        try {
            zajezd.save(flush: true)
        } catch (ValidationException e) {
            respond zajezd.errors, view:'create'
            return
        }

        redirect action: "index"
    }

    def show(Long id) {
        respond Zajezd.get(id)
    }

    def edit(Long id) {
        //def editZajezd = Zajezd.get(id)
        //render view:"form", model:[zajezd:editZajezd]
        respond Zajezd.get(id)
        
    }

    def update(Long id) {
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