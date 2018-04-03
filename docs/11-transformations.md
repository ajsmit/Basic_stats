# Testing assumptions or: How I learned to stop worrying and transform the data




In this chapter we will learn how to test for the two most common assumptions we will make in the biological sciences.

Our tests for these two assumptions fail often with real data. Therefore, we must often identify the way in which our data are distributed so we may better decide how to transform them in an attempt to coerce them into a format that will pass the assumptions.

Before we begin, let's go ahead and activate our packages and load our data.


```r
library(tidyverse)
chicks <- as_tibble(ChickWeight)
```

## The two main assumptions

### Normality

The quickest method of testing the normality of a variable is with the Shapiro-Wilk normality test. This will return two values, a W score and a _p_-value. FOr the purposes of this course we may safely ignore the W score and focus on the _p_-value. When _p_ >= 0.05 we may assume that the data are normally distributed. If _p_ < 0.05 then the data are not normally distrubted. Let's look at all of the `chicks` data without filtering it:


```r
shapiro.test(chicks$weight)
```

```
R> 
R> 	Shapiro-Wilk normality test
R> 
R> data:  chicks$weight
R> W = 0.90866, p-value < 2.2e-16
```

Are these data normally distributed? How do we know? Now let's filter the data based on the different diets for only the weights taken on the last day (21):


```r
chicks %>% 
  filter(Time == 21) %>% 
  group_by(Diet) %>% 
  summarise(norm_wt = as.numeric(shapiro.test(weight)[2]))
```

```
R> # A tibble: 4 x 2
R>   Diet  norm_wt
R>   <fct>   <dbl>
R> 1 1       0.591
R> 2 2       0.949
R> 3 3       0.895
R> 4 4       0.186
```

How about now?

### Homoscedasticity

Here we need no fancy test. We must simply calculate the variance of the variables we want to use and see that they are not more than 3 -- 4 times greater than one another.


```r
chicks %>% 
  filter(Time == 21) %>% 
  group_by(Diet) %>% 
  summarise(var_wt = var(weight))
```

```
R> # A tibble: 4 x 2
R>   Diet  var_wt
R>   <fct>  <dbl>
R> 1 1      3446.
R> 2 2      6106.
R> 3 3      5130.
R> 4 4      1879.
```

Well, do these data pass the two main assumptions?

## Transforming data

### Log transform 

###

## Exercises

### Exercise 1

Find one of the days of measurement where the chicken weights do not pass the assumptions of normality, and another day (not day 21!) in which they do.

### Exercise 2

Transform the data so that they may pass the assumptions.