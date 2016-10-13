library(ggplot2)
ad_data <- read.csv("data/Advertising.csv")

regressionTV <- lm(Sales~TV, ad_data)
regressionRadio <- lm(Sales~Radio, ad_data)
regressionNP <- lm(Sales~Newspaper, ad_data)
regressionAll <- lm(Sales ~ TV + Radio + Newspaper, ad_data)

regTV_summary <- summary(regressionTV)
regRadio_summary <- summary(regressionRadio)
regNP_summary <- summary(regressionNP)
regAll_summary <- summary(regressionAll)



png(filename="images/residual-plot.png")
plot(regressionAll,1)
dev.off()

png(filename="images/normal-qq-plot.png")
plot(regressionAll,2)
dev.off()

png(filename="images/scale-location-plot.png")
plot(regressionAll,3)
dev.off()


ggplot(ad_data, aes(TV, Sales)) + geom_point(aes(color = 'coral'), show.legend = FALSE, size = 0.75) + 
  geom_smooth(method=lm, se = FALSE) +
  labs(title = 'Sales vs. TV', x = "TV (thousands of dollars)", y = "Sales (thousands of units)") + 
  theme_bw()

ggsave("images/scatterplot-tv-sales.png")

ggplot(ad_data, aes(Radio, Sales)) + geom_point(aes(color = 'deepskyblue3'), show.legend = FALSE, size = 0.75) + 
  geom_smooth(method=lm, se = FALSE) +
  labs(title = 'Sales vs. Radio', x = "Radio (thousands of dollars)", y = "Sales (thousands of units)") + 
  theme_bw()

ggsave("images/scatterplot-radio-sales.png")

ggplot(ad_data, aes(Newspaper, Sales)) + geom_point(aes(color = 'palegreen'), show.legend = FALSE, size = 0.75) + 
  geom_smooth(method=lm, se = FALSE) +
  labs(title = 'Sales vs. Newspaper', x = "Newspaper (thousands of dollars)", y = "Sales (thousands of units)") + 
  theme_bw()

ggsave("images/scatterplot-newspaper-sales.png")


save(regressionTV,regressionRadio, regressionNP, regressionAll, regTV_summary,regRadio_summary, regNP_summary, regAll_summary
, file = "data/regression.RData")




