
#' @importFrom htmltools htmlDependency
shinypop_dependencies <- function() {
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

#' @importFrom htmltools htmlDependency
notie_dependencies <- function() {
  htmlDependency(
    name = "notie",
    version = "4.3.1",
    src = list(href = "shinypop", file = "assets"),
    package = "shinypop",
    script = "notie/notie.min.js",
    stylesheet = "notie/notie.min.css"
  )
}

#' @importFrom htmltools htmlDependency
push_dependencies <- function() {
  htmlDependency(
    name = "push.js",
    version = "1.0.0",
    src = list(href = "shinypop", file = "assets"),
    package = "shinypop",
    script = "push/push.min.js"
  )
}

#' @importFrom htmltools htmlDependency
notiflix_dependencies <- function() {
  htmlDependency(
    name = "notiflix",
    version = "1.6.0",
    src = list(href = "shinypop", file = "assets"),
    package = "shinypop",
    script = "notiflix/notiflix-1.6.0.min.js",
    stylesheet = "notiflix/notiflix-1.6.0.min.css"
  )
}

#' @importFrom htmltools htmlDependency
favico_dependencies <- function() {
  htmlDependency(
    name = "favico.js",
    version = "0.3.10",
    src = list(href = "shinypop", file = "assets"),
    package = "shinypop",
    script = "favico/favico-0.3.10.min.js"
  )
}

#' @importFrom htmltools htmlDependency
vex_dependencies <- function(theme) {
  htmlDependency(
    name = "vex",
    version = "4.1.0",
    src = list(href = "shinypop", file = "assets"),
    package = "shinypop",
    script = "vex/js/vex.combined.min.js",
    stylesheet = c(
      "vex/css/vex.css",
      sprintf("vex/css/vex-theme-%s.css", theme)
    )
  )
}


