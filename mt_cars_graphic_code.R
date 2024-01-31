# Libraries
library(dplyr)

# Making sure all data is in a column
mt_cars_all_columns <- mtcars %>% 
  tibble::rownames_to_column("model")
  