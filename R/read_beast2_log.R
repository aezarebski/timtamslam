#' Read a BEAST2 log file into a data frame.
#'
#' @param filename is the path to the log file.
#' @param burn is the number to remove from the start.
#' @param take_last is the number to take from the end.
#' @param as_mcmc is a logical indicating whether to return the data
#'   as an mcmc object.
#'
#' @return data frame containing the samples.
#'
#' @export
read_beast2_log <- function(filename, burn = 0, take_last = NA,
                            as_mcmc = FALSE) {
  y <- utils::read.csv(filename, sep = "\t", comment.char = "#")
  if (is.na(take_last) && burn >= 0) {
    result <- utils::tail(y, nrow(y) - burn)
  } else if (!is.na(take_last) && burn == 0) {
    result <- utils::tail(y, take_last)
  } else {
    stop("Unsupported arguments given to read_beast2_log.")
  }

  if (as_mcmc) {
    result <- coda::as.mcmc(result)
  }

  return(result)
}
