#' @rdname unsquiding
#' @export
squids_to_datetime <- function(x,
                               tz = "UTC") {

  if (!is.squid(x)) {
    stop("As `x`, you have to pass a vector of SQUIDs (Short Quasi-Unique Identifiers), ",
         "but you passed ", vecTxtQ(x), ".");
  }

  x_as_timestamp <- squids::squids_to_timestamp(x);

  x_as_date <-
    as.POSIXct(
      x_as_timestamp,
      origin = "1970-01-01",
      tz = tz
    );

  return(x_as_date);

}
