package zajezdy

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class ZajezdControllerSpec extends Specification implements ControllerUnitTest<ZajezdController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
