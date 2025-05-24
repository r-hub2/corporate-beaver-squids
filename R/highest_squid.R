#' Finding extreme (highest or lowest) SQUIDs
#'
#' @param x A vector of SQUIDs (or a list of vectors, which will be
#' recursively [unlist()]ed).
#'
#' @returns The highest or lowest SQUID
#' @rdname extreme_squids
#' @export
#'
#' @examples squids::highest_squid(
#'   squids::squids(5)
#' );
#'
#' squids::lowest_squid(
#'   squids::squids(5)
#' );
highest_squid <- function(x) {

  if (is.list(x)) {
    x <- unlist(x, recursive = TRUE);
  }

  if (!is.squid(x)) {
    stop("As `x`, you have to pass a vector of SQUIDs (Short Quasi-Unique Identifiers), ",
         "but you passed ", vecTxtQ(x), ".");
  }

  return(
    max(x, na.rm = TRUE)
  );

}
