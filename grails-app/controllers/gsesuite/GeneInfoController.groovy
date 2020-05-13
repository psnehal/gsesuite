package gsesuite

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class GeneInfoController {

    GeneInfoService geneInfoService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond geneInfoService.list(params), model:[geneInfoCount: geneInfoService.count()]
    }

    def show(Long id) {
        respond geneInfoService.get(id)
    }

    def create() {
        respond new GeneInfo(params)
    }

    def save(GeneInfo geneInfo) {
        if (geneInfo == null) {
            notFound()
            return
        }

        try {
            geneInfoService.save(geneInfo)
        } catch (ValidationException e) {
            respond geneInfo.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'geneInfo.label', default: 'GeneInfo'), geneInfo.id])
                redirect geneInfo
            }
            '*' { respond geneInfo, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond geneInfoService.get(id)
    }

    def update(GeneInfo geneInfo) {
        if (geneInfo == null) {
            notFound()
            return
        }

        try {
            geneInfoService.save(geneInfo)
        } catch (ValidationException e) {
            respond geneInfo.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'geneInfo.label', default: 'GeneInfo'), geneInfo.id])
                redirect geneInfo
            }
            '*'{ respond geneInfo, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        geneInfoService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'geneInfo.label', default: 'GeneInfo'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'geneInfo.label', default: 'GeneInfo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
