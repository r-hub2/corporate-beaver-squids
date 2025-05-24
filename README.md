
<!-- badges: start -->

[![Version on
CRAN](https://www.r-pkg.org/badges/version/squids?color=brightgreen)](https://cran.r-project.org/package=squids)
[![Version on
CRAN](https://cranlogs.r-pkg.org/badges/last-month/squids?color=brightgreen)](https://cran.r-project.org/package=squids)
[![Version on
CRAN](https://cranlogs.r-pkg.org/badges/grand-total/squids?color=brightgreen)](https://cran.r-project.org/package=squids)
<!-- badges: end -->

# <img src='man/figures/squids-hex-logo.png' style="float:right;width:200px" /> squids 📦

squids: Short Quasi-Unique Identifiers (‘SQUIDs’)

The pkgdown website for this project is located at
<https://squids.opens.science>.

<!--------------------------------------------->

<!-- Start of a custom bit for every package -->

<!--------------------------------------------->

It is often useful to produce short, quasi-unique identifiers (‘SQUIDs’)
without the benefit of a central authority to prevent duplication.
Although ‘UUIDs’ provide for this, these are also unwieldy; for example,
the most used ‘UUID’, version 4, is 36 characters long. SQUIDs are short
at the expense of having more collisions. This can be mitigated by
combining them with human-produced suffixes, yielding relatively brief,
half human-readable, almost-unique identifiers. This package contains
functions to produce ‘SQUIDs’ as well as convert them back into dates
and times.

<!--------------------------------------------->

<!--  End of a custom bit for every package  -->

<!--------------------------------------------->

## Installation

You can install the released version of `squids` from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages('squids');
```

You can install the development version of `squids` from
[Codeberg](https://codeberg.org/) with:

``` r
remotes::install_git('https://codeberg.org/r-packages/squids');
```

(assuming you have `remotes` installed; otherwise, install that first
using the `install.packages` function)
