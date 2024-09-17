package zajezdy

import grails.validation.ValidationException

class ZajezdController {

    //static allowedMethods = [index: "GET", create: "GET", show:"GET", save: "POST", update: "PUT", delete: "DELETE"]

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
        def editZajezd = Zajezd.get(id)
        //render view:"form", model:[zajezd:editZajezd]
        respond editZajezd
        
    }

    def update(Long id, Zajezd zajezd) {
        def zajezdStavajici = Zajezd.get(id)
        zajezdStavajici.setNazev(zajezd.getNazev())
        zajezdStavajici.save(flush: true)
       redirect action: "index"
    }

    def delete(Long id) {
        Zajezd.get(id)?.delete(flush: true)
        redirect action: "index"
    }
}