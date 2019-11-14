### R/grime: Handling soil property data

[![Build Status](https://travis-ci.org/jyumbya/grime.svg?branch=master)](https://travis-ci.org/jyumbya/grime)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/grime)](https://cran.r-project.org/package=grime)

[John Mutua](https://jyumbya.github.io)

[R/grime](https://jyumbya.github.io/grime) is an [R](https://www.r-project.org) package handling soil property data.

#### Installation

Install R/grime from CRAN using

```r
install.packages("grime")
```

Alternatively, install it from its
[GitHub repository](https://github.com/jyumbya/grime). You first need to
install the [R/grime](https://github.com/jyumbya/grime),
and [devtools](https://github.com/hadley/devtools) packages.

```r
install.packages(c("grime", "devtools"))
```

Then install R/grime using the `install_github` function in the
[devtools](https://github.com/hadley/devtools) package.

```r
library(devtools)
install_github("jyumbya/grime")
```

#### Example use

Try the following example, which extract two soil properties
i.e. 'soil carbon' and 'soil pH' from SoilGrids.

```r
library(grime)
x <- 37.437971
y <- -1.86698
z <-"Matwiku"
pnts <- defineLocation(x,y,z)
a <- c()
slist <- defineSoilProperties(a)
soil_properties <- extractSoilsProperties(slist, pnts)
soil_properties
```

#### Licenses

The R/grime package as a whole is distributed under
[GPL-3 (GNU General Public License version 3)](https://www.gnu.org/licenses/gpl-3.0.en.html).
