#' Extract the date and time of the most recent sequence.
#'
#' @param seqs_dated A DNAbin object with dates.
#' @param seqs_timed A DNAbin object with times.
#'
#' @export
get_present <- function(seqs_dated, seqs_timed) {
  last_date <- max(as.Date(extract_dates(seqs_dated)))
  last_time <- max(as.numeric(extract_times(seqs_timed)))
  return(
    list(
      date = last_date,
      hours = 24 * (last_time %% 1)
    )
  )
}
