
library(ggplot2)
ad_data <- read.csv("data/Advertising.csv")

sink("data/eda-output.txt")
summary(ad_data)
sink()

ggplot(ad_data) + geom_histogram(aes(TV))
ggsave("images/histogram-tv.png")

ggplot(ad_data) + geom_histogram(aes(Sales))
ggsave("images/histogram-sales.png")

