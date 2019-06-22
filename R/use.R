
#' @rdname noty
#' @export
#' @importFrom htmltools tags attachDependencies
use_noty <- function() {
  attachDependencies(
    x = tags$div(class = "noty-deps"),
    value = list(
      noty_dependencies(),
      shinynoty_dependencies(),
      animate_dependencies()
    )
  )
}


#' @rdname notie
#' @export
#' @importFrom htmltools tags attachDependencies
use_notie <- function() {
  attachDependencies(
    x = tags$div(class = "notie-deps"),
    value = list(
      notie_dependencies(),
      shinynoty_dependencies()
    )
  )
}
