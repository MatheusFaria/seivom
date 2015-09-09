package seivom



import org.junit.*
import grails.test.mixin.*

@TestFor(StudioController)
@Mock(Studio)
class StudioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/studio/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.studioInstanceList.size() == 0
        assert model.studioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.studioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.studioInstance != null
        assert view == '/studio/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/studio/show/1'
        assert controller.flash.message != null
        assert Studio.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/studio/list'

        populateValidParams(params)
        def studio = new Studio(params)

        assert studio.save() != null

        params.id = studio.id

        def model = controller.show()

        assert model.studioInstance == studio
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/studio/list'

        populateValidParams(params)
        def studio = new Studio(params)

        assert studio.save() != null

        params.id = studio.id

        def model = controller.edit()

        assert model.studioInstance == studio
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/studio/list'

        response.reset()

        populateValidParams(params)
        def studio = new Studio(params)

        assert studio.save() != null

        // test invalid parameters in update
        params.id = studio.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/studio/edit"
        assert model.studioInstance != null

        studio.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/studio/show/$studio.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        studio.clearErrors()

        populateValidParams(params)
        params.id = studio.id
        params.version = -1
        controller.update()

        assert view == "/studio/edit"
        assert model.studioInstance != null
        assert model.studioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/studio/list'

        response.reset()

        populateValidParams(params)
        def studio = new Studio(params)

        assert studio.save() != null
        assert Studio.count() == 1

        params.id = studio.id

        controller.delete()

        assert Studio.count() == 0
        assert Studio.get(studio.id) == null
        assert response.redirectedUrl == '/studio/list'
    }
}
