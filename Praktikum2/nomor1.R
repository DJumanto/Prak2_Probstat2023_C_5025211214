x <- c(78, 75, 67, 77, 70, 72, 78, 70, 77)
y <- c(100, 95, 70, 90, 90, 90, 89, 100, 100)

standarDev <- sd(y-x)
standarDev

tRes <- t.test(y,x, paired=TRUE)
tRes