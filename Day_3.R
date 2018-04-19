# day_3.R

library(fitdistrplus)
library(logspline)

r_norm <- rnorm(n = 1000, mean = 13, sd = 1)

hist(r_norm)
descdist(r_norm, discrete = FALSE, boot = 100)

# uniform data
y <- runif(100)
par(mfrow = c(1, 1))
plot(x = c(1:100), y = y)
hist(y)
descdist(y, discrete = FALSE)


# t-tests -----------------------------------------------------------------


