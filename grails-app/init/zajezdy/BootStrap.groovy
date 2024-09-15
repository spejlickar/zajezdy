package zajezdy

class BootStrap {

    def init = { servletContext ->
        log.info "nahrani uvodnich dat"

        def zajezd1 = new Zajezd(nazev: "prvni zajezd", popis: "nejlepší zájezd" ).save()
        new Fotografie(popis: "foto1",url: "f0.jpg", zajezd:zajezd1).save()
        new Fotografie(popis: "foto2",url: "f1.jpg",zajezd:zajezd1).save()
        
    }
    def destroy = {
    }
}