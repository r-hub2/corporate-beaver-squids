#' @rdname base30conversion
#' @export
base30toNumeric <- function(x) {

  if (is.null(x) || all(is.na(x))) {
    return(x);
  }

  if (any(!is_base30(x))) {
    stop("As `x`, you have to pass a vector where all elements are base30 expressions. ",
         "However, you passed invalid expressions. You passed: ", vecTxt(x), ".");
  }

  if (length(x) > 1) {
    return(
      unlist(
        lapply(
          x,
          base30toNumeric
        )
      )
    );
  }

  symbols <- rev(strsplit(tolower(x), "")[[1]]);
  res <- 0L;
  for (i in seq_along(symbols)) {
    res <- res + (30^(i-1L) * (which(base30==symbols[i])-1L));
  }
  return(res);
}
