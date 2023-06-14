#' Return a new DNAbin object with the sequences relabelled with times
#' instead of dates using method A.
#'
#' @param seqs A DNAbin object
#'
#' @details This uses a uniform distribution of the sequences across a
#'   day such that midday and midnight are kept free.
#'
#' @examples
#'
#' path <- system.file("testdata", "demo-sequences.fasta",
#'                     package = "timtamslamR")
#' seqs_calendar <- read_fasta(path)
#' seqs_times_a <- rename_dates_to_times_a(seqs_calendar)
#'
#' @export
rename_dates_to_times_a <- function(seqs) {
  stopifnot(class(seqs) == "DNAbin")
  yyyy_mm_dd_regex <- "[0-9]{4}-[0-9]{2}-[0-9]{2}"
  all_date_strs <- extract_dates(seqs)
  new_times <- fwd_day_times_a(all_date_strs)
  original_names <- names(seqs)
  new_names <- paste(
    gsub(pattern = yyyy_mm_dd_regex,
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
