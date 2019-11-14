require(raster)
require(GSIF)

#' @title Create a spatial point dataframe
#'
#' @description Create a spatial point dataframe
#'
#' @param y Latitude in decimal degrees
#'
#' @param x Longitude in decimal degrees
#'
#' @param z Character containing name of location, ID etc
#'
#' @importFrom sp SpatialPoints
#'
#' @importFrom sp CRS
#'
#' @examples
#' library(grime)
#' x <- 37.437971
#' y <- -1.86698
#' z <-"Matwiku"
#' pnts <- defineLocation(x,y, z)
#' pnts
#'
#' @export

defineLocation <- function(x, y, z) {

  # x=long, y=lat, z=id(string)
  x <- as.numeric(x)  # convert x from characters to numeric

  y <- as.numeric(y)  # convert and y from characters to numeric

  pts <- data.frame(lon = x, lat = y, id = z)  # dataframe

  # create a spatialpoints
  SpatialPoints(pts[, c("lon", "lat")], proj4string = CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))

}


#' @title Create class for SoilGrids REST API
#'
#' @description Create class for SoilGrids REST API
#'
#' @param a Vector containing list of soil properties to extract (ORCDRC, PHIHOX)
#'
#' @return list
#'
#' @importFrom GSIF REST.SoilGrids
#'
#' @examples
#' library(grime)
#' a <- c("ORCDRC", "PHIHOX")
#' slist <- defineSoilProperties(a)
#' slist
#'
#' @export

defineSoilProperties <- function(...) {

  GSIF::REST.SoilGrids(c(...))

}

#' @title Extract soil properties from soil grids
#'
#' @description Extract soil properties from soil grids
#'
#' @param slist Object of class "list"; contains parameters or REST.SoilGrids query
#'
#' @param pnts  Geometry (locations) of the queries
#'
#' @return dataframe
#'
#' @importFrom sp SpatialPoints
#'
#' @importFrom sp CRS
#'
#' @importFrom sp over
#'
#' @examples
#' library(grime)
#' x <- 37.437971
#' y <- -1.86698
#' z <-"Matwiku"
#' pnts <- defineLocation(x,y,z)
#' a <- c("ORCDRC", "PHIHOX")
#' slist <- defineSoilProperties(a)
#' soil_properties <- extractSoilsProperties(slist, pnts)
#' soil_properties
#'
#' @export

extractSoilsProperties <- function(x, y) {

  sp::over(x, y)

}
