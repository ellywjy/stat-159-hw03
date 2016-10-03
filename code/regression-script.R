library(ggplot2)
ad_data <- read.csv("data/Advertising.csv")

regression <- lm(Sales~TV, ad_data)
reg_summary <- summary(regression)

ggplot(ad_data, aes(TV, Sales)) + geom_point() + geom_smooth(method=lm)
ggsave("images/scatterplot-tv-sales.png")
ggsave("images/scatterplot-tv-sales.pdf")

save(regression, reg_summary, file = "data/regression.RData")



