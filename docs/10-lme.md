# Linear mixed models




In the previous chapter we learned how to test hypotheses based on the comparions of means between sets of data when we were able to meet our two base assumptions. These parametric tests are preferred over non-parametric tests because they are more robust. However, when we simply aren't able to meet these assumptions we must not despair. Non-parametric tests are still useful. In this chapter we will learn how to run non-parametirc tests for two sample and multiple sample datasets. To start, let's load our libraries and `chicks` data if we have not already.


```r
# First activate libraries
library(tidyverse)
library(ggpubr)

# Then load data
chicks <- as_tibble(ChickWeight)
```

With our libraries and data loaded, let's find a day in which at least one of our assumptions are violated.


```r
# Then check for failing assumptions
chicks %>% 
  filter(Time == 0) %>% 
  group_by(Diet) %>% 
  summarise(norm_wt = as.numeric(shapiro.test(weight)[2]),
            var_wt = var(weight))
```

```
R> # A tibble: 4 x 3
R>   Diet  norm_wt var_wt
R>   <fct>   <dbl>  <dbl>
R> 1 1     0.0138   0.989
R> 2 2     0.138    2.23 
R> 3 3     0.00527  1.07 
R> 4 4     0.0739   1.11
```

## Wilcox rank sum test

The non-parametric version of a t-test is a Wilcox rank sum test. To perform this test in R we may again use `compare_means()` and specify the test we want:


```r
compare_means(weight ~ Diet, data = filter(chicks, Time == 0, Diet %in% c(1, 2)), method = "wilcox.test")
```

```
R> # A tibble: 1 x 8
R>   .y.    group1 group2     p p.adj p.format p.signif method  
R>   <chr>  <chr>  <chr>  <dbl> <dbl> <chr>    <chr>    <chr>   
R> 1 weight 1      2      0.235 0.235 0.23     ns       Wilcoxon
```

What do our results show?

## Kruskall-Wallis rank sum test

### Single factor

The non-parametric version of an ANOVA is a Kruskall-Wallis rank sum test. As you may have by now surmised, this may be done with `compare_means()` as seen below:


```r
compare_means(weight ~ Diet, data = filter(chicks, Time == 0), method = "kruskal.test")
```

```
R> # A tibble: 1 x 6
R>   .y.        p p.adj p.format p.signif method        
R>   <chr>  <dbl> <dbl> <chr>    <chr>    <chr>         
R> 1 weight 0.475 0.475 0.48     ns       Kruskal-Wallis
```

As with the ANOVA, this first step with the Kruskall-Wallis test is not the last. We must again run a post-hoc test on our results. This time we will need to use `pgirmess::kruskalmc()`, which means we will need to load a new library.


```r
library(pgirmess)

kruskalmc(weight ~ Diet, data = filter(chicks, Time == 0))
```

```
R> Multiple comparison test after Kruskal-Wallis 
R> p.value: 0.05 
R> Comparisons
R>     obs.dif critical.dif difference
R> 1-2    6.95     14.89506      FALSE
R> 1-3    6.90     14.89506      FALSE
R> 1-4    4.15     14.89506      FALSE
R> 2-3    0.05     17.19933      FALSE
R> 2-4    2.80     17.19933      FALSE
R> 3-4    2.75     17.19933      FALSE
```

Let's consult the help file for `kruskalmc()` to understand what this print-out means.

### Multiple factors

The water becomes murky quickly when one wants to perform mutliple factor non-parametric comparison of means tests. TO that end, we will not cover the few existing methods here. Rather, one should avoid the necessity for these types of tests when designing an experiment.

## Exercises

## Exercise 1

Write out the hypotheses that we tested for in this chapter and answer them based on the results we produced in class.
