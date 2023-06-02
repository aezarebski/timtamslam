#' Extract the dates from the names of sequences in a DNAbin object
#'
#' @param seqs A DNAbin object
#'
extract_dates <- function(seqs) {
  stopifnot(class(seqs) == "DNAbin")
  yyyy_mm_dd_regex <- "[0-9]{4}-[0-9]{2}-[0-9]{2}"
  strs <- names(seqs)
  r_obj <- regexpr(yyyy_mm_dd_regex, strs)
  return(regmatches(strs, r_obj))
}
