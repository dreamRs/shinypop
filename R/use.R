
#' @rdname noty
#' @export
#' @importFrom htmltools attachDependencies
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


