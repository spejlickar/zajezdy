package zajezdy

import grails.validation.ValidationException

class ZajezdController {

    static allowedMethods = [index: "GET", create: "GET", show:"GET", save: "POST", update: "PUT", delete: "DELETE"]

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
            zajezd.save()
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
        render view:"create", model:[zajezd:editZajezd]
    }

    def update(Long id, Zajezd zajezd) {
        Zajezd existing = Zajezd.get(id)
        existing.properties = params
        if (existing.save(flush: true)) {
            redirect action: "index"
        } else {
            render view: "edit", model: [zajezd: existing]
        }
    }

    def delete(Long id) {
        Zajezd.get(id)?.delete(flush: true)
        redirect action: "index"
    }
}