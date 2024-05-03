library(tidyverse)
library(ggplot2)

#2.1 užduotis

graph_1 <- ggplot(data = data_clean, aes(x = avgWage)) +
  geom_histogram() +
  labs(y = "Kiekis", x = "Vidutinis atlyginimas", main = "Vidutinio atlyginimo histograma")

ggsave("../img/1_uzd.png", graph_1, width = 3000, height = 1500, units = ("px"))
