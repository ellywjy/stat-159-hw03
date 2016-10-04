
library(ggplot2)
ad_data <- read.csv("data/Advertising.csv")

sink("data/eda-output.txt")
cat("Summary Statistics for TV:")
summary(ad_data$TV)
cat("Summary Statistics for Sales:")
summary(ad_data$Sales)
sink()

ggplot(ad_data) + geom_histogram(aes(TV))
ggsave("images/histogram-tv.png")
ggsave("images/histogram-tv.pdf")

ggplot(ad_data) + geom_histogram(aes(Sales))
ggsave("images/histogram-sales.png")
ggsave("images/histogram-sales.pdf")
