
#' @title Alert and confirm with vex.js
#' 
#' @description Initialize with \code{use_vex} in UI before
#'  using \code{vex} (alert) or \code{vex_confirm} (confirmation dialog) server-side.
#'  Retrieve value server-side with \code{input$<inputId>} for \code{vex_confirm}.
#'
#' @param content Text to display in the alert.
#' @param showCloseButton Show or not a button to close alert.
#' @param showButton Show or not a button ath the bottom of the alert.
#' @param labelButton Label for the button.
#' @param escapeButtonCloses Close alert when pressing escape button.
#' @param overlayClosesOnClick Close alert when clicking outside alert.
#' @param session Shiny session.
#'
#' @export
#' 
#' @importFrom htmltools doRenderTags
#' 
#' @name vex
#'
#' @example examples/vex.R
vex <- function(content, 
                showCloseButton = TRUE, 
                showButton = TRUE,
                labelButton = "OK",
                escapeButtonCloses = TRUE, 
                overlayClosesOnClick = TRUE,
                session = shiny::getDefaultReactiveDomain()) {
  config <- dropNulls(list(
    unsafeMessage = doRenderTags(content),
    showCloseButton = showCloseButton,
    escapeButtonCloses = escapeButtonCloses,
    overlayClosesOnClick = overlayClosesOnClick
  ))
  if (!isTRUE(showButton))
    config$buttons <- list()
  session$sendCustomMessage(
    type = "shinypop-vex-alert",
    message = list(config = config, labelButton = labelButton)
  )
}



#' @param inputId The \code{input} slot that will be used to access the value.
#' @param yes_text Text to display on 'yes' button.
#' @param no_text Text to display on 'no' button.
#'
#' @export
#' 
#' @importFrom htmltools doRenderTags
#' 
#' @rdname vex
#'
#' @examples
#' 
#' 
#' ### Confirm ####' 
#' 
#' if (interactive()) {
#'   library(shiny)
#' 
#'   ui <- fluidPage(
#'     tags$h2("Confirm with vex example"),
#'     use_vex(theme = "flat-attack"),
#'     actionButton("ask", "Ask confirmation"),
#'     verbatimTextOutput(outputId = "result")
#'   )
#' 
#'   server <- function(input, output, session) {
#' 
#'     observeEvent(input$ask, {
#'       vex_confirm(
#'         inputId = "confirm", 
#'         content = tags$div(
#'           style = "text-align: center;",
#'           "Are your sure?"
#'         ), 
#'         yes_text = "Yep! I'm sure", 
#'         no_text = "Nope, cancel!"
#'       )
#'     })
#'     
#'     output$result <- renderPrint({
#'       input$confirm
#'     })
#' 
#'   }
#' 
#'   shinyApp(ui, server)
#' }
vex_confirm <- function(inputId, 
                        content, 
                        yes_text = "Ok",
                        no_text = "Cancel",
                        showCloseButton = FALSE, 
                        escapeButtonCloses = FALSE, 
                        overlayClosesOnClick = FALSE,
                        session = shiny::getDefaultReactiveDomain()) {
  session$sendCustomMessage(
    type = "shinypop-vex-confirm",
    message = list(
      inputId = session$ns(inputId),
      yes_text = yes_text,
      no_text = no_text,
      config = dropNulls(list(
        unsafeMessage = doRenderTags(content),
        showCloseButton = showCloseButton,
        escapeButtonCloses = escapeButtonCloses,
        overlayClosesOnClick = overlayClosesOnClick
      ))
    )
  )
}

#' @export
#' 
#' @rdname vex
vex_close <- function(session = shiny::getDefaultReactiveDomain()) {
  session$sendCustomMessage(
    type = "shinypop-vex-close",
    message = list()
  )
}
