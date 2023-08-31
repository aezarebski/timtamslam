#' Spread the weekly counts uniformly into a daily time series.
#'
#' @param weekly_df A data frame with columns: `week_start',
#'   `week_end', and `count'.
#'
#' @return A data frame with columns: `date' and `count'.
#'
#' @export
spread_across_days <- function(weekly_df) {

  spread_vecs <-
    list(
      c(0,0,0,0,0,0,0),
      c(0,0,0,1,0,0,0),
      c(0,0,0,1,1,0,0),
      c(0,0,1,1,1,0,0),
      c(0,0,1,1,1,1,0),
      c(0,1,1,1,1,1,0),
      c(0,1,1,1,1,1,1),
      c(1,1,1,1,1,1,1)
    )

  daily_df <- data.frame()

  for (ix in seq_len(nrow(weekly_df))) {
    week_start <- weekly_df$week_start[ix]
    week_end <- weekly_df$week_end[ix]
    count <- weekly_df$count[ix]

    days <- week_start + lubridate::days(0:6)
    stopifnot(week_end == days[7])

    if (count <= 7) {
      counts <- spread_vecs[[count + 1]]
    } else {
      counts <-  rep(floor( count / 7 ), 7) + spread_vecs[[count %% 7 + 1]]
    }

    daily_df <-
      rbind(daily_df, data.frame(date = days, count = counts))
  }

  return(daily_df)
}
