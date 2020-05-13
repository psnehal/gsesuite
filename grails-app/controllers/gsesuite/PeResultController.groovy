package gsesuite

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class PeResultController {

    PeResultService peResultService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond peResultService.list(params), model:[peResultCount: peResultService.count()]
    }

    def show(Long id) {
        respond peResultService.get(id)
    }

    def create() {
        respond new PeResult(params)
    }

    def save(PeResult peResult) {
        if (peResult == null) {
            notFound()
            return
        }

        try {
            peResultService.save(peResult)
        } catch (ValidationException e) {
            respond peResult.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'peResult.label', default: 'PeResult'), peResult.id])
                redirect peResult
            }
            '*' { respond peResult, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond peResultService.get(id)
    }

    def update(PeResult peResult) {
        if (peResult == null) {
            notFound()
            return
        }

        try {
            peResultService.save(peResult)
        } catch (ValidationException e) {
            respond peResult.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'peResult.label', default: 'PeResult'), peResult.id])
                redirect peResult
            }
            '*'{ respond peResult, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        peResultService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'peResult.label', default: 'PeResult'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'peResult.label', default: 'PeResult'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
