#' Plot the time series of sequences.
#'
#' @param seqs A DNAbin object
#' @param ... Additional arguments to pass to `plot`
#'
#' @export
plot_times <- function(seqs, ...) {
  times <- rev(as.numeric(extract_times(seqs)))
  plot(times, (times %% 1), type = "p",
       xlab = "Time (day)", ylab = "Time of day (fractional)",
       main = "Uniformly distributed sequence times", ...)
}
