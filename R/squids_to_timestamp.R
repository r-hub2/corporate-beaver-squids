#' Converting SQUIDs back to timestamps and dates/times
#'
#' @param x A vector of one or more SQUIDs
#' @param tz The timezone to use
#'
#' @returns A vector of one or more timestamps or `POSIXct` date/time objects
#' @rdname unsquiding
#' @export
#'
#' @examples exampleSQUID <-
#'   squids::squids();
#'
#' ### Timestamp (second since UNIX Epoch,
#' ###            1970-01-01, 00:00:00 UTC)
#' squids::squids_to_timestamp(
#'   exampleSQUID
#' );
#'
#' squids::squids_to_datetime(
#'   exampleSQUID
#' );
#'
#' ### In Central European Time
#' squids::squids_to_datetime(
#'   exampleSQUID,
#'   tz = "CET"
#' );
squids_to_timestamp <- function(x) {

  if (!is.squid(x)) {
    stop("As `x`, you have to pass a vector of SQUIDs (Short Quasi-Unique Identifiers), ",
         "but you passed ", vecTxtQ(x), ".");
  }

  x_as_nr <- squids::base30toNumeric(x);

  x_as_timestamp <- x_as_nr / 100;

  return(x_as_timestamp);

}
