price_by_roomtype <- function(data) {
  aggregate(price ~ room_type, data, mean, na.rm = TRUE)
}
