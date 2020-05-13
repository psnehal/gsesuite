package gsesuite

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class PeakInfoController {

    PeakInfoService peakInfoService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond peakInfoService.list(params), model:[peakInfoCount: peakInfoService.count()]
    }

    def show(Long id) {
        respond peakInfoService.get(id)
    }

    def create() {
        respond new PeakInfo(params)
    }

    def save(PeakInfo peakInfo) {
        if (peakInfo == null) {
            notFound()
            return
        }

        try {
            peakInfoService.save(peakInfo)
        } catch (ValidationException e) {
            respond peakInfo.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'peakInfo.label', default: 'PeakInfo'), peakInfo.id])
                redirect peakInfo
            }
            '*' { respond peakInfo, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond peakInfoService.get(id)
    }

    def update(PeakInfo peakInfo) {
        if (peakInfo == null) {
            notFound()
            return
        }

        try {
            peakInfoService.save(peakInfo)
        } catch (ValidationException e) {
            respond peakInfo.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'peakInfo.label', default: 'PeakInfo'), peakInfo.id])
                redirect peakInfo
            }
            '*'{ respond peakInfo, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        peakInfoService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'peakInfo.label', default: 'PeakInfo'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'peakInfo.label', default: 'PeakInfo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
