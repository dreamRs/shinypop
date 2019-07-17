
#' Alert with vex.js
#'
#' @param content Text to display in the alert.
#' @param showCloseButton Show or not a button to close alert.
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
#' @examples
#' 
#' ### Alert ###
#' 
#' if (interactive()) {
#'   library(shiny)
#'   
#'   ui <- fluidPage(
#'     tags$h2("Alert with vex example"),
#'     use_vex(),
#'     actionButton("launch", "Launch an alert")
#'   )
#'   
#'   server <- function(input, output, session) {
#'     
#'     observeEvent(input$launch, {
#'       vex(tags$div(
#'         style = "text-align: center;",
#'         tags$h3("Attention"),
#'         tags$br(),
#'         tags$p("This alert was sent from the server,"),
#'         tags$p("probably something went", tags$b("wrong"))
#'       ))
#'     })
#'     
#'   }
#'   
#'   shinyApp(ui, server)
#' }
vex <- function(content, 
                showCloseButton = TRUE, 
                escapeButtonCloses = TRUE, 
                overlayClosesOnClick = TRUE,
                session = shiny::getDefaultReactiveDomain()) {
  session$sendCustomMessage(
    type = "shinypop-vex-alert",
    message = dropNulls(list(
      unsafeMessage = doRenderTags(content),
      showCloseButton = showCloseButton,
      escapeButtonCloses = escapeButtonCloses,
      overlayClosesOnClick = overlayClosesOnClick
    ))
  )
}

