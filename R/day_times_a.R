#' Compute the forward times within a day to assign with sequences
#' under method A.
#'
#' @param num The number of sequences to assign times to
#'
day_times_a <- function(num) {
  method_a <- function(n, h, t) {
    utils::tail(utils::head(seq(from = 0, to = 1, length = n), h), t)
  }
  if (num %% 2 == 0) {
    return(method_a(num + 2, -1, -1))
  } else {
    return(method_a(num + 3, -2, -1))
  }
}
