
#' @title Notification with noty.js
#'
#' @description Initialize with \code{use_noty} in UI before using \code{noty} server-side.
#'
#' @param text Text to display.
#' @param timeout Delay for closing event in milliseconds (ms).
#'  Set \code{FALSE} for sticky notifications.
#' @param type Type of notification: \code{"alert"}, \code{"success"}, \code{"error"}, \code{"warning"}, \code{"info"}.
#' @param layout Position amongst : \code{"top"}, \code{"topLeft"}, \code{"topCenter"},
#'  \code{"topRight"}, \code{"center"}, \code{"centerLeft"}, \code{"centerRight"},
#'  \code{"bottom"}, \code{"bottomLeft"}, \code{"bottomCenter"}, "\code{"bottomRight"}.
#' @param theme Theme to use between : \code{"mint"}, \code{"sunset"}, \code{"relax"}, \code{"nest"}, \code{"metroui"},
#'  \code{"semanticui"}, \code{"light"}, \code{"bootstrap-v3"}, \code{"bootstrap-v4"}.
#' @param modal Add an overlay to the page to emphasis notification.
#' @param killer Close all others notification before openning.
#' @param session Shiny session.
#'
#' @export
#'
#' @importFrom shiny getDefaultReactiveDomain
#'
#' @name noty
#'
#' @examples
#' if (interactive()) {
#'
#'
#'
#' }
noty <- function(text,
                 timeout = getOption("noty.timeout", default = 1000),
                 type = c("info", "alert", "success", "error", "warning"),
                 layout = c("topRight", "top", "topLeft", "topCenter",
                            "center", "centerLeft", "centerRight",
                            "bottom", "bottomLeft", "bottomCenter",
                            "bottomRight"),
                 theme = getOption("noty.theme", default = "sunset"),
                 modal = FALSE, killer = FALSE,
                 session = shiny::getDefaultReactiveDomain()) {
  type <- match.arg(type)
  layout <- match.arg(layout)
  theme <- match.arg(
    arg = theme,
    choices = c(
      "mint", "sunset", "relax", "nest", "metroui",
      "semanticui", "light", "bootstrap-v3", "bootstrap-v4"
    )
  )
  session$sendCustomMessage(
    type = "shinynoty-noty",
    message = list(
      text = text,
      timeout = timeout,
      type = type,
      layout = layout,
      theme = theme,
      killer = killer,
      modal = modal
    )
  )
}
