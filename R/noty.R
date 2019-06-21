


noty <- function(text,
                 timeout = getOption("shinynoty.timeout", default = 1000),
                 type = c("info", "alert", "success", "error", "warning"),
                 layout = c("topRight", "top", "topLeft", "topCenter",
                            "center", "centerLeft", "centerRight",
                            "bottom", "bottomLeft", "bottomCenter",
                            "bottomRight"),
                 theme = c("mint", "sunset", "relax", "nest", "metroui",
                           "semanticui", "light", "bootstrap-v3", "bootstrap-v4"),
                 session = shiny::getDefaultReactiveDomain()) {
  type <- match.arg(type)
  layout <- match.arg(layout)
  theme <- match.arg(theme)
  session$sendCustomMessage(
    type = "shinynoty-noty",
    message = list(
      text = text,
      timeout = timeout,
      type = type,
      layout = layout,
      theme = theme
    )
  )
}
