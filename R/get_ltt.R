#' Return the LTT of the tree at a given time relative to the present.
#'
#' @param x a date-time to evaluate the LTT at.
#' @param tree the phylo to evaluate the LTT of.
#' @param present an object like that returned by \code{get_present}.
#' @param units a character string specifying the units of the result.
#' @param origin a date-time to use as the origin of the LTT plot if
#'   you want to manually specify this (default is NULL which
#'   indicates that you trust the value in the root of the tree.)
#'
#' @details There is an option to provide the origin time manually
#'   because if you use ape to read in a tree with a zero root length
#'   it can give strange results for the LTT plot coordinates so you
#'   need to handle this case slightly differently. If no origin is
#'   provided the values in the tree are used as per
#'   \code{ape::ltt.plot.coords}.
#'
get_ltt <- function(x, tree, present, units, origin=NULL) {
  ## TODO This function should take a vector of xs to evaluate the LTT
  ## at but this is not implemented yet.

  ltt_mat <- ape::ltt.plot.coords(tree)

  sec_in_day <- 24 * 60 * 60

  bwd_time_interval <-
    lubridate::interval(x, present$date_time)
  if (units == "days") {
    bwd_time <- as.numeric(bwd_time_interval) / sec_in_day
  }

  if (!is.null(origin)) {
    bwd_time_origin_interval <-
      lubridate::interval(origin, present$date_time)
    if (units == "days") {
      bwd_time_origin <- as.numeric(bwd_time_origin_interval) / sec_in_day
    }
  }

  if (bwd_time < 0) {
    ## This is a time after the present so the LTT must be zero.
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

    ## If this is the case we have gone beyond the tree but not beyond
    ## the origin so at this point the LTT must be 1.
    if (!is.null(origin)) {
      if (bwd_time <= bwd_time_origin) {
        return(1)
      }
    }

    ## If we get here then we are past the root of the tree so the LTT
    ## must be zero.
    return(0)
  }
}
