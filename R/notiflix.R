
#' @title Notification with notiflix.js
#'
#' @description Initialize with \code{use_notiflix_notify} in UI before using \code{nx_notify_*} server-side.
#'  Close all notifications with \code{notie_close}.
#'
#' @param text Text to display.
#' @param session Shiny session.
#'
#' @note Configuration of notification is done with \code{use_notiflix_notify} in UI per application.
#'
#' @export
#'
#' @name notiflix-notify
#'
#' @importFrom shiny getDefaultReactiveDomain
#'
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     tags$h2("Notification with notiflix.jx"),
#'     use_notiflix_notify(position = "right-bottom"),
#'     actionButton("success", "Show success", class = "btn-success"),
#'     actionButton("error", "Show error", class = "btn-danger"),
#'     actionButton("info", "Show info", class = "btn-info"),
#'     actionButton("warning", "Show warning", class = "btn-warning")
#'   )
#'
#'   server <- function(input, output, session) {
#'
#'     observeEvent(input$success, {
#'       nx_notify_success("Yes :)")
#'     })
#'
#'     observeEvent(input$error, {
#'       nx_notify_error("Oups...")
#'     })
#'
#'     observeEvent(input$info, {
#'       nx_notify_info("For information")
#'     })
#'
#'     observeEvent(input$warning, {
#'       nx_notify_warning("Careful !!!")
#'     })
#'
#'   }
#'
#'   shinyApp(ui, server)
#' }
nx_notify_success <- function(text, session = shiny::getDefaultReactiveDomain()) {
  nx_notify(session, "success", text)
}

#' @export
#'
#' @name notiflix-notify
nx_notify_error <- function(text, session = shiny::getDefaultReactiveDomain()) {
  nx_notify(session, "error", text)
}

#' @export
#'
#' @name notiflix-notify
nx_notify_info <- function(text, session = shiny::getDefaultReactiveDomain()) {
  nx_notify(session, "info", text)
}

#' @export
#'
#' @name notiflix-notify
nx_notify_warning <- function(text, session = shiny::getDefaultReactiveDomain()) {
  nx_notify(session, "warning", text)
}



nx_notify <- function(session, type, text, ...) {
  session$sendCustomMessage(
    type = paste0("shinypop-notiflix-notify-", type),
    message = list(
      text = text,
      config = dropNulls(list(...))
    )
  )
}


