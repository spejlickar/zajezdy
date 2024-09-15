package zajezdy

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class ZajezdSpec extends Specification implements DomainUnitTest<Zajezd> {

     void "test domain constraints"() {
        when:
        Zajezd domain = new Zajezd()
        //TODO: Set domain props here

        then:
        domain.validate()
     }
}
