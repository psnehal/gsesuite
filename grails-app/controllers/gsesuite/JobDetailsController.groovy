package gsesuite

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class JobDetailsController {

    JobDetailsService jobDetailsService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond jobDetailsService.list(params), model:[jobDetailsCount: jobDetailsService.count()]
    }

    def show(Long id) {
        respond jobDetailsService.get(id)
    }

    def create() {
        respond new JobDetails(params)
    }

    def save(JobDetails jobDetails) {
        if (jobDetails == null) {
            notFound()
            return
        }

        try {
            jobDetailsService.save(jobDetails)
        } catch (ValidationException e) {
            respond jobDetails.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'jobDetails.label', default: 'JobDetails'), jobDetails.id])
                redirect jobDetails
            }
            '*' { respond jobDetails, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond jobDetailsService.get(id)
    }

    def update(JobDetails jobDetails) {
        if (jobDetails == null) {
            notFound()
            return
        }

        try {
            jobDetailsService.save(jobDetails)
        } catch (ValidationException e) {
            respond jobDetails.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'jobDetails.label', default: 'JobDetails'), jobDetails.id])
                redirect jobDetails
            }
            '*'{ respond jobDetails, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        jobDetailsService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'jobDetails.label', default: 'JobDetails'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'jobDetails.label', default: 'JobDetails'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
