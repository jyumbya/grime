require(raster)
require(GSIF)

#' @title Extract soil property data from SoilGrids.
#'
#' @description Create a spatial point dataframe.
#'
#' @param y Latitude in decimal degrees
#'
#' @param x Longitude in decimal degrees
#'
#' @param z
#'
#' @return spatialpointsdataframe
#'
#' @examples
#' x <- 37.437971
#' y <- -1.86698
#' z <-"Matwiku"
#' pnts <- def_loc(x,y, z)
#'
#' @export

def_loc <- function(x, y, z) {

  # x=long, y=lat, z=id(string)
  x <- as.numeric(x)  # convert x from characters to numeric

  y <- as.numeric(y)  # convert and y from characters to numeric

  pts <- data.frame(lon = x, lat = y, id = z)  # dataframe

  # create a spatial point dataframe
  SpatialPointsDataFrame(pts[, c("lon", "lat")], data = pts, proj4string = CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))

}

#' @description Create class for SoilGrids REST API.
#'
#' @param a
#'
#' @return list
#'
#' @examples
#' a <- c("ORCDRC", "PHIHOX")
#' slist <- soil_list(a)
#'
#' @export

soil_list <- function(...) {

  GSIF::REST.SoilGrids(c(...))

}

#' @description Extract soil properties from soil grids.
#'
#' @param slist
#'
#' @param pnts
#'
#' @return dataframe
#'
#' @examples
#'
#' soil_properties <- extract_soils(slist, pnts)
#'
#' @export

extract_soils <- function(x, y) {

  over(x, y)

}
