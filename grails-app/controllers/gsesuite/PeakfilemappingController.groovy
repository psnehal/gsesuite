package gsesuite

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class PeakfilemappingController {

    PeakfilemappingService peakfilemappingService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond peakfilemappingService.list(params), model:[peakfilemappingCount: peakfilemappingService.count()]
    }

    def show(Long id) {
        respond peakfilemappingService.get(id)
    }

    def create() {
        respond new Peakfilemapping(params)
    }

    def save(Peakfilemapping peakfilemapping) {
        if (peakfilemapping == null) {
            notFound()
            return
        }

        try {
            peakfilemappingService.save(peakfilemapping)
        } catch (ValidationException e) {
            respond peakfilemapping.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'peakfilemapping.label', default: 'Peakfilemapping'), peakfilemapping.id])
                redirect peakfilemapping
            }
            '*' { respond peakfilemapping, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond peakfilemappingService.get(id)
    }

    def update(Peakfilemapping peakfilemapping) {
        if (peakfilemapping == null) {
            notFound()
            return
        }

        try {
            peakfilemappingService.save(peakfilemapping)
        } catch (ValidationException e) {
            respond peakfilemapping.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'peakfilemapping.label', default: 'Peakfilemapping'), peakfilemapping.id])
                redirect peakfilemapping
            }
            '*'{ respond peakfilemapping, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        peakfilemappingService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'peakfilemapping.label', default: 'Peakfilemapping'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'peakfilemapping.label', default: 'Peakfilemapping'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
