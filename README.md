
# timtamslamR

<!-- badges: start -->
<!-- badges: end -->

Helps you to slam together an analysis.

## Installation

You can install the development version of timtamslamR from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("aezarebski/timtamslamR")
```

## Example

This is a basic example which shows you how to read in a FASTA file
containing dated sequences and then export them with labels that have
times (obtained via method "a").

``` r
library(timtamslamR)

x <- read_fasta("input.fasta")
plot_dates(x)

y <- rename_dates_to_times_a(x)
plot_times(y)

write_fasta(y, "output.fasta")
```
