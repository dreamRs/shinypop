
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
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     tags$h2("notie example"),
#'     use_notie(),
#'     splitLayout(
#'       radioButtons(
#'         inputId = "type",
#'         label = "Type:",
#'         choices = c("info", "neutral",
#'                     "success", "error",
#'                     "warning")
#'       ),
#'       radioButtons(
#'         inputId = "position",
#'         label = "Position:",
#'         choices = c("bottom", "top")
#'       )
#'     ),
#'     actionButton(
#'       inputId = "show",
#'       label = "Show notification",
#'       width = "100%"
#'     )
#'   )
#'
#'   server <- function(input, output, session) {
#'
#'     observeEvent(input$show, {
#'       notie(
#'         text = "Hello world!",
#'         type = input$type,
#'         position = input$position
#'       )
#'     })
#'
#'   }
#'
#'   shinyApp(ui, server)
#'
#' }
notie <- function(text,
                  time = getOption("notie.time", default = 3),
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






#' @title Confirmation pop-up with notie.js
#'
#' @description Initialize with \code{use_notie} in UI before using \code{notie_confirm} server-side.
#'  Retrieve value servr-side with \code{input$<inputId>}.
#'
#' @param inputId The \code{input} slot that will be used to access the value.
#' @param text Text to display.
#' @param label_submit Submit button label.
#' @param label_cancel Cancel button label.
#' @param position Where to display notification: \code{"bottom"} or \code{"top"}.
#' @param session Shiny session.
#'
#' @export
#'
#' @importFrom shiny getDefaultReactiveDomain
#'
#' @examples
#' if (interactive()) {
#'
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     use_notie(),
#'     tags$h2("notie.js confirmation pop-up"),
#'     actionButton("show", "Ask for confirmation"),
#'     verbatimTextOutput("result")
#'   )
#'
#'   server <- function(input, output, session) {
#'
#'     observeEvent(input$show, {
#'       notie_confirm(
#'         inputId = "confirm",
#'         text = "Do you want to confirm?",
#'         label_submit = "Sure!",
#'         label_cancel = "Nope!"
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
notie_confirm <- function(inputId, text, label_submit = "Ok", label_cancel = "Cancel",
                          position = c("top", "bottom"),
                          session = shiny::getDefaultReactiveDomain()) {
  position <- match.arg(position)
  session$sendCustomMessage(
    type = "shinypop-notie-confirm",
    message = list(
      id = inputId,
      config = dropNulls(list(
        text = text,
        position = position,
        submitText = label_submit,
        cancelText = label_cancel
      ))
    )
  )
}


