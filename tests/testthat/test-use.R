
get_name <- function(x) {
  unlist(lapply(x, `[[`, "name"))
}



test_that("use_noty works", {
  
  deps <- htmltools::findDependencies(use_noty())
  
  expect_true(length(deps) > 0)
  expect_true("shinypop" %in% get_name(deps))
})


test_that("use_notie works", {
  
  deps <- htmltools::findDependencies(use_notie())
  
  expect_true(length(deps) > 0)
  expect_true("shinypop" %in% get_name(deps))
})


test_that("use_push works", {
  
  deps <- htmltools::findDependencies(use_push())
  
  expect_true(length(deps) > 0)
  expect_true("shinypop" %in% get_name(deps))
})


test_that("use_notiflix_notify works", {
  
  deps <- htmltools::findDependencies(use_notiflix_notify())
  
  expect_true(length(deps) > 0)
  expect_true("shinypop" %in% get_name(deps))
})


test_that("use_notiflix_report works", {
  
  deps <- htmltools::findDependencies(use_notiflix_report())
  
  expect_true(length(deps) > 0)
  expect_true("shinypop" %in% get_name(deps))
})


test_that("use_notiflix_confirm works", {
  
  deps <- htmltools::findDependencies(use_notiflix_confirm())
  
  expect_true(length(deps) > 0)
  expect_true("shinypop" %in% get_name(deps))
})


test_that("use_favico works", {
  
  deps <- htmltools::findDependencies(use_favico())
  
  expect_true(length(deps) > 0)
  expect_true("shinypop" %in% get_name(deps))
})

test_that("use_vex works", {
  
  deps <- htmltools::findDependencies(use_vex())
  
  expect_true(length(deps) > 0)
  expect_true("shinypop" %in% get_name(deps))
})

