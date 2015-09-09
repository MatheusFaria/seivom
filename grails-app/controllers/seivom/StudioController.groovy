package seivom

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class StudioController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [studioInstanceList: Studio.list(params), studioInstanceTotal: Studio.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        [studioInstance: new Studio(params)]
    }

    def save() {
        def studioInstance = new Studio(params)
        if (!studioInstance.save(flush: true)) {
            render(view: "create", model: [studioInstance: studioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'studio.label', default: 'Studio'), studioInstance.id])
        redirect(action: "show", id: studioInstance.id)
    }

    def show(Long id) {
        def studioInstance = Studio.get(id)
        if (!studioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'studio.label', default: 'Studio'), id])
            redirect(action: "list")
            return
        }

        [studioInstance: studioInstance]
    }

    @Secured(['ROLE_ADMIN'])
    def edit(Long id) {
        def studioInstance = Studio.get(id)
        if (!studioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'studio.label', default: 'Studio'), id])
            redirect(action: "list")
            return
        }

        [studioInstance: studioInstance]
    }

    def update(Long id, Long version) {
        def studioInstance = Studio.get(id)
        if (!studioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'studio.label', default: 'Studio'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (studioInstance.version > version) {
                studioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'studio.label', default: 'Studio')] as Object[],
                          "Another user has updated this Studio while you were editing")
                render(view: "edit", model: [studioInstance: studioInstance])
                return
            }
        }

        studioInstance.properties = params

        if (!studioInstance.save(flush: true)) {
            render(view: "edit", model: [studioInstance: studioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'studio.label', default: 'Studio'), studioInstance.id])
        redirect(action: "show", id: studioInstance.id)
    }

    def delete(Long id) {
        def studioInstance = Studio.get(id)
        if (!studioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'studio.label', default: 'Studio'), id])
            redirect(action: "list")
            return
        }

        try {
            studioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'studio.label', default: 'Studio'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'studio.label', default: 'Studio'), id])
            redirect(action: "show", id: id)
        }
    }
}
