#' Conversion between base10 and base30
#'
#' The conversion functions from base10 to base30 and vice versa are
#' used by the [squids::squids()] functions.
#'
#' The symbols to represent the 'base 30' system are the 0-9
#' followed by the alphabet without vowels but including the y. This
#' vector is available as `base30`.
#'
#' @param x The vector to convert (numeric for `numericToBase30`,
#'          character for `base30toNumeric`).
#'
#' @return The converted vector (numeric for `base30toNumeric`, character for `numericToBase30`).
#' @name base30conversion
#' @rdname base30conversion
#' @examples squids::numericToBase30(
#'   654321
#' );
#'
#' squids::base30toNumeric(
#'   squids::numericToBase30(
#'     654321
#'   )
#' );
#' @export
numericToBase30 <- function(x) {

  if (is.null(x) || all(is.na(x))) {
    return(x);
  }

  if (!is.numeric(x)) {
    stop("As `x`, you have to pass a numeric vector. You passed a vector of ",
         "class ", vecTxt(class(x)), ".");
  }

  if (length(x) > 1) {
    return(
      unlist(
        lapply(
          x,
          numericToBase30
        )
      )
    );
  }

  result <- character();
  i <- 1L;
  while (x > 0) {
    result[i] <- base30[x %% 30L + 1L];
    i <- i + 1L;
    x <- x %/% 30L;
  }
  res <- paste(rev(result), sep="", collapse="")
  return(res);
}

base30 <- c(0:9,
            'b', 'c', 'd', 'f', 'g',
            'h' ,'j', 'k', 'l', 'm',
            'n', 'p', 'q', 'r', 's',
            't', 'w', 'x', 'y', 'z');
