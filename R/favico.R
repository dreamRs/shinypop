
#' @title Notification with favico.js
#' 
#' @description Display a badge in your favicon (displayed in the tab of a browser).
#'
#' @param value Number to display on favicon.
#' @param animation Animation to use : pop, slide, fade, popFade or none.
#' @param position Position : ip, down, left or upleft.
#' @param type Shape : circle or rectangle.
#' @param bgColor Background color.
#' @param textColor Text color.
#' @param session Shiny session.
#'
#' @export
#' 
#' @name favico
#'
#' @examples
#' if (interactive()) {
#'   
#'   library(shiny)
#'   
#'   ui <- fluidPage(
#'     use_favico(),
#'     actionButton("minus", "-1"),
#'     actionButton("plus", "+1")
#'   )
#'   
#'   server <- function(input, output, session) {
#'     
#'     value <- reactiveVal(0) 
#'     
#'     observeEvent(input$minus, {
#'       newValue <- value() - 1
#'       value(newValue)
#'     })
#'     
#'     observeEvent(input$plus, {
#'       newValue <- value() + 1
#'       value(newValue)
#'     })
#'     
#'     observeEvent(value(), {
#'       favico(value())
#'     })
#'   }
#'   
#'   shinyApp(ui, server)
#'   
#' }
favico <- function(value, 
                   animation = c("pop", "slide", "fade", "popFade", "none"),
                   position = c("up", "down", "left", "upleft"),
                   type = c("circle", "rectangle"),
                   bgColor = "#d00", textColor = "#fff", 
                   session = shiny::getDefaultReactiveDomain()) {
  animation <- match.arg(animation)
  position <- match.arg(position)
  type <- match.arg(type)
  session$sendCustomMessage(
    type = "shinypop-favico",
    message = list(
      value = value,
      config = dropNulls(list(
        animation = animation,
        position = position,
        type = type,
        bgColor = bgColor,
        textColor = textColor
      ))
    )
  )
}