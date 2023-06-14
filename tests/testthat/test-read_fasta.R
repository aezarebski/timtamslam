test_that("basic examples work", {

  path <- system.file(
    "testdata", "demo-sequences.fasta",
    package = "timtamslamR"
  )

  seqs <- read_fasta(path)

  testthat::expect_s3_class(seqs, "DNAbin")

})
