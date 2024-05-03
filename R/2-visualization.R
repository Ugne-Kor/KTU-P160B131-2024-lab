library(tidyverse)
library(ggplot2)

#2.1 užduotis

data = readRDS("../data/692000.rds")
png(file="../img/1_Graph.png", width = 1500, height = 1000)
Histo = hist(data$avgWage, breaks = 200, main = paste("Vidutinio atlyginimo histograma"),
             xlab = "Atlyginimas", ylab = "Kiekis", col = 'green')
dev.off()
