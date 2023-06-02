data <- read.csv("GTL.csv")

qplot(x = Temp, y = Light, geom = "point", data = data) + facet_grid(.~Glass, labeller = label_both)

data$Glass <- as.factor(data$Glass)
data$Temp <- as.factor(data$Temp)

anova <- aov(Light~Glass*Temp, data=data)
summary(anova)

library(dplyr)
summary <- group_by(data, Glass, Temp) %>% summarise(mean = mean(Light), sd = sd(Light)) %>% arrange(desc(mean))
summary
