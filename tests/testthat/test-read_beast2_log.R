test_that("basic examples work", {

  path <- system.file(
    "testdata", "demo-timtam.log",
    package = "timtamslam"
  )

  log_df <- read_beast2_log(path)

  testthat::expect_s3_class(log_df, "data.frame")

  log_mcmc <- read_beast2_log(
   path,
   as_mcmc = TRUE
   )

  testthat::expect_s3_class(log_mcmc, "mcmc")
})
