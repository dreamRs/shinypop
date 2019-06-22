
#' @importFrom htmltools htmlDependency
shinynoty_dependencies <- function() {
  htmlDependency(
    name = "shinypop",
    version = "0.1.0",
    src = list(href = "shinypop", file = "assets"),
    package = "shinypop",
    script = "js/shinypop-bindings.js"
  )
}


#' @importFrom htmltools htmlDependency
noty_dependencies <- function() {
  htmlDependency(
    name = "noty",
    version = "3.1.4",
    src = list(href = "shinypop", file = "assets"),
    package = "shinypop",
    script = "noty/noty.min.js",
    stylesheet = "noty/noty.min.css"
  )
}


#' @importFrom htmltools htmlDependency
animate_dependencies <- function() {
  htmlDependency(
    name = "animate",
    version = "3.5.2",
    src = list(href = "shinypop", file = "assets"),
    package = "shinypop",
    stylesheet = "animate/animate.min.css"
  )
}

