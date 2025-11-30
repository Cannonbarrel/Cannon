#' Calculate Average Price by Room Type
#'
#' This function calculates the mean price for each room type in a dataset
#' containing Airbnb-style listings. It groups the data by `room_type` and
#' returns the average `price` within each group.
#'
#' @param data A data frame containing at least two columns:
#'   \describe{
#'     \item{price}{Numeric vector representing the price of listings.}
#'     \item{room_type}{Factor or character vector indicating the room type.}
#'   }
#'
#' @return A data frame with two columns:
#'   \describe{
#'     \item{room_type}{The unique room types.}
#'     \item{price}{The average price for each room type.}
#'   }
#'
#' @examples
#' sample_data <- data.frame(
#'   room_type = c("Private room", "Entire home", "Private room"),
#'   price = c(80, 150, 120)
#' )
#' price_by_roomtype(sample_data)
#'
#' @export
price_by_roomtype <- function(data) {
  aggregate(price ~ room_type, data, mean, na.rm = TRUE)
}
