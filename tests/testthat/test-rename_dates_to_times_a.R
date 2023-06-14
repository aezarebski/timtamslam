test_that("names avoid whitespace", {
  ## A small dataset to expose a bug where white space creeps into the
  ## sequence names.
  demo_dnabin <- ape::as.DNAbin(
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

test_that("basic example", {

  ## Test the function on a larger simulated dataset to check it
  ## produces the expected output.
  path_input <- system.file("testdata",
                            "demo-sequences.fasta",
                            package = "timtamslamR")
  expect_true(file.exists(path_input))
  path_output <- system.file("testdata",
                             "demo-sequences-time-stamped.fasta",
                             package = "timtamslamR")
  expect_true(file.exists(path_output))
  seqs_calendar <- read_fasta(path_input)
  seqs_times_a <- rename_dates_to_times_a(seqs_calendar)

  seqs_target <- read_fasta(path_output)

  expect_equal(names(seqs_times_a), names(seqs_target))
})
