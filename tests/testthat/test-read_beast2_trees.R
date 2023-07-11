test_that("basic example", {
  path <- system.file(
    "testdata", "toy-history-example.trees",
    package = "timtamslamR"
  )

  trees_mp <- read_beast2_trees(path)

  testthat::expect_s3_class(trees_mp, "multiPhylo")

  testthat::expect_equal(
    length(trees_mp),
    3
  )
})
