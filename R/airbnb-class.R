#' Create an Airbnb object (S3 class)
#'
#' Wraps an Airbnb dataset into an S3 object of class \code{"airbnb"}.
#'
#' @param data A data frame containing Airbnb listings.
#'
#' @return An object of class \code{airbnb}.
#' @export
airbnb <- function(data) {
  structure(list(data = data), class = "airbnb")
}
