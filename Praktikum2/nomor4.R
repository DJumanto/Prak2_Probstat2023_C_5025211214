data <- read.csv("GTL.csv")
library(ggplot2)
ggplot(data, aes(x = Temp, y = Light, color = Glass)) +
  geom_point() +
  labs(x = "Temperature (°C)", y = "Light Output", color = "Glass")