library(shiny)
library(shinypop)

ui <- fluidPage(
  tags$h2("Push notification"),
  use_push(),
  actionButton("show", "Show notification"),
  textInput("title", "Text to display", "Hello world :)")
)

server <- function(input, output, session) {
  
  observeEvent(input$show, {
    push(title = input$title)
  })
  
}

if (interactive()) 
  shinyApp(ui, server)
