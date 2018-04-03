# Confidence intervals




A confidence interval (CI) tells us within what range we may be certain to find the true mean from which any sample has been taken. To calculate a confidence interval requires three things:  


```r
# First we set the sample mean
sample_mean <- 10

# Then the sample standard deviation
sample_sd <- 2

# Then the number of samples
sample_n <- 20
```

Once we know these things we must then use the following formula to calculate th CI:


```r
error <- qnorm(0.975)*sample_sd/sqrt(sample_n)
```

With the CI known, we then substract/add it from the sample mean in order to find the upper and lower limits:


```r
lower <- sample_mean-error
upper <- sample_mean+error
lower
```

```
R> [1] 9.123477
```

```r
upper
```

```
R> [1] 10.87652
```
