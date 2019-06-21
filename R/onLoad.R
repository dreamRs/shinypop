#' Shiny resource
#'
#' @importFrom shiny addResourcePath
#'
#' @noRd
.onLoad <- function(...) {
  shiny::addResourcePath("shinynoty", system.file("assets", package = "shinynoty"))
}
