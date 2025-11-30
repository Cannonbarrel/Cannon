#' Summarize an Airbnb Dataset
#'
#' @description
#' Computes high-level summary statistics for an Airbnb-style dataset, including
#' number of listings, pricing metrics, average rating, average bedrooms, counts
#' of room types, and missing value counts. This function provides a quick
#' overview of the dataset's structure and data quality.
#'
#' @details
#' The summary includes:
#' \itemize{
#'   \item \strong{n_listings}: Number of rows (listings).
#'   \item \strong{avg_price}: Mean price (ignoring missing values).
#'   \item \strong{median_price}: Median price.
#'   \item \strong{avg_rating}: Mean rating.
#'   \item \strong{avg_bedrooms}: Mean number of bedrooms.
#'   \item \strong{room_type_counts}: A frequency table of room types.
#'   \item \strong{missing_values}: Count of missing values per column.
#' }
#'
#' @param airbnb A data frame containing Airbnb listing data. Must include at
#'   least the columns `price`, `rating`, `bedrooms`, and `room_type`.
#'
#' @return
#' A named list containing summary statistics and tables.
#'
#' @examples
#' \dontrun{
#' summary_airbnb(airbnb_data)
#' }
#'
#' @export
summary_airbnb <- function(airbnb) {
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
