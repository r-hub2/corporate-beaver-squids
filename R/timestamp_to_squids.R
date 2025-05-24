#' @rdname squids
#' @export
timestamp_to_squids <- function(x) {

  if (is.null(x) || all(is.na(x))) {
    return(x);
  }

  if (!is.numeric(x)) {
    stop("As `x`, you have to pass a numeric vector. You passed a vector of ",
         "class ", vecTxt(class(x)), ".");
  }

  timeNrString <- as.character(round(as.numeric(x) * 100, 0));

  res <-
    unlist(lapply(timeNrString,
                  numericToBase30));

  class(res) <- c("squids", class(res));

}
