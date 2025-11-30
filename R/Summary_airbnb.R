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
summary_airbnb(airbnb)
