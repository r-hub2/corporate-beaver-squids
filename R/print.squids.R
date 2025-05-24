#' @export
print.squids <- function(x, ...) {
  cat("\U1F991", vecTxt(x));
  return(invisible(x));
}
