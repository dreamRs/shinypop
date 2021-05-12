library(shiny)
library(shinypop)

ui <- fluidPage(
  tags$h2("notie example"),
  use_notie(),
  radioButtons(
    inputId = "type",
    label = "Type:",
    choices = c("info", "neutral",
                "success", "error",
                "warning"),
    inline = TRUE
  ),
  radioButtons(
    inputId = "position",
    label = "Position:",
    choices = c("bottom", "top"),
    inline = TRUE
  ),
  actionButton(
    inputId = "show",
    label = "Show notification",
    width = "100%"
  )
)

server <- function(input, output, session) {
  
  observeEvent(input$show, {
    notie(
      text = "Hello world!",
      type = input$type,
      position = input$position
    )
  })
  
}

if (interactive()) 
  shinyApp(ui, server)