test_that("basic example", {
  demo_tree <- ape::read.tree(text = "((1:7.0,2:2.0):8.0,3:9.0):55.0;")
  present_ymd_hms <- lubridate::ymd_hms("2023-07-11 18:00:00")
  demo_present <-
    list(date = NULL, hours = NULL, date_time = present_ymd_hms)

  test_instances <- list(
    list(dday = 0.1, val = 1),
    list(dday = 4.9, val = 1),
    list(dday = 5.1, val = 2),
    list(dday = 5.9, val = 2),
    list(dday = 6.1, val = 3),
    list(dday = 7.1, val = 2),
    list(dday = 14.9, val = 2),
    list(dday = 15.1, val = 1),
    list(dday = 70.1, val = 0)
  )

  for (tmp in test_instances) {
    dday <- tmp$dday
    val <- tmp$val
    demo_x <-
      list(date = NULL, hours = NULL,
           date_time = present_ymd_hms - lubridate::ddays(dday))
    expect_equal(get_ltt(demo_x, demo_tree, demo_present, "days"),
                 val)
  }

})
