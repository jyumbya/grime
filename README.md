[![Build Status](https://travis-ci.org/jyumbya/grime.svg?branch=master)](https://travis-ci.org/jyumbya/grime)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/grime)](https://cran.r-project.org/package=grime)

[grime](https://jyumbya.github.io/grime) is an [R](https://www.r-project.org) package handling soil property data.

#### Installation

First install [devtools](https://github.com/hadley/devtools) package

```r
library(devtools)
install.packages("devtools")
```

Then install `grime` using the `install_github` function

```r
library(devtools)
install_github("jyumbya/grime")
```

#### Example use

Try the following example, which extract two soil properties
i.e. 'soil carbon' and 'soil pH' from SoilGrids.

```r
library(grime)
lon <- 37.437971
lat <- -1.86698
id <-"Matwiku"
pnts <- defineLocation(lon, lat, id)
ls <- c("ORCDRC", "PHIHOX")
slist <- defineSoilProperties(ls)
soil_properties <- extractSoilsProperties(slist, pnts)
soil_properties
```

#### Licenses

The R/grime package as a whole is distributed under
[GPL-3 (GNU General Public License version 3)](https://www.gnu.org/licenses/gpl-3.0.en.html).
