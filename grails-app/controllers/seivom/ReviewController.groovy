package seivom

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class ReviewController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def save() {
        def reviewInstance = new Review(params)
        if (!reviewInstance.save(flush: true)) {
            message.flash = "You can't comment here"
            redirect(controller: "movie", action: "show", id: reviewInstance.movie.id)
            return
        }

        //flash.message = message(code: 'default.created.message', args: [message(code: 'review.label', default: 'Review'), reviewInstance.id])
        redirect(controller: "movie", action: "show", id: reviewInstance.movie.id)
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def edit(Long id) {
        def reviewInstance = Review.get(id)
        if (!reviewInstance) {
            message.flash = "You can't comment here"
            redirect(controller: "movie", action: "show", id: reviewInstance.movie.id)
            return
        }

        [reviewInstance: reviewInstance]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def update(Long id, Long version) {
        def reviewInstance = Review.get(id)
        if (!reviewInstance) {
            message.flash = "You can't comment here"
            redirect(controller: "movie", action: "show", id: reviewInstance.movie.id)
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

            redirect(controller: "movie", action: "show", id: reviewInstance.movie.id)
    }

    def remove(Long id) {
        def reviewInstance = Review.get(id)
        if (!reviewInstance) {
            message.flash = "You can't delete thie comment"
            redirect(controller: "movie", action: "show", id: reviewInstance.movie.id)
            return
        }

        try {
            reviewInstance.delete(flush: true)
            flash.message = "Your comment was removed"
            redirect(controller: "movie", action: "show", id: reviewInstance.movie.id)
        }
        catch (DataIntegrityViolationException e) {
            message.flash = "You can't delete the comment"
            redirect(controller: "movie", action: "show", id: reviewInstance.movie.id)
        }
    }
}
