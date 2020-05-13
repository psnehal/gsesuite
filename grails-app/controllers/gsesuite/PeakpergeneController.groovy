package gsesuite

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class PeakpergeneController {

    PeakpergeneService peakpergeneService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond peakpergeneService.list(params), model:[peakpergeneCount: peakpergeneService.count()]
    }

    def show(Long id) {
        respond peakpergeneService.get(id)
    }

    def create() {
        respond new Peakpergene(params)
    }

    def save(Peakpergene peakpergene) {
        if (peakpergene == null) {
            notFound()
            return
        }

        try {
            peakpergeneService.save(peakpergene)
        } catch (ValidationException e) {
            respond peakpergene.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'peakpergene.label', default: 'Peakpergene'), peakpergene.id])
                redirect peakpergene
            }
            '*' { respond peakpergene, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond peakpergeneService.get(id)
    }

    def update(Peakpergene peakpergene) {
        if (peakpergene == null) {
            notFound()
            return
        }

        try {
            peakpergeneService.save(peakpergene)
        } catch (ValidationException e) {
            respond peakpergene.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'peakpergene.label', default: 'Peakpergene'), peakpergene.id])
                redirect peakpergene
            }
            '*'{ respond peakpergene, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        peakpergeneService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'peakpergene.label', default: 'Peakpergene'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'peakpergene.label', default: 'Peakpergene'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
