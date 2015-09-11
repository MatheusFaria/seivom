package seivom

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class ReviewController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [reviewInstanceList: Review.list(params), reviewInstanceTotal: Review.count()]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def create() {
        [reviewInstance: new Review(params)]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def save() {
        def reviewInstance = new Review(params)
        if (!reviewInstance.save(flush: true)) {
            render(view: "create", model: [reviewInstance: reviewInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'review.label', default: 'Review'), reviewInstance.id])
        redirect(controller: "movie", action: "show", id: reviewInstance.movie.id)
    }

    def show(Long id) {
        def reviewInstance = Review.get(id)
        if (!reviewInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'review.label', default: 'Review'), id])
            redirect(action: "list")
            return
        }

        [reviewInstance: reviewInstance]
    }

    @Secured(['ROLE_ADMIN'])
    def edit(Long id) {
        def reviewInstance = Review.get(id)
        if (!reviewInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'review.label', default: 'Review'), id])
            redirect(action: "list")
            return
        }

        [reviewInstance: reviewInstance]
    }

    @Secured(['ROLE_ADMIN'])
    def update(Long id, Long version) {
        def reviewInstance = Review.get(id)
        if (!reviewInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'review.label', default: 'Review'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (reviewInstance.version > version) {
                reviewInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'review.label', default: 'Review')] as Object[],
                          "Another user has updated this Review while you were editing")
                render(view: "edit", model: [reviewInstance: reviewInstance])
                return
            }
        }

        reviewInstance.properties = params

        if (!reviewInstance.save(flush: true)) {
            render(view: "edit", model: [reviewInstance: reviewInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'review.label', default: 'Review'), reviewInstance.id])
        redirect(action: "show", id: reviewInstance.id)
    }

    @Secured(['ROLE_ADMIN'])
    def delete(Long id) {
        def reviewInstance = Review.get(id)
        if (!reviewInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'review.label', default: 'Review'), id])
            redirect(action: "list")
            return
        }

        try {
            reviewInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'review.label', default: 'Review'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'review.label', default: 'Review'), id])
            redirect(action: "show", id: id)
        }
    }
}
