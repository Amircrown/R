library(distr)

#A <- Exp(rate=3)

B <- Gammad(shape=11, scale=1)

conv <- B

plot(conv)
plot(conv,to.draw.arg=1)
