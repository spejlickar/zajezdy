package zajezdy

class Fotografie {

    String url
    String popis

    static belongsTo = [zajezd: Zajezd]

    static constraints = {
        url nullable: false
        popis maxSize: 255, nullable: true
    }
}