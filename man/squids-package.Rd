% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/squids-package.R
\docType{package}
\name{squids-package}
\alias{squids-package}
\title{Short Quasi-Unique Identifiers ('SQUIDs')}
\description{
It is often useful to produce short, quasi-unique
identifiers ('SQUIDs') without the benefit of a central authority to
prevent duplication. Although 'UUIDs' provide for this, these
are also unwieldy; for example, the most used 'UUID', version 4, is 36
characters long. 'SQUIDs' are short at the expense of having more collisions.
This can be mitigated by combining them with huamn-produced suffixes,
yielding relatively brief, half human-readable, almost-unique identifiers.
This package contains functions to produce 'SQUIDs' as well as convert them
back into dates and times.
}
\details{
SQUIDs are defined as 8-character strings that express a timestamp (the
number of centiseconds that passed since the UNIX Epoch) in a base 30
decimal system. The lowest possible SQUID, therefore, is \code{00000001} (which
corresponds to 1970-01-01 00:00:00 UTC), and the highest possible SQUID is
\code{zzzzzzzz}, which corresponds to 2177-11-28 11:59:59 UTC.
\subsection{The base 30 system}{

The characters used in SQUIDs are Arabic digits (0-9) and (lowercase)
Latin letters, omitting vowels. This yields the sequence listed at the
bottom of this page. This means that in the base 30 system used by SQUIDs:
\itemize{
\item "10" represents "30" in the decimal system;
\item "3b" represents "100" in the decimal system (which, for SQUIDs,
corresponds to 100 centiseconds, so one second);
\item "6n0" represents "6000" in the decimal system (corresponding to
one minute);
\item "fb00" represents "360000" in the decimal system (corresponding
to one hour);
\item "bn00" represents "8640000" in the decimal system (corresponding
to one day);
}
}

\subsection{Avoiding collisions}{

Because SQUIDs represent centiseconds, if you generate two or more sequences
of SQUIDs in quick succession, these will likely overlap (i.e. contain the
same SQUIDs, called "collisions" in "identifier speak").

For example, if you produce a sequence of 1000 SQUIDs, this covers an
interval of 10 seconds, and if you produce a sequence of 6000 SQUIDs, this
covers an interval of one minute. This means that if you request 6000 SQUIDs
and after 30 seconds request another 6000 SQUIDs, and assuming you use the
default \code{origin} of the current time, the last 3000 SQUIDs of the first
sequence and the first 3000 SQUIDs of the second sequence will be the same.

To avoid this, \code{{squids}} allows you to specify a sequence of SQUIDs that
you want your new SQUIDs to follow using the \code{follow} argument. You can
also follow the first sequence of SQUIDs at a distance, using the \code{followBy}
argument; if you specify one or more SQUIDs in the \code{follow} argument, and
if you specify \code{followBy = 1000}, the new sequence of SQUIDs will have an
origin 1001 centiseconds after the last SQUID in the sequence you passed in
\code{follow}.
}

\subsection{The SQUID "digits"}{

These are the 30 SQUID "digits" (on the right) and their corresponding
value in the base 10 decimal system (on the left).

\if{html}{\out{<div class="sourceCode">}}\preformatted{ 0 = 0
 1 = 1
 2 = 2
 3 = 3
 4 = 4
 5 = 5
 6 = 6
 7 = 7
 8 = 8
 9 = 9
10 = b
11 = c
12 = d
13 = f
14 = g
15 = h
16 = j
17 = k
18 = l
19 = m
20 = n
21 = p
22 = q
23 = r
24 = s
25 = t
26 = w
27 = x
28 = y
29 = z
}\if{html}{\out{</div>}}
}
}
\seealso{
Useful links:
\itemize{
  \item \url{https://squids.opens.science}
  \item Report bugs at \url{https://codeberg.org/R-packages/squids/issues}
}

}
\author{
\strong{Maintainer}: Gjalt-Jorn Peters \email{squids@opens.science} (\href{https://orcid.org/0000-0002-0336-9589}{ORCID})

}
\keyword{internal}
