# Correlations




A chi-squared test is used when one wants to see if there is a realtionship between count data of two or more factors.


```r
x <- c(A = 20, B = 15, C = 25)
chisq.test(x)
```

```
R> 
R> 	Chi-squared test for given probabilities
R> 
R> data:  x
R> X-squared = 2.5, df = 2, p-value = 0.2865
```

