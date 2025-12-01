#' Summary of an Airbnb Object
#'
#' Provides summary statistics for an Airbnb dataset.
#'
#' @param object An object of class \code{airbnb}.
#' @param ... Additional arguments (unused).
#'
#' @return A list containing summary statistics such as average price,
#'   median price, room type counts, and missing values.
#' @export
summary.airbnb <- function(object, ...) {
  data <- object$airbnb
  list(
    n_listings = nrow(airbnb),
    avg_price = mean(airbnb$price, na.rm = TRUE),
    median_price = median(airbnb$price, na.rm = TRUE),
    avg_rating = mean(airbnb$rating, na.rm = TRUE),
    avg_bedrooms = mean(airbnb$bedrooms, na.rm = TRUE),
    room_type_counts = table(airbnb$room_type),
    missing_values = colSums(is.na(airbnb))
  )
}
summary.airbnb(airbnb)
