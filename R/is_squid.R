is.squid <- is_squid <- function(x) {

  if (inherits(x, "squids")) {
    return(TRUE);
  } else {
    if (is.character(x)) {
      if (all(nchar(x) == 8)) {
        return(
          all(is_base30(x))
        );
      } else {
        return(FALSE);
      }
    } else {
      return(FALSE);
    }
  }

}
