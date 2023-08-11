#' Extract the times from the names of sequences in a DNAbin object
#'
#' @param seqs A DNAbin object
#'
#' @param times_regex A regular expression to extract the time from
#'   the sequence label (optional).
#'
#' @details This assumes that the time is expressed as a decimal
#'   number (containing a period) which appears at the end of the
#'   sequence name. There is an optional argument, \code{times_regex}
#'   which can be used to provide an alternative regex to extract the
#'   time.
#'
extract_times <- function(seqs, times_regex = NULL) {
  stopifnot(class(seqs) == "DNAbin")
  TIMES_REGEX <-
    ifelse(is.null(times_regex), "[0-9]+\\.[0-9]*$", times_regex)
  strs <- names(seqs)
  r_obj <- regexpr(TIMES_REGEX, strs)
  return(regmatches(strs, r_obj))
}
