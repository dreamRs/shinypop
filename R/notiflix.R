
#' @title Notification with notiflix.js
#'
#' @description Initialize with \code{use_notiflix_notify} in UI before using \code{nx_notify_*} server-side.
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






# report ------------------------------------------------------------------



#' @title Report with notiflix.js
#'
#' @description Initialize with \code{use_notiflix_report} in UI before using \code{nx_report_*} server-side.
#'
#' @param title Title of the report.
#' @param message Message of the report.
#' @param button Label of the button.
#' @param session Shiny session.
#'
#' @note Configuration of report is done with \code{use_notiflix_report} in UI per application.
#'
#' @export
#'
#' @name notiflix-report
#'
#' @importFrom shiny getDefaultReactiveDomain
#' @importFrom htmltools doRenderTags
#'
#' @examples
#' if (interactive()) {
#'
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     tags$h2("Reports with notiflix.jx"),
#'     use_notiflix_report(),
#'     actionButton("success", "Show success", class = "btn-success"),
#'     actionButton("error", "Show error", class = "btn-danger"),
#'     actionButton("info", "Show info", class = "btn-info"),
#'     actionButton("warning", "Show warning", class = "btn-warning")
#'   )
#'
#'   server <- function(input, output, session) {
#'
#'     observeEvent(input$success, {
#'       nx_report_success("Bravo!", "Everything worked as expected")
#'     })
#'
#'     observeEvent(input$error, {
#'       nx_report_error("Oups...", "Something went wrong")
#'     })
#'
#'     observeEvent(input$info, {
#'       nx_report_info(
#'         "Notice",
#'         tags$p(
#'           style = "text-align: center;",
#'           "Current version of this package : ",
#'           tags$b(as.character(packageVersion("shinypop")))
#'         )
#'       )
#'     })
#'
#'     observeEvent(input$warning, {
#'       nx_report_warning("Attention !!!", "There's some warnings")
#'     })
#'
#'   }
#'
#'   shinyApp(ui, server)
#'
#' }
nx_report_success <- function(title, message, button = "Ok",
                              session = shiny::getDefaultReactiveDomain()) {
  nx_report(
    session, "success",
    title = title, message = doRenderTags(message), button = button
  )
}

#' @export
#'
#' @name notiflix-report
nx_report_error <- function(title, message, button = "Ok",
                            session = shiny::getDefaultReactiveDomain()) {
  nx_report(
    session, "error",
    title = title, message = doRenderTags(message), button = button
  )
}

#' @export
#'
#' @name notiflix-report
nx_report_info <- function(title, message, button = "Ok",
                           session = shiny::getDefaultReactiveDomain()) {
  nx_report(
    session, "info",
    title = title, message = doRenderTags(message), button = button
  )
}

#' @export
#'
#' @name notiflix-report
nx_report_warning <- function(title, message, button = "Ok",
                              session = shiny::getDefaultReactiveDomain()) {
  nx_report(
    session, "warning",
    title = title, message = doRenderTags(message), button = button
  )
}



nx_report <- function(session, type, ...) {
  session$sendCustomMessage(
    type = paste0("shinypop-notiflix-report-", type),
    message = list(...)
  )
}





# confirm -----------------------------------------------------------------

#' @title Confirm dialog with notiflix.js
#'
#' @description Initialize with \code{use_notiflix_confirm} in UI before using \code{nx_confirm} server-side.
#'  Retrieve value server-side with \code{input$<inputId>}.
#'
#' @param inputId The \code{input} slot that will be used to access the value.
#' @param title Title of the dialog.
#' @param message Message of the dialog.
#' @param button_ok Label for OK button.
#' @param button_cancel Label for cancel button.
#' @param session Shiny session.
#'
#' @note Configuration is done with \code{use_notiflix_report} in UI per application.
#'
#' @export
#'
#' @name notiflix-confirm
#'
#' @importFrom shiny getDefaultReactiveDomain
#' @importFrom htmltools doRenderTags
#'
#' @examples
#' if (interactive()) {
#'
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     use_notiflix_confirm(),
#'     tags$h2("notiflix confirmation pop-up"),
#'     actionButton("show", "Ask for confirmation"),
#'     verbatimTextOutput("result")
#'   )
#'
#'   server <- function(input, output, session) {
#'
#'     observeEvent(input$show, {
#'       nx_confirm(
#'         inputId = "confirm",
#'         title = "Do you want to confirm?",
#'         button_ok = "Sure!",
#'         button_cancel = "Nope!"
#'       )
#'     })
#'
#'     output$result <- renderPrint({
#'       input$confirm
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#'
#' }
nx_confirm <- function(inputId, title,
                       message = NULL,
                       button_ok = "Ok",
                       button_cancel = "Cancel",
                       session = shiny::getDefaultReactiveDomain()) {
  if (is.null(message))
    message <- " "
  if (nchar(message) == 0)
    message <- " "
  session$sendCustomMessage(
    type = "shinypop-notiflix-confirm",
    message = list(
      id = inputId,
      title = title,
      message = message,
      button_ok = button_ok,
      button_cancel = button_cancel
    )
  )
}





