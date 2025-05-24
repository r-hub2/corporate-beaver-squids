#' Generate short quasi-unique identifiers (SQUIDs)
#'
#' This function generates short quasi-unique identifiers.
#'
#' SQUIDs are defined as 8-character strings that express a timestamp (the
#' number of centiseconds that passed since the UNIX Epoch) in a base 30
#' decimal system. The lowest possible SQUID, therefore, is `00000001` (which
#' corresponds to 1970-01-01 00:00:00 UTC), and the highest possible SQUID is
#' `zzzzzzzz`, which corresponds to 2177-11-28 11:59:59 UTC.
#'
#' @param x The number of identifiers to generate.
#' @param origin The origin to use when generating the actual
#' identifiers. These identifiers are the present UNIX timestamp
#' (i.e. the number of seconds elapsed since the UNIX epoch,
#' the first of january 1970), accurate to two decimal places
#' (i.e. to centiseconds), converted to the base 30 system using
#' [numericToBase30()]. By default, the present time is used as
#' origin, one one centisecond is added for every identifiers to
#' generate. `origin` can be set to other values to work with
#' different origins (of course, don't use this unless you
#' understand very well what you're doing!).
#' @param follow A vector of one or more SQUIDs (or a list; lists are
#' recursively `unlist()`ed); the highest SQUID will be taken, converted
#' to a timestamp, and used as `origin` (well, 0.01 second later), so that the
#' new SQUIDs will follow that sequence.
#' @param followBy When following a vector of SQUIDs, this can be used to
#' specify the distance between the two vectors in centiseconds.
#'
#' @return A vector of SQUIDs.
#' @rdname squids
#' @export
#'
#' @examples exampleSQUIDs <-
#'   squids::squids(5);
#'
#' ### Show how SQUIDs are the converted date/time
#' squids::squids_to_datetime(
#'   exampleSQUIDs
#' );
#'
#' ### These seem the same, but if we take these as
#' ### timestamps (seconds passed since the UNIX Epoch)
#' ### and multiply with 100 to see the centiseconds,
#' ### we see the differences:
#' as.numeric(
#'   squids::squids_to_datetime(
#'     exampleSQUIDs
#'   )
#' ) * 100;
#'
#' ### Get a sequence following the first one
#' squids::squids(5, follow=exampleSQUIDs);
#'
#' ### Follow at a distance
#' squids::squids(
#'   5,
#'   follow=exampleSQUIDs,
#'   followBy = 3
#' );
squids <- function(x,
                   origin = Sys.time(),
                   follow = NULL,
                   followBy = NULL) {

  if (missing(x)) {
    x <- 1;
  }

  if (is.null(follow)) {

    timeNrString <- as.character(round(as.numeric(origin) * 100, 0));

  } else {

    if (is_squid(follow)) {

      if (is.null(followBy)) {

        followBy <- 1;

      } else {

        if (!is.numeric(followBy)) {
          stop("As `followBy`, you have to pass a single number, but you passed a vector of class ",
               vecTxtQ(class(followBy)), ".");
        }
        if (!(length(followBy) == 1)) {
          stop("As `followBy`, you have to pass a single number, but you passed multiple numbers: ",
               vecTxtQ(followBy), ".");
        }

        followBy <- 1 + followBy;

      }

      timeNrString <-
        as.character(
          round(
            squids_to_timestamp(
              squids::highest_squid(
                follow
              )
            ) * 100,
            0
          ) + followBy
        );

    } else {

      stop("As `follow`, you have to provide one or more SQUIDs. ",
           "However, what you passed doesn't seem to be one of more SQUIDs. ",
           "Instead, you passed ", vecTxtQ(follow), ".");

    }

  }

  timeNrs <-
    as.numeric(timeNrString) + (0:(x-1));

  res <-
    unlist(lapply(timeNrs,
                  numericToBase30));

  class(res) <- c("squids", class(res));

  return(res);

}
