#' Return a new DNAbin object with the sequences relabelled with times
#' instead of dates using method A.
#'
#' @param seqs A DNAbin object
#'
#' @param date_regex A regular expression to match the dates in the
#'   sequence labels (optional).
#'
#' @details This uses a uniform distribution of the sequences across a
#'   day such that midday and midnight are kept free. The default
#'   regular expression for finding the dates in the sequence labels
#'   is \code{[0-9]{4}-[0-9]{2}-[0-9]{2}$} (i.e., it assumes that the
#'   date is at the end of the sequence label and is in the format
#'   \code{YYYY-MM-DD}.)
#'
#' @examples
#'
#' path <- system.file("testdata", "demo-sequences.fasta",
#'                     package = "timtamslamR")
#' seqs_calendar <- read_fasta(path)
#' seqs_times_a <- rename_dates_to_times_a(seqs_calendar)
#'
#' @export
rename_dates_to_times_a <- function(seqs, date_regex = NULL) {
  stopifnot(class(seqs) == "DNAbin")
  .date_regex <- ifelse(is.null(date_regex),
                        "[0-9]{4}-[0-9]{2}-[0-9]{2}$",
                        date_regex)
  all_date_strs <- extract_dates(seqs, dates_regex = .date_regex)
  new_times <- fwd_day_times_a(all_date_strs)
  original_names <- names(seqs)
  new_names <- paste(
    gsub(pattern = .date_regex,
         replacement = "",
         x = original_names),
    format(new_times, digits = 6),
    sep = ""
  )
  new_names_cleaned <- gsub(
    pattern = " ",
    replacement = "",
    x = new_names
  )
  names(seqs) <- new_names_cleaned
  return(seqs)
}
