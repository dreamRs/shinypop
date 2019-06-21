
# Animation names

animations <- jsonlite::fromJSON(txt = "inst/assets/animate/animate-config.json", simplifyVector = FALSE)

animations <- purrr::map(animations, function(x) {
  setNames(x, purrr::flatten_chr(x))
})
# purrr::map(x, function(x) paste("animated", x))

usethis::use_data(animations, overwrite = TRUE)
