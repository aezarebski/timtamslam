test_that("names avoid whitespace", {
  ## A small dataset to expose a bug where white space creeps into the
  ## sequence names.
  demo_dnabin <- as.DNAbin(
    list(
      "leaf_2023-06-10" = c("a", "a"),
      "leaf_2023-06-18" = c("a", "a"),
      "leaf_2023-08-04" = c("a", "a"),
      "leaf_2023-08-04" = c("a", "a")
    )
  )

  demo_timed_seqs <- rename_dates_to_times_a(demo_dnabin)
  has_whitespace <-
    !(any(grepl(pattern = " ", x = names(demo_timed_seqs))))
  expect_true(has_whitespace)
})
