library(shiny)
library(shinypop)

ui <- fluidPage(
  tags$h2("Alert with vex example"),
  use_vex(),
  actionButton("launch", "Launch an alert")
)

server <- function(input, output, session) {
  
  observeEvent(input$launch, {
    vex(tags$div(
      style = "text-align: center;",
      tags$h3("Attention"),
      tags$br(),
      tags$p("This alert was sent from the server,"),
      tags$p("probably something went", tags$b("wrong"))
    ))
  })
  
}

if (interactive()) 
  shinyApp(ui, server)
