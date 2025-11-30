#' Clean Airbnb Dataset
#'
#' @description
#' Cleans and standardizes an Airbnb-style dataset by converting selected
#' columns to numeric, normalizing room type labels, removing impossible values,
#' and preparing the data for downstream analysis or modeling.
#'
#' @details
#' The function performs the following steps:
#' \itemize{
#'   \item Converts key numeric columns (price, rating, reviews, accommodates,
#'         bedrooms, minimum_stay, walk_score, transit_score, bike_score)
#'         to numeric if they exist in the dataset.
#'   \item Suppresses conversion warnings (e.g., when non-numeric strings appear).
#'   \item Standardizes the `room_type` column by lowercasing and trimming
#'         whitespace.
#'   \item Re-labels "entire home" as "entire home/apt" for consistency with
#'         common Airbnb formats.
#'   \item Removes listings with `price <= 0`.
#' }
#'
#' @param data A data frame containing Airbnb listing data. Must include at least
#'   a `price` column; other columns are optional.
#'
#' @return
#' A cleaned data frame with standardized numeric columns, normalized room type
#' labels, and invalid price entries removed.
#'
#' @examples
#' \dontrun{
#' cleaned <- clean_airbnb(raw_airbnb_data)
#' }
#'
#' @export
clean_airbnb <- function(data) {

  numeric_cols <- c("price","rating","reviews","accommodates",
                    "bedrooms","minimum_stay",
                    "walk_score","transit_score","bike_score")

  for (col in numeric_cols) {
    if (col %in% names(data)) {
      data[[col]] <- suppressWarnings(as.numeric(data[[col]]))
    }
  }

  data$room_type <- tolower(trimws(data$room_type))
  data$room_type[data$room_type == "entire home"] <- "entire home/apt"

  data <- data[data$price > 0, ]
  data
}
