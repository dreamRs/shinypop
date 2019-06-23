
#' @rdname noty
#' @export
#' @importFrom htmltools tags attachDependencies
use_noty <- function() {
  attachDependencies(
    x = tags$div(class = "noty-deps"),
    value = list(
      noty_dependencies(),
      shinynoty_dependencies(),
      animate_dependencies()
    )
  )
}


#' @rdname notie
#' @export
#' @importFrom htmltools tags attachDependencies
use_notie <- function() {
  attachDependencies(
    x = tags$div(class = "notie-deps"),
    value = list(
      notie_dependencies(),
      shinynoty_dependencies()
    )
  )
}

#' @rdname notie
#' @export
#' @importFrom htmltools tags attachDependencies
use_push <- function() {
  attachDependencies(
    x = tags$div(class = "push-deps"),
    value = list(
      push_dependencies(),
      shinynoty_dependencies()
    )
  )
}


#' @param position Position of notification : \code{"right-top"},
#'  \code{"right-bottom"}, \code{"left-top"}, \code{"left-bottom"}.
#' @param timeout Milliseconds to hide the Notifications. Tip: 3000 ms = 3 seconds.
#' @param closeButton If you want to add a close button to notifications
#'  you can set this option to \code{TRUE} (Notifications with close
#'  button will not disappear until they are clicked.)
#' @param messageMaxLength Ignores characters of the message text after the specified number.
#' @param width Changes the width. You can use "px" or "\%". Default to \code{"280px"}.
#'
#' @rdname notiflix-notify
#' @export
#' @importFrom htmltools tags attachDependencies
#' @importFrom jsonlite toJSON
use_notiflix_notify <- function(position = c("right-top", "right-bottom", "left-top", "left-bottom"),
                                timeout = 3000, closeButton = FALSE, messageMaxLength = 110, width = "280px") {
  position <- match.arg(position)
  attachDependencies(
    x = tags$div(
      class = "notiflix-deps",
      tags$script(
        id = "notiflix-notify-config",
        type = "application/json",
        `data-for` = "notiflix-notify-config",
        toJSON(dropNulls(list(
          position = position,
          timeout = timeout,
          closeButton = closeButton,
          messageMaxLength = messageMaxLength,
          width = width
        )), auto_unbox = TRUE, json_verbatim = TRUE)
      )
    ),
    value = list(
      notiflix_dependencies(),
      shinynoty_dependencies()
    )
  )
}


