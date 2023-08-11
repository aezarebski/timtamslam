#' Extract the dates from the names of sequences in a DNAbin object
#'
#' @param seqs A DNAbin object
#'
#' @param dates_regex A regular expression to extract the date from
#'   the sequence label (optional).
#'
#' @details This function extracts the dates from the names of
#'   sequences in a DNAbin object. The default regular expression is a
#'   date in the format YYYY-MM-DD (e.g. 2015-01-01) at the end of the
#'   name.
#'
extract_dates <- function(seqs, dates_regex = NULL) {
  stopifnot(class(seqs) == "DNAbin")
  .dates_regex <- ifelse(is.null(dates_regex),
                         "[0-9]{4}-[0-9]{2}-[0-9]{2}$",
                         dates_regex)
  strs <- names(seqs)
  r_obj <- regexpr(.dates_regex, strs)
  date_strs <- regmatches(strs, r_obj)
  if (length(date_strs) == length(seqs)) {
    return(date_strs)
  } else {
    stop(c("The dates extracted do not match the sequences\n\n",
           sprintf("\tRegular expression for dates: %s.",
                   .dates_regex)))
  }
}
