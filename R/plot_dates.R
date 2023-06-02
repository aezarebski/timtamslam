#' Plot the number of sequences sampled on each date.
#'
#' @param seqs A DNAbin object
#' @param ... Additional arguments to pass to `plot`
#'
#' @export
plot_dates <- function(seqs, ...) {
  date_table <- table(extract_dates(seqs))
  dates <- as.Date(names(date_table))
  counts <- as.numeric(date_table)
  plot(dates, counts, type = "b",
       xlab = "Date", ylab = "Number of sequences",
       main = "Daily sequence counts", ...)
}
