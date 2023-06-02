#' Extract the times from the names of sequences in a DNAbin object
#'
#' @param seqs A DNAbin object
#'
extract_times <- function(seqs) {
  stopifnot(class(seqs) == "DNAbin")
  TIMES_REGEX <- "[0-9]+\\.[0-9]*"
  strs <- names(seqs)
  r_obj <- regexpr(TIMES_REGEX, strs)
  return(regmatches(strs, r_obj))
}
