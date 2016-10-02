
library(ggplot2)
ad_data <- read.csv("data/Advertising.csv")

ad_summary <- summary(ad_data)
sink("data/eda-output.txt", type = ad_summary)

ggplot(ad_data) + geom_histogram(aes(TV))
ggsave("images/histogram-tv.png")

ggplot(ad_data) + geom_histogram(aes(Sales))
ggsave("images/histogram-sales.png")

