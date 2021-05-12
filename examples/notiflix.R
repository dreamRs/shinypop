library(shiny)
library(shinypop)

ui <- fluidPage(
  tags$h2("Notification with notiflix.js"),
  use_notiflix_notify(position = "right-bottom"),
  actionButton("success", "Show success", class = "btn-success"),
  actionButton("error", "Show error", class = "btn-danger"),
  actionButton("info", "Show info", class = "btn-info"),
  actionButton("warning", "Show warning", class = "btn-warning")
)

server <- function(input, output, session) {
  
  observeEvent(input$success, {
    nx_notify_success("Yes :)")
  })
  
  observeEvent(input$error, {
    nx_notify_error("Oups...")
  })
  
  observeEvent(input$info, {
    nx_notify_info("For information")
  })
  
  observeEvent(input$warning, {
    nx_notify_warning("Careful !!!")
  })
  
}

if (interactive()) 
  shinyApp(ui, server)
