package seivom

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest
import grails.plugins.springsecurity.Secured

class MovieController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    private static final okcontents = ['image/png', 'image/jpeg', 'application/octet-stream']

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [movieInstanceList: Movie.list(params), movieInstanceTotal: Movie.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        [movieInstance: new Movie(params)]
    }

    def save() {
        def movieInstance = new Movie(params)

        def poster = params.poster

        if (!okcontents.contains(poster.getContentType())) {
            flash.message = message(code: 'default.poster.invalid')
            redirect(action: "create")
            return
        } else if (poster.getContentType() != 'application/octet-stream') {
            movieInstance.poster = poster.bytes
            movieInstance.posterType = poster.contentType
        }

        if (!movieInstance.save(flush: true)) {
            render(view: "create", model: [movieInstance: movieInstance])
            return
        }

        //flash.message = message(code: 'default.created.message', args: [message(code: 'movie.label', default: 'Movie'), movieInstance.id])
        redirect(action: "show", id: movieInstance.id)
    }

    def show(Long id) {
        def movieInstance = Movie.get(id)
        if (!movieInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'movie.label', default: 'Movie'), id])
            redirect(action: "list")
            return
        }

        if (springSecurityService.isLoggedIn()) {
                def person = springSecurityService.currentUser
                params.person = person
        }

        [movieInstance: movieInstance]
    }

    @Secured(['ROLE_ADMIN'])
    def edit(Long id) {
        def movieInstance = Movie.get(id)
        if (!movieInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'movie.label', default: 'Movie'), id])
            redirect(action: "list")
            return
        }

        [movieInstance: movieInstance]
    }

    def update(Long id, Long version) {
        def movieInstance = Movie.get(id)
        if (!movieInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'movie.label', default: 'Movie'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (movieInstance.version > version) {
                movieInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'movie.label', default: 'Movie')] as Object[],
                          "Another user has updated this Movie while you were editing")
                render(view: "edit", model: [movieInstance: movieInstance])
                return
            }
        }

        movieInstance.properties = params

        if (!movieInstance.save(flush: true)) {
            render(view: "edit", model: [movieInstance: movieInstance])
            return
        }

        //flash.message = message(code: 'default.updated.message', args: [message(code: 'movie.label', default: 'Movie'), movieInstance.id])
        redirect(action: "show", id: movieInstance.id)
    }

    @Secured(['ROLE_ADMIN'])
    def delete(Long id) {
        def movieInstance = Movie.get(id)
        if (!movieInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'movie.label', default: 'Movie'), id])
            redirect(action: "list")
            return
        }

        try {
            movieInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'movie.label', default: 'Movie'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            //flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'movie.label', default: 'Movie'), id])
            redirect(action: "show", id: id)
        }
    }


    def get_poster() {
        def movie = Movie.get(params.id)
        def poster

        if(!movie || !movie.poster || !movie.posterType) {
            def posterFile = new File("web-app/images/poster-placeholder.png")
            poster = posterFile.bytes
            response.contentType = "image/png"
        } else {
            response.contentType = movie.posterType
            poster = movie.poster
        }

        response.contentLength = poster.size()
        OutputStream out = response.outputStream
        out.write(poster)
        out.close()
        
    }

    def watched_movie() {
        if (springSecurityService.isLoggedIn()) {
                def person = springSecurityService.currentUser
                def movie = Movie.get(params.id)
                person.watchedmovies.add(movie)
        }
        redirect(action: "show", id: params.id)
    }

    def remove_watched_movie() {
        if (springSecurityService.isLoggedIn()) {
                def person = springSecurityService.currentUser
                def movie = Movie.get(params.id)
                if(person.watchedmovies.contains(movie))
                        person.watchedmovies.remove(movie)
                else if(person.reviewedmovies().contains(movie))
                {
                    flash.message = message(code: 'default.cant_remove_reviewd_movie')
                }
        }
        redirect(action: "show", id: params.id)
    }

    def watch_later_movie() {
        if (springSecurityService.isLoggedIn()) {
                def person = springSecurityService.currentUser
                def movie = Movie.get(params.id)
                person.watchlater.add(movie)
        }
        redirect(action: "show", id: params.id)
    }
}
