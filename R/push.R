
#' @title Notification with push.js
#'
#' @description Initialize with \code{use_push} in UI before using \code{push} server-side.
#'  Close all notifications with \code{push_close}.
#'
#' @param title Title of the notification.
#' @param text Optional text for the notification.
#' @param timeout Time in milliseconds until the notification closes automatically.
#' @param session Shiny session.
#'
#' @note push.js sends desktop notifications, user need to allow permission to show notification.
#'
#' @export
#'
#' @name push
#'
#' @importFrom shiny getDefaultReactiveDomain
#'
#' @example examples/push.R
push <- function(title, 
                 text = NULL, 
                 timeout = 4000,
                 session = shiny::getDefaultReactiveDomain()) {
  session$sendCustomMessage(
    type = "shinypop-push",
    message = list(
      title = title,
      config = dropNulls(list(
        body = text,
        timeout = timeout
      ))
    )
  )
}

