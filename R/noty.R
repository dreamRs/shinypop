
#' @title Notification with noty.js
#'
#' @description Initialize with \code{use_noty} in UI before using \code{noty} server-side.
#'  Close all notifications with \code{noty_close}.
#'
#' @param text Text to display.
#' @param timeout Delay for closing notification in milliseconds (ms).
#'  Set \code{FALSE} for sticky notifications.
#' @param type Type of notification: \code{"alert"}, \code{"success"}, \code{"error"}, \code{"warning"}, \code{"info"}.
#' @param layout Position among : \code{"top"}, \code{"topLeft"}, \code{"topCenter"},
#'  \code{"topRight"}, \code{"center"}, \code{"centerLeft"}, \code{"centerRight"},
#'  \code{"bottom"}, \code{"bottomLeft"}, \code{"bottomCenter"}, "\code{"bottomRight"}.
#' @param theme Theme to use between : \code{"mint"}, \code{"sunset"}, \code{"relax"}, \code{"nest"}, \code{"metroui"},
#'  \code{"semanticui"}, \code{"light"}, \code{"bootstrap-v3"}, \code{"bootstrap-v4"}.
#' @param modal Add an overlay to the page to emphasis notification.
#' @param killer Close all others notification before opening.
#' @param animation_open,animation_close Animation effect, use \code{\link{animations}}.
#' @param session Shiny session.
#'
#' @export
#'
#' @importFrom shiny getDefaultReactiveDomain
#'
#' @name noty
#'
#' @examples
#' if (interactive()) {
#'
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     tags$h2("noty example"),
#'     use_noty(),
#'     splitLayout(
#'       radioButtons(
#'         inputId = "type",
#'         label = "Type:",
#'         choices = c("info", "alert",
#'                     "success", "error",
#'                     "warning")
#'       ),
#'       radioButtons(
#'         inputId = "layout",
#'         label = "Layout:",
#'         choices = c("topRight", "top",
#'                     "topLeft", "topCenter",
#'                     "center", "centerLeft",
#'                     "centerRight", "bottom",
#'                     "bottomLeft", "bottomCenter",
#'                     "bottomRight")
#'       ),
#'       radioButtons(
#'         inputId = "theme",
#'         label = "Theme:",
#'         choices = c("mint", "sunset",
#'                     "relax", "nest",
#'                     "metroui", "semanticui",
#'                     "light", "bootstrap-v3",
#'                     "bootstrap-v4")
#'       ),
#'       tags$div(
#'         checkboxInput(
#'           inputId = "killer",
#'           label = "Killer:",
#'           value = FALSE
#'         ),
#'         checkboxInput(
#'           inputId = "modal",
#'           label = "Modal:",
#'           value = FALSE
#'         )
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
#'       noty(
#'         text = "Hello world!",
#'         type = input$type,
#'         layout = input$layout,
#'         theme = input$theme,
#'         modal = input$modal,
#'         killer = input$killer
#'       )
#'     })
#'
#'   }
#'
#'   shinyApp(ui, server)
#'
#' }
noty <- function(text,
                 timeout = getOption("noty.timeout", default = 2000),
                 type = c("info", "alert", "success", "error", "warning"),
                 layout = c("topRight", "top", "topLeft", "topCenter",
                            "center", "centerLeft", "centerRight",
                            "bottom", "bottomLeft", "bottomCenter",
                            "bottomRight"),
                 theme = getOption("noty.theme", default = "sunset"),
                 modal = FALSE, 
                 killer = FALSE,
                 animation_open = NULL,
                 animation_close = NULL,
                 session = shiny::getDefaultReactiveDomain()) {
  type <- match.arg(type)
  layout <- match.arg(layout)
  theme <- match.arg(
    arg = theme,
    choices = c(
      "mint", "sunset", "relax", "nest", "metroui",
      "semanticui", "light", "bootstrap-v3", "bootstrap-v4"
    )
  )
  if (is.null(animation_open)) {
    animation_open <- "noty_effects_open"
  } else {
    animation_open <- paste("animated", animation_open)
  }

  if (is.null(animation_close)) {
    animation_close <- "noty_effects_close"
  } else {
    animation_close <- paste("animated", animation_close)
  }

  session$sendCustomMessage(
    type = "shinypop-noty",
    message = dropNulls(list(
      text = text,
      timeout = timeout,
      type = type,
      layout = layout,
      theme = theme,
      killer = killer,
      modal = modal,
      animation = list(
        open = animation_open,
        close = animation_close
      )
    ))
  )
}

#' @export
#' @rdname noty
noty_close <- function(session = shiny::getDefaultReactiveDomain()) {
  session$sendCustomMessage("shinypop-noty-close", list())
}



#' @title Animation names
#'
#' @description List of all animations provided by 'animate.css' by categories
#'
#' @format A list of lists
#' @source \url{https://github.com/daneden/animate.css/blob/master/animate-config.json}
"animations"

