
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





#' @param backgroundColor Changes the background color.
#' @param borderRadius Changes the radius of the corners.
#' @param backOverlay If you don't want to use a colored overlay you can change this option to \code{FALSE}.
#' @param backOverlayColor Changes the color of the overlay. You can use HEX, RGB or RGBA.
#' @param titleFontSize Changes the font-size of the title text.
#' @param titleMaxLength Ignores characters of title text after the specified number.
#' @param messageFontSize Changes the font-size of the message text.
#' @param messageMaxLength Ignores characters of message text after the specified number.
#' @param buttonFontSize Changes the font-size of the button text.
#' @param buttonMaxLength Ignores characters of button text after the specified number.
#' @param cssAnimation Notiflix uses CSS animations to show/hide the Reports.
#'  If you don't want to use CSS animations you can set this option to \code{FALSE}.
#' @param cssAnimationDuration Changes the CSS animations duration as milliseconds. Tip: 360 ms = 0.36 second.
#' @param cssAnimationStyle 2 types of styles you can use: \code{"fade"} and \code{"zoom"}.
#' @param plainText Use only plain text (no HTML tags). Default to \code{FALSE}.
#' @param width Changes the width. You can use "px" or "\%". Default to \code{"280px"}.
#'
#' @rdname notiflix-report
#' @export
#' @importFrom htmltools tags attachDependencies
#' @importFrom jsonlite toJSON
use_notiflix_report <- function(backgroundColor = "#f8f8f8", borderRadius = "25px",
                                backOverlay = TRUE, backOverlayColor = "rgba(0,0,0,0.5)",
                                titleFontSize = "16px", titleMaxLength = 34,
                                messageFontSize = "13px", messageMaxLength = 400,
                                buttonFontSize = "14px", buttonMaxLength = 34,
                                cssAnimation = TRUE, cssAnimationDuration = 360,
                                cssAnimationStyle = c("fade", "zoom"),
                                plainText = FALSE, width = "280px") {
  cssAnimationStyle <- match.arg(cssAnimationStyle)
  attachDependencies(
    x = tags$div(
      class = "notiflix-deps",
      tags$script(
        id = "notiflix-report-config",
        type = "application/json",
        `data-for` = "notiflix-report-config",
        toJSON(dropNulls(list(
          backgroundColor = backgroundColor,
          borderRadius = borderRadius,
          backOverlay = backOverlay,
          backOverlayColor = backOverlayColor,
          titleFontSize = titleFontSize,
          titleMaxLength = titleMaxLength,
          messageFontSize = messageFontSize,
          messageMaxLength = messageMaxLength,
          buttonFontSize = buttonFontSize,
          buttonMaxLength = buttonMaxLength,
          cssAnimation = cssAnimation,
          cssAnimationDuration = cssAnimationDuration,
          cssAnimationStyle = cssAnimationStyle,
          plainText = plainText,
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

