#' Return the LTT of the tree at a given time relative to the present.
#'
#' @param x an object like \code{present} to evaluate the LTT at.
#' @param tree the phylo to evaluate the LTT of.
#' @param present an object like that returned by \code{get_present}.
#' @param units a character string specifying the units of the result.
#'
get_ltt <- function(x, tree, present, units) {
  ltt_mat <- ape::ltt.plot.coords(tree)
  bwd_time_interval <-
    lubridate::interval(x$date_time, present$date_time)
  if (units == "days") {
    sec_in_day <- 24 * 60 * 60
    bwd_time <- as.numeric(bwd_time_interval) / sec_in_day
  }

  if (bwd_time < 0) {
    return(0)
  } else {
    ix <- nrow(ltt_mat)
    while (ix > 1) {
      bwd_ltt_time <- -ltt_mat[ix, "time"]
      nxt_bwd_ltt_time <- -ltt_mat[ix - 1, "time"]

      if (bwd_time >= bwd_ltt_time & bwd_time < nxt_bwd_ltt_time) {
        return(as.integer(ltt_mat[ix, "N"]))
      } else {
        ix <- ix - 1
      }
    }
    return(0)
  }
}
