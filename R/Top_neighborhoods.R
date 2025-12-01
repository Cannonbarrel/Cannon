#' Get Top Neighborhoods by a Given Score
#'
#' Returns the highest-scoring neighborhoods (walk, transit, or bike score).
#'
#' @param object An object of class \code{airbnb}.
#' @param score Character string naming the score column (e.g., "walk_score").
#' @param n Number of neighborhoods to return.
#' @param ... Additional arguments (unused).
#'
#' @return A data frame of top neighborhoods and their average scores.
#' @export
top_neighborhoods <- function(object, ...) {
  UseMethod("top_neighborhoods")
}

#' @export
top_neighborhoods.airbnb <- function(object, score = "walk_score", n = 10, ...) {
  data <- object$airbnb

  if (!score %in% names(airbnb)) stop("Score column not found.")

  means <- aggregate(airbnb[[score]] ~ airbnb$neighborhood,
                     FUN = mean, na.rm = TRUE)
  colnames(means) <- c("neighborhood", score)

  means[order(means[[score]], decreasing = TRUE), ][1:n, ]
}
