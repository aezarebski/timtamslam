#' Compute the total prevalence from thie history sizes and LTT.
#'
#' @param beast2_log data frame containing the samples.
#' @param beast2_trees ape::multiPhylo containing the trees.
#' @param beast2_model the BEAST2 model from \code{read_beast2_xml}.
#'
#' @export
total_prevalence_log <- function(beast2_log, beast2_trees,
                                 beast2_model) {
  sample_ints <-
    as.integer(
      sapply(strsplit(names(beast2_trees), "_"),
             function(x) x[2])
    )
  if (!all(sample_ints == beast2_log$Sample)) {
    stop("sample numbers in log and trees do not match")
  }
  hist_col_mask <- grepl("HistorySize", names(beast2_log))
  if (length(beast2_model$hist_times) != sum(hist_col_mask)) {
    stop("number of history sizes in log and model do not match")
  }

  result <- beast2_log[hist_col_mask]
  names(result) <-
    gsub("HistorySizes", "Prevalence", names(result))
  for (jx in seq.int(ncol(result))) {
    for (ix in seq.int(nrow(beast2_log))) {
      result[ix, jx] <- result[ix, jx] + get_ltt(beast2_model$hist_times[jx],beast2_trees[[ix]], beast2_model$present, beast2_model$units)
    }
  }
  result <- cbind(beast2_log["Sample"], result)
  return(result)
}
