#' Plot Price by Room Type
#'
#' Creates a boxplot showing price differences by room type.
#'
#' @param object An object of class \code{airbnb}.
#' @param ... Additional arguments passed to ggplot2.
#'
#' @return A ggplot2 boxplot.
#' @export
plot_roomtype <- function(object, ...) {
  UseMethod("plot_roomtype")
}

#' @export
plot_roomtype.airbnb <- function(object, ...) {
  data <- object$airbnb
  ggplot2::ggplot(airbnb, ggplot2::aes(room_type, price)) +
    ggplot2::geom_boxplot() +
    ggplot2::labs(title = "Price by Room Type",
                  x = "Room Type",
                  y = "Price")
}
