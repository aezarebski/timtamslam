#' Compute the forward times within a day to be assigned to the
#' sequences.
#'
#' @param all_date_strs A character of sampling dates in the format
#'   "YYYY-MM-DD"
#'
fwd_day_times_a <- function(all_date_strs) {
  all_date_Date <- as.Date(all_date_strs)
  date_counts <- table(all_date_strs)
  ds_Date <- as.Date(names(date_counts))
  max_Date <- max(ds_Date)

  tmp <- round(all_date_Date - max_Date)
  tmp <- as.numeric(tmp - min(tmp))
  for (ix in seq_along(ds_Date)) {
    mask <- all_date_strs == ds_Date[ix]
    tmp[mask] <- tmp[mask] + rev(day_times_a(date_counts[ix]))
  }
  return(tmp)
}
