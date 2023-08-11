test_that("basic example", {

  ## Test the function on a larger simulated dataset to check it
  ## produces the expected output.
  path_input_1 <- system.file("testdata",
                            "demo-sequences.fasta",
                            package = "timtamslamR")
  expect_true(file.exists(path_input_1))
  path_input_2 <- system.file("testdata",
                            "demo-sequences-extra.fasta",
                            package = "timtamslamR")
  expect_true(file.exists(path_input_2))
  path_output <- system.file("testdata",
                             "demo-sequences-time-stamped.fasta",
                             package = "timtamslamR")
  expect_true(file.exists(path_output))

  seqs_calendar_1 <- read_fasta(path_input_1)
  seqs_times_a_1 <- rename_dates_to_times_a(seqs_calendar_1)

  seqs_calendar_2 <- read_fasta(path_input_2)
  seqs_times_a_2 <- rename_dates_to_times_a(seqs_calendar_2)

  seqs_target <- read_fasta(path_output)

  expect_equal(extract_times(seqs_times_a_2), extract_times(seqs_times_a_1))
  expect_equal(names(seqs_times_a_2), names(seqs_target))
  expect_equal(names(seqs_times_a_1), names(seqs_target))
})
