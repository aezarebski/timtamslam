test_that("basic example", {

  present_val <-
    list(
        date = as.Date("2023-07-11"),
        hours = 18,
        date_time = lubridate::ymd_hms("2023-07-11 18:00:00")
      )

  xml_input <- system.file("testdata",
                           "toy-history-example.xml",
                           package = "timtamslamR")
  log_input <- system.file("testdata",
                           "toy-history-example.log",
                           package = "timtamslamR")
  trees_input <- system.file("testdata",
                             "toy-history-example.trees",
                             package = "timtamslamR")

  beast2_model <- read_beast2_xml(xml_input, present_val, "days")
  post_samples <- read_beast2_log(log_input)
  trees <- read_beast2_trees(trees_input)
  total_prev_vals <-
    total_prevalence_log(post_samples, trees, beast2_model)

  goal_input <- system.file("testdata",
                            "toy-history-example-goal.log",
                            package = "timtamslamR")
  total_prev_goal <- read_beast2_log(goal_input)
  expect_equal(total_prev_vals, total_prev_goal)
})

test_that("example 2", {
  ## This example expands upon the previous one to make sure that the
  ## origin time is accounted for correctly.

  present_val <-
    list(
        date = as.Date("2023-07-11"),
        hours = 18,
        date_time = lubridate::ymd_hms("2023-07-11 18:00:00")
      )

  xml_input <- system.file("testdata",
                           "toy-history-example-2.xml",
                           package = "timtamslamR")
  log_input <- system.file("testdata",
                           "toy-history-example-2.log",
                           package = "timtamslamR")
  trees_input <- system.file("testdata",
                             "toy-history-example-2.trees",
                             package = "timtamslamR")

  beast2_model <- read_beast2_xml(xml_input, present_val, "days")
  post_samples <- read_beast2_log(log_input)
  trees <- read_beast2_trees(trees_input)
  total_prev_vals <-
    total_prevalence_log(post_samples, trees, beast2_model)

  goal_input <- system.file("testdata",
                            "toy-history-example-2-goal.log",
                            package = "timtamslamR")
  total_prev_goal <- read_beast2_log(goal_input)
  expect_equal(total_prev_vals, total_prev_goal)
})
