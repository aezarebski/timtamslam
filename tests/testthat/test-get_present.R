test_that("basic example", {

  ## Test the function on a larger simulated dataset to check it
  ## produces the expected output.
  path_input <- system.file("testdata",
                            "demo-sequences.fasta",
                            package = "timtamslamR")

  seqs_calendar <- read_fasta(path_input)
  seqs_times_a <- rename_dates_to_times_a(seqs_calendar)

  present_val <- get_present(seqs_calendar, seqs_times_a)
  present_goal <- list(
    date = as.Date("2023-08-04"),
    hours = 22.399992
  )

  expect_equal(present_val, present_goal)
})

test_that("simple example", {

  dnabin_size_2 <- ape::as.DNAbin(
    list(
      "leaf_2023-08-04" = c("a", "a"),
      "leaf_2023-08-04" = c("a", "a")
    )
  )
  seqs_size_2 <- rename_dates_to_times_a(dnabin_size_2)
  present_val_size_2 <- get_present(dnabin_size_2, seqs_size_2)
  present_goal_2 <- list(
    date = as.Date("2023-08-04"),
    hours = (2/3) * 24
  )
  expect_equal(present_val_size_2, present_goal_2, tolerance = 1e-6)


  dnabin_size_3 <- ape::as.DNAbin(
    list(
      "leaf_2023-08-04" = c("a", "a"),
      "leaf_2023-08-04" = c("a", "a"),
      "leaf_2023-08-04" = c("a", "a")
    )
  )
  seqs_size_3 <- rename_dates_to_times_a(dnabin_size_3)
  present_val_size_3 <- get_present(dnabin_size_3, seqs_size_3)
  present_goal_3 <- list(
    date = as.Date("2023-08-04"),
    hours = (3/5) * 24
  )
  expect_equal(present_val_size_3, present_goal_3, tolerance = 1e-6)


  dnabin_size_4 <- ape::as.DNAbin(
    list(
      "leaf_2023-08-04" = c("a", "a"),
      "leaf_2023-08-04" = c("a", "a"),
      "leaf_2023-08-04" = c("a", "a"),
      "leaf_2023-08-04" = c("a", "a")
    )
  )
  seqs_size_4 <- rename_dates_to_times_a(dnabin_size_4)
  present_val_size_4 <- get_present(dnabin_size_4, seqs_size_4)
  present_goal_4 <- list(
    date = as.Date("2023-08-04"),
    hours = (4/5) * 24
  )
  expect_equal(present_val_size_4, present_goal_4, tolerance = 1e-6)
})
