# One-way ANOVA



```
## ── Attaching packages ───────────────
```

```
## ✔ ggplot2 2.2.1.9000     ✔ purrr   0.2.4     
## ✔ tibble  1.4.2          ✔ dplyr   0.7.4.9000
## ✔ tidyr   0.8.0          ✔ stringr 1.3.0     
## ✔ readr   1.1.1          ✔ forcats 0.3.0
```

```
## ── Conflicts ────────────────────────
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
```

```
## Loading required package: magrittr
```

```
## 
## Attaching package: 'magrittr'
```

```
## The following object is masked from 'package:purrr':
## 
##     set_names
```

```
## The following object is masked from 'package:tidyr':
## 
##     extract
```




Whole big books have been written about Analysis of Variance (ANOVA). Although there are many ANOVA experimental designs available, biologists are taught to pay special attention to the design of experiments, and generally make sure that the experiments are fully factorial (in the case of two-way or higher ANOVAs) and balanced. For this reason we will focus in this Introductory Statistics course on one-way and factorial ANOVAs only.

As t-tests, ANOVAs require that some assumtions are met:

* Normally distributed data
* Independence of data
* In our case, we will encourage also that the data are balanced

If some of the above assumptions are violated, then your course of action is either to transform the data (if non-normal) or to use a generalised linear model (also when non-normal), or to use a linear mixed model (when the assumption on non-independence cannot be garanteed). We will get to some of these methods in later chapters. Linked to the above, ANOVAs are also sensitive to the presence of outliers (see our earlier discussion about the mean and how it differs from the median), so we need to ensure that outliers are not present (they can be removed, and there are many ways of finding them and eliminating them). If outliers are an important feature of the data, then a non-parametric test can be used, or some other test that works well with extreme values can be applied. 

Rather than talking about t-tests and ANOVAs as separate things, let us acknowledge that they are similar ways of asking the same question. That question being, are the means of these two or more things we want to compare different, or the same? At this stage it is important to note that the independent variable is categorical (i.e. a factor denoting two or more different treatments or sampling conditions) and that the dependent variable is continuous. You may perhaps be more familiar with this question when it is presented as a set of hypotheses.

> H0: Group A is not different from group B.
>
> H1: Group A is different from group B.

This is a scientific question in the simplest sense. Often, for basic inquiries such as that posed above, we need to see if one group differs significantly from another. The way in which we accomplish this is by looking at the mean and variance within a set of data compared against another similar set. In order to do so appropriately however we need to first assume that both sets of data are normally distributed, and that the variance found within each set of data is similar. These are the two primary assumptions we learned about in Chapter 6, and if they are met then we may use paramteric tests. We will learn in Chapter 9 what we can do if these assumptions are not meant and we cannot adequately transform our data, meaning we will need to use non-parametric tests.

## t-test

A t-test is used when wants to compare two different sample sets against one another. This is also known as a two-factor or two level test. When one wants to compare multiple, more than two, sample sets against one another an ANOVA is required (see below). In order to illustrate how to perform a t-test in R we are going to once again use the `chicks` data, but only Diet 1 and 2 from day 21.


```r
# First grab the data
chicks <- as_tibble(ChickWeight)

# Then subset out only the sample sets to be compared
chicks_sub <- chicks %>% 
  filter(Diet %in% c(1, 2), Time == 21)
```

Once we have filtered our data we may now perform the t-test. Traditionally this would be performed with `t.test()`, but recent developments in R have made any testing for the comparison of means more convenient by wrapping everything up into the one single function `compare_means()`. We will need to use only this one signle function for all of the tests we will perform in this chapter as well as Chapter 9. To use `compare_means()` for a t-test we must simplu specify this in the `method` argument, as seen below:


```r
compare_means(weight ~ Diet, data = chicks_sub, method = "t.test")
```

```
R> # A tibble: 1 x 8
R>   .y.    group1 group2     p p.adj p.format p.signif method
R>   <chr>  <chr>  <chr>  <dbl> <dbl> <chr>    <chr>    <chr> 
R> 1 weight 1      2      0.218 0.218 0.22     ns       T-test
```

As one may recall from the Intro R Workshop, whenever we want to give a formula to a function in R, we use the `~`. The formula used above, `weight ~ Diet`, reads in plain English as "weight as a function of diet". This is perhaps easier to understand as "Y as a function of X". This means that we are assuming whatever is to the left of the `~` is the dependant variable, and whatever is to the right is the independent variable. We then tell `compare_means()` to run a t-test on our `chicks_sub` dataframe and it does the rest. We see in the output above that this function gives us a rather tidy read-out of the information we require to test a potential hypothesis. Let's take a moment to look through the help file for this function and see what all of this means. Did the Diet 1 and 2 produce significantly fatter birds?

## ANOVA

### Single factor

In the previous section we learned how to calculate the difference between two smaple sets. But what if, as is often the case, we want to compare three or more? Again, the `chicks` data provide an excellent example of how to do this. The base R function for an ANOVA is `aov()`, but we will rather continue to use `compare_means()`. To look for significant differences between all four diets on the last day of sampling we use this one line of code:


```r
compare_means(weight ~ Diet, data = filter(chicks, Time == 21), method = "anova")
```

```
R> # A tibble: 1 x 6
R>   .y.          p   p.adj p.format p.signif method
R>   <chr>    <dbl>   <dbl> <chr>    <chr>    <chr> 
R> 1 weight 0.00686 0.00686 0.0069   **       Anova
```

When we now look at all four diets, rather than only 1 and 2, do they produce significantly different chicken weights after 21 days? If this seems to easy to be true, it's because we aren't quite done yet. The next step one must take is to run a Tukey test on the results of the ANOVA by wrapping `tukeyHSD()` around `aov()`:


```r
TukeyHSD(aov(weight ~ Diet, data = filter(chicks, Time == 21)))
```

```
R>   Tukey multiple comparisons of means
R>     95% family-wise confidence level
R> 
R> Fit: aov(formula = weight ~ Diet, data = filter(chicks, Time == 21))
R> 
R> $Diet
R>          diff        lwr       upr     p adj
R> 2-1  36.95000  -32.11064 106.01064 0.4868095
R> 3-1  92.55000   23.48936 161.61064 0.0046959
R> 4-1  60.80556  -10.57710 132.18821 0.1192661
R> 3-2  55.60000  -21.01591 132.21591 0.2263918
R> 4-2  23.85556  -54.85981 102.57092 0.8486781
R> 4-3 -31.74444 -110.45981  46.97092 0.7036249
```

The output of `tukeyHSD()` shows us tha pairwise comparisons of all of the groups we are comparing. Let's look at the help file for this function to better understand what the output means. Which of the groups are significantly different from one another? Why does the ANOVA return a significant result, but the Tukey test shows that not all of the groups are significantly different from one another?

### Multiple factors

What if we have multiple grouping variables, and not just one? To run an ANOVA on multiple factors we will need to use `aov()` rather than `compare_means()`. To specify the different factors we put them in our formula and separate them with a `+`:


```r
summary(aov(weight ~ Diet + as.factor(Time), data = filter(chicks, Time %in% c(20, 21))))
```

```
R>                 Df Sum Sq Mean Sq F value   Pr(>F)    
R> Diet             3 113270   37757  10.436 6.33e-06 ***
R> as.factor(Time)  1   1488    1488   0.411    0.523    
R> Residuals       86 311147    3618                     
R> ---
R> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

What question are we asking with the above line of code? Waht is the answer? Also, why did we wrap `Time` in `as.factor()`?

It is also possible to look at what the effect is between gouping variables, and not just within the individual grouping variables. To do this we replace the `+` in our formula with `*`:


```r
summary(aov(weight ~ Diet * as.factor(Time), data = filter(chicks, Time %in% c(20, 21))))
```

```
R>                      Df Sum Sq Mean Sq F value   Pr(>F)    
R> Diet                  3 113270   37757  10.076 9.88e-06 ***
R> as.factor(Time)       1   1488    1488   0.397    0.530    
R> Diet:as.factor(Time)  3    117      39   0.010    0.999    
R> Residuals            83 311030    3747                     
R> ---
R> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

How do these results differ from the previous set?

One may also run a post-hoc Tukey test on these results the same as for a single factor ANOVA:


```r
TukeyHSD(aov(weight ~ Diet * as.factor(Time), data = filter(chicks, Time %in% c(20, 21))))
```

```
R>   Tukey multiple comparisons of means
R>     95% family-wise confidence level
R> 
R> Fit: aov(formula = weight ~ Diet * as.factor(Time), data = filter(chicks, Time %in% c(20, 21)))
R> 
R> $Diet
R>          diff        lwr       upr     p adj
R> 2-1  36.18030  -9.301330  81.66194 0.1663037
R> 3-1  90.63030  45.148670 136.11194 0.0000075
R> 4-1  62.25253  15.223937 109.28111 0.0045092
R> 3-2  54.45000   3.696023 105.20398 0.0305957
R> 4-2  26.07222 -26.072532  78.21698 0.5586643
R> 4-3 -28.37778 -80.522532  23.76698 0.4863940
R> 
R> $`as.factor(Time)`
R>           diff       lwr      upr     p adj
R> 21-20 8.088223 -17.44017 33.61661 0.5303164
R> 
R> $`Diet:as.factor(Time)`
R>                 diff        lwr        upr     p adj
R> 2:20-1:20  35.188235  -40.67378 111.050253 0.8347209
R> 3:20-1:20  88.488235   12.62622 164.350253 0.0111136
R> 4:20-1:20  63.477124  -14.99365 141.947897 0.2035951
R> 1:21-1:20   7.338235  -58.96573  73.642198 0.9999703
R> 2:21-1:20  44.288235  -31.57378 120.150253 0.6116081
R> 3:21-1:20  99.888235   24.02622 175.750253 0.0023872
R> 4:21-1:20  68.143791  -10.32698 146.614563 0.1371181
R> 3:20-2:20  53.300000  -31.82987 138.429869 0.5234263
R> 4:20-2:20  28.288889  -59.17374 115.751515 0.9723470
R> 1:21-2:20 -27.850000 -104.58503  48.885027 0.9486212
R> 2:21-2:20   9.100000  -76.02987  94.229869 0.9999766
R> 3:21-2:20  64.700000  -20.42987 149.829869 0.2732059
R> 4:21-2:20  32.955556  -54.50707 120.418182 0.9377007
R> 4:20-3:20 -25.011111 -112.47374  62.451515 0.9862822
R> 1:21-3:20 -81.150000 -157.88503  -4.414973 0.0305283
R> 2:21-3:20 -44.200000 -129.32987  40.929869 0.7402877
R> 3:21-3:20  11.400000  -73.72987  96.529869 0.9998919
R> 4:21-3:20 -20.344444 -107.80707  67.118182 0.9960548
R> 1:21-4:20 -56.138889 -135.45396  23.176184 0.3619622
R> 2:21-4:20 -19.188889 -106.65152  68.273738 0.9972631
R> 3:21-4:20  36.411111  -51.05152 123.873738 0.8984019
R> 4:21-4:20   4.666667  -85.06809  94.401428 0.9999998
R> 2:21-1:21  36.950000  -39.78503 113.685027 0.8067041
R> 3:21-1:21  92.550000   15.81497 169.285027 0.0075185
R> 4:21-1:21  60.805556  -18.50952 140.120628 0.2629945
R> 3:21-2:21  55.600000  -29.52987 140.729869 0.4679025
R> 4:21-2:21  23.855556  -63.60707 111.318182 0.9896157
R> 4:21-3:21 -31.744444 -119.20707  55.718182 0.9486128
```

Jikes! That's a massive amount of results. What does all of this mean, and why is it so verbose?

## Exercises

### Exercise 1

Write out the hypotheses that we tested for in this chapter and answer them based on the results we produced in class.
