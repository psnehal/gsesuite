package gsesuite

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/" {
            controller = "InputParam"
            action = "main"
        }
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
