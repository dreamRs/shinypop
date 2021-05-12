library(shiny)
library(shinypop)

ui <- fluidPage(
  tags$h2("noty example"),
  use_noty(),
  radioButtons(
    inputId = "type",
    label = "Type:",
    choices = c("info", "alert",
                "success", "error",
                "warning"),
    inline = TRUE
  ),
  radioButtons(
    inputId = "layout",
    label = "Layout:",
    choices = c("topRight", "top",
                "topLeft", "topCenter",
                "center", "centerLeft",
                "centerRight", "bottom",
                "bottomLeft", "bottomCenter",
                "bottomRight"),
    inline = TRUE
  ),
  radioButtons(
    inputId = "theme",
    label = "Theme:",
    choices = c("mint", "sunset",
                "relax", "nest",
                "metroui", "semanticui",
                "light", "bootstrap-v3",
                "bootstrap-v4"),
    inline = TRUE
  ),
  checkboxInput(
    inputId = "killer",
    label = "Killer",
    value = FALSE
  ),
  checkboxInput(
    inputId = "modal",
    label = "Modal",
    value = FALSE
  ),
  actionButton(
    inputId = "show",
    label = "Show notification",
    width = "100%"
  )
)

server <- function(input, output, session) {
  
  observeEvent(input$show, {
    noty(
      text = "Hello world!",
      type = input$type,
      layout = input$layout,
      theme = input$theme,
      modal = input$modal,
      killer = input$killer
    )
  })
  
}

if (interactive()) 
  shinyApp(ui, server)