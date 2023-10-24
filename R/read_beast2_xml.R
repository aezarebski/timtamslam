#' Read a BEAST2 XML model file.
#'
#' @param filename is the path to the XML file.
#' @param present an object like that returned by \code{get_present}.
#' @param units a character string specifying the units of the result.
#'
#' @export
read_beast2_xml <- function(filename, present, units) {
  if (!file.exists(filename)) {
    stop("BEAST2 XML does not exist: ", filename)
  }

  beast2_model <- xml2::read_xml(filename)

  hist_times_text <-
    xml2::xml_text(
            xml2::xml_find_first(
                    x = beast2_model,
                    xpath = "//parameter[@name='historyTimes']"
                  )
          )
  if (is.na(hist_times_text)) {
    hist_times_num <- NULL
    hist_insts <- NULL
  } else {
    hist_times_num <-
      as.numeric(unlist(strsplit(hist_times_text, " ")))
    if (units == "days") {
      hist_insts <-
        present$date_time - lubridate::ddays(hist_times_num)
    }
  }

  origin_time_num <-
    as.numeric(
      xml2::xml_text(
              xml2::xml_find_first(
                      x = beast2_model,
                      xpath = "//parameter[@name='originTime']"
                    )
            )
    )
  if (units == "days") {
    origin_time <-
      present$date_time - lubridate::ddays(origin_time_num)
  }

  list(
    filename = filename,
    beast2 = beast2_model,
    hist_times = hist_insts,
    present = present,
    origin_time = origin_time,
    units = units
  )
}
