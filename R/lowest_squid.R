#' @rdname extreme_squids
#' @export
lowest_squid <- function(x) {

  if (is.list(x)) {
    x <- unlist(x, recursive = TRUE);
  }

  if (!is.squid(x)) {
    stop("As `x`, you have to pass a vector of SQUIDs (Short Quasi-Unique Identifiers), ",
         "but you passed ", vecTxtQ(x), ".");
  }

  return(
    min(x, na.rm = TRUE)
  );

}
