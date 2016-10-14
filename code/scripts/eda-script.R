library(ggplot2)

ad_data <- read.csv("data/Advertising.csv")
corr_matrix <- cor(ad_data[-1])
lower <- corr_matrix
lower[lower.tri(corr_matrix, diag =FALSE)] <- ""

sink("data/eda-output.txt")
cat("Summary Statistics for TV:\n")
summary(ad_data$TV)
cat("Summary Statistics for Radio:\n")
summary(ad_data$Radio)
cat("Summary Statistics for Newspaper:\n")
summary(ad_data$Newspaper)
cat("Summary Statistics for Sales:\n")
summary(ad_data$Sales)
cat("\n Correlation Matrix:\n")
lower
sink()

ggplot(ad_data) + geom_histogram(aes(TV))
ggsave("images/histogram-tv.png")

ggplot(ad_data) + geom_histogram(aes(Radio))
ggsave("images/histogram-radio.png")

ggplot(ad_data) + geom_histogram(aes(Newspaper))
ggsave("images/histogram-newspaper.png")

ggplot(ad_data) + geom_histogram(aes(Sales))
ggsave("images/histogram-sales.png")

png(filename="images/scatterplot-matrix.png")
pairs(ad_data[-1],pch=18)
dev.off()

save(lower, file = "data/correlation-matrix.RData")
