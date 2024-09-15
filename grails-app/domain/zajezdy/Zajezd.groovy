package zajezdy

class Zajezd {

    String nazev
    String popis
    static hasMany = [fotografie: Fotografie]

    static constraints = {
        nazev blank: false
        popis maxSize: 255, blank: true
    }
}