#' Detect Price Outliers in Airbnb Listings
#'
#' Adds an \code{outlier} column using the 1.5×IQR rule.
#'
#' @param object An object of class \code{airbnb}.
#' @param ... Additional arguments (unused).
#'
#' @return The same \code{airbnb} object, with an added \code{outlier} column.
#' @export
detect_outliers.airbnb <- function(object, ...) {
  data <- object$airbnb

  Q1 <- quantile(airbnb$price, 0.25, na.rm = TRUE)
  Q3 <- quantile(airbnb$price, 0.75, na.rm = TRUE)
  IQR <- Q3 - Q1

  lower <- Q1 - 1.5 * IQR
  upper <- Q3 + 1.5 * IQR

  airbnb$outlier <- airbnb$price < lower | airbnb$price > upper
  object$airbnb <- airbnb
  object
}
