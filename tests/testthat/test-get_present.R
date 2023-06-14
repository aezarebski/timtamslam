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
