#' Plot the Airbnb Price Distribution
#'
#' Creates a histogram showing the distribution of listing prices.
#'
#' @param x An object of class \code{airbnb}.
#' @param ... Additional arguments passed to \code{ggplot2}.
#'
#' @return A ggplot2 histogram.
#' @export
plot_airbnb <- function(x, ...) {
  data <- x$airbnb

  ggplot2::ggplot(airbnb, ggplot2::aes(price)) +
    ggplot2::geom_histogram(bins = 30) +
    ggplot2::labs(title = "Price Distribution",
                  x = "Price",
                  y = "Count")
}
