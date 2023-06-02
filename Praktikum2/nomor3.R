tsum.test(mean.x=3.64, s.x = 1.67, n.x = 20, mean.y =2.79 , s.y = 1.5 , n.y=27, alternative = "two.side", var.equal = TRUE)

library(mosaic)
plotDist(dist = 't', df = 2, col ='red')

qchisq(p = 0.05, df = 2, lower.tail = FALSE)