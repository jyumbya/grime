require(raster)
require(GSIF)

#' @title Create a spatial point dataframe
#'
#' @description Create a spatial point dataframe
#'
#' @param lat Latitude in decimal degrees
#'
#' @param lon Longitude in decimal degrees
#'
#' @param id Character containing name of location, ID etc
#'
#' @importFrom sp SpatialPoints
#'
#' @importFrom sp CRS
#'
#' @examples
#' library(sp)
#' lon <- 37.437971
#' lat <- -1.86698
#' id <-"Matwiku"
#' pnts <- defineLocation(lon, lat, id)
#' pnts
#'
#' @export

defineLocation <- function(lon, lat, id) {

  # x=long, y=lat, z=id(string)
  lon <- as.numeric(lon)  # convert x from characters to numeric

  lat <- as.numeric(lat)  # convert and y from characters to numeric

  pts <- data.frame(lon = lon, lat = lat, id = id)  # dataframe

  # create a spatialpoints
  SpatialPoints(pts[, c("lon", "lat")], proj4string = CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))

}


#' @title Create class for SoilGrids REST API
#'
#' @description Create class for SoilGrids REST API
#'
#' @param ls Vector containing list of soil properties to extract (ORCDRC, PHIHOX)
#'
#' @return list
#'
#' @importFrom GSIF REST.SoilGrids
#'
#' @examples
#' library(GSIF)
#' ls <- c("ORCDRC", "PHIHOX")
#' slist <- defineSoilProperties(ls)
#' slist
#'
#' @export

defineSoilProperties <- function(ls) {

  REST.SoilGrids(c(ls))

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
#' library(rjson)
#' library(sp)
#' lon <- 37.437971
#' lat <- -1.86698
#' id <-"Matwiku"
#' pnts <- defineLocation(lon, lat, id)
#' ls <- c("ORCDRC", "PHIHOX")
#' slist <- defineSoilProperties(ls)
#' soil_properties <- extractSoilsProperties(slist, pnts)
#' soil_properties
#'
#' @export

extractSoilProperties <- function(slist, pnts) {

  over(slist, pnts)

}
