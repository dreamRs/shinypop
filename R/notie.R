
#' @title Notification with notie.js
#'
#' @description Initialize with \code{use_notie} in UI before using \code{notie} server-side.
#'  Close all notifications with \code{notie_close}.
#'
#' @param text Text to display.
#' @param time Delay for closing notification in seconds (s).
#' @param type Type of notification: \code{"alert"}, \code{"success"}, \code{"error"}, \code{"warning"}, \code{"info"}.
#' @param position Where to display notification: \code{"bottom"} or \code{"top"}.
#' @param session Shiny session.
#'
#' @export
#'
#' @name notie
#'
#' @examples
#' if (interactive()) {
#'
#'
#'
#' }
notie <- function(text,
                  time = getOption("notie.timet", default = 3),
                  type = c("info", "neutral", "success", "error", "warning"),
                  position = c("bottom", "top"),
                  session = shiny::getDefaultReactiveDomain()) {
  type <- match.arg(type)
  position <- match.arg(position)
  session$sendCustomMessage(
    type = "shinypop-notie",
    message = dropNulls(list(
      text = text,
      time = time,
      type = type,
      position = position
    ))
  )
}

#' @export
#' @rdname notie
notie_close <- function(session = shiny::getDefaultReactiveDomain()) {
  session$sendCustomMessage("shinypop-notie-close", list())
}

