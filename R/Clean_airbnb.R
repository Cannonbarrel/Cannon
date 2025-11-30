install.packages("roxygen2")
library(devtools)
devtools::document()
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
