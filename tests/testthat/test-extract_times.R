test_that("basic example", {

  ## Test the function on a larger simulated dataset to check it
  ## produces the expected output. The only difference between these
  ## FASTA files is that the meta data in the sequence identifiers is
  ## slightly different. It should not effect the times of the
  ## sequences so the results should be the same.
  path_input_1 <- system.file("testdata",
                            "demo-sequences.fasta",
                            package = "timtamslamR")
  expect_true(file.exists(path_input_1))
  seqs_calendar_1 <- read_fasta(path_input_1)
  seqs_times_a_1 <- rename_dates_to_times_a(seqs_calendar_1)

  path_input_2 <- system.file("testdata",
                            "demo-sequences-extra.fasta",
                            package = "timtamslamR")
  expect_true(file.exists(path_input_2))
  seqs_calendar_2 <- read_fasta(path_input_2)
  seqs_times_a_2 <- rename_dates_to_times_a(seqs_calendar_2)

  expect_true(
    all(
      extract_times(seqs_times_a_2) == extract_times(seqs_times_a_1)
    )
  )

  ## Include a test with the older regex to demonstrate the problem
  ## and demonstrate how to get the old behaviour from this function.
  expect_false(
    all(
      extract_times(seqs_times_a_2, "[0-9]+\\.[0-9]*") == extract_times(seqs_times_a_1) # nolint
    )
  )

  path_output <- system.file("testdata",
                             "demo-sequences-time-stamped.fasta",
                             package = "timtamslamR")
  expect_true(file.exists(path_output))
  seqs_target <- read_fasta(path_output)
  expect_equal(names(seqs_times_a_1), names(seqs_target))
})
