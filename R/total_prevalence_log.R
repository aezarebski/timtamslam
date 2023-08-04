#' @title Compute the Total Prevalence from the History Sizes and Lineage Through Time (LTT)
#'
#' @description This function computes the total prevalence using both
#'   the history sizes and the lineage-through-time (LTT) data. It
#'   checks for consistency between the samples in the input log and
#'   trees, as well as between the history sizes in the log and the
#'   model.
#'
#' @param beast2_log A data frame containing the samples. The column
#'   names should include "Sample" and "HistorySize" followed by the
#'   history sizes.
#'
#' @param beast2_trees An `ape::multiPhylo` object containing the trees.
#'
#' @param beast2_model The BEAST2 model obtained from `read_beast2_xml`.
#'
#' @details This function operates iteratively, adding the
#'   Lineage-Through-Time (LTT) at each history time to the
#'   corresponding history size from the log for each sample. The
#'   output is a data frame structured similarly to the input log,
#'   with the exception that "HistorySizes" is replaced with
#'   "Prevalence" in the column names. It's important to note that
#'   this function expects the `beast2_trees` to have names with the
#'   sample number appended after an underscore, which is the default
#'   output format from BEAST2.
#'
#' @seealso
#' \code{\link{get_ltt}}
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
