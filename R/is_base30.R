is_base30 <- is.base30 <- function(x) {

  return(
    grepl(
      paste0("^[", paste0(base30, collapse=""), "]+$"),
      x
    )
  );

}
