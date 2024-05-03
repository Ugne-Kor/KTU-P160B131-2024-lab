install.packages("tidyverse")
install.packages("rjson")
install.packages("jsonlite")

library(tidyverse)
library(rjson)
library(jsonlite)

cat("Darbinė direktorija:", getwd())
download.file("https://atvira.sodra.lt/imones/downloads/2023/monthly-2023.csv.zip", "../data/temp")
unzip("../data/temp",  exdir = "../data/")

data <- fromJSON("../data/monthly-2023.json")
data =data %>%
  filter(`ecoActCode` == '522920') %>%
  saveRDS("../data/duomenys.rds")

file.remove("../data/temp")
file.remove("../data/monthly-2023.csv")
