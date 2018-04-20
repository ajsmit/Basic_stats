# Correlations




A correlation is performed when we want to investigate potential relationships between variables from the same sample. This does not mean that one variable explains the other, we arrive at that through the use of regression, as seen in Chapter 8. Like all statistical tests, correlation requires a series of assumptions as well:

* pairwise data
* absence of outliers
* linearity
* normality of distribution
* homoscedasticity
* level (type) of measurement
  * Continuous data (Pearson correlation)
  * Ordinal data (Spearman correlation)

In order to investigate correlations in biological data lets load the `ecklonia` dataset.


```r
# Load libraries
library(tidyverse)
library(ggpubr)
library(corrplot)

# Load data
ecklonia <- read_csv("data/ecklonia.csv")
```

We will also create a subsetted version of our data by removing all of the categorical variables. If we have a dataframe where each column represents pairwise continuous/ordinal measurements with all of the other columns we may very quickly and easily perform a much wider range of correlation analyses.


```r
ecklonia_sub <- ecklonia %>% 
  select(-species, - site, - ID)
```

## Pearson correlation

When the values we are comparing are continuous, we may use a Pearson test. This is the default and so requires little work on our end. The resulting statistic from this test is known as the correlation coefficent.


```r
# Perform correlation analysis on two specific variables
  # Note that we do not need the final two arguments in this function to be stated
  # as they are the defaut settings.
  # They are only shown here to illustrate that they exist.
cor.test(x = ecklonia$stipe_length, ecklonia$frond_length,
    use = "everything", method = "pearson")
```

```
R> 
R> 	Pearson's product-moment correlation
R> 
R> data:  ecklonia$stipe_length and ecklonia$frond_length
R> t = 4.2182, df = 24, p-value = 0.0003032
R> alternative hypothesis: true correlation is not equal to 0
R> 95 percent confidence interval:
R>  0.3548169 0.8300525
R> sample estimates:
R>       cor 
R> 0.6524911
```

Above we have tested the correlation between the length of _Ecklonia maxima_ stipes and the length of their fronds. A perfect positive (negative) relationship would produce a value of 1 (-1), whereas no relationship would produce a value of 0. The result above, `cor = 0.65` is relatively strong. That being said, should our dataset contain multiple variables, as `ecklonia` does, we may investigate all of the correlations simultaneously. Remember that in order to do so we want to ensure that we may perform the same test on each of our paired variables. In this case we will use `ecklonia_sub` as we know that it contains only continuous data and so are appropriate for use with a Pearson test. By default R will use all of the data we give it and perform a Pearson test so we do not need to specify any further arguments. Note however that this will only output the correlation coefficents, and does not produce a full test of each correlation. This will however be useful for us to have just now.


```r
ecklonia_pearson <- cor(ecklonia_sub)
ecklonia_pearson
```

```
R>                      stipe_length stipe_diameter frond_length     digits
R> stipe_length            1.0000000      0.5853577   0.65249111 0.24273818
R> stipe_diameter          0.5853577      1.0000000   0.39032107 0.24098021
R> frond_length            0.6524911      0.3903211   1.00000000 0.35604257
R> digits                  0.2427382      0.2409802   0.35604257 1.00000000
R> primary_blade_width     0.3413692      0.8269196   0.28307223 0.13954003
R> primary_blade_length    0.1330329      0.3176688  -0.01584175 0.09784266
R> stipe_mass              0.5768102      0.8226091   0.39471926 0.06958775
R> frond_mass              0.5124551      0.5066763   0.56762418 0.28162375
R> epiphyte_length         0.6056152      0.5372470   0.61489806 0.04634642
R>                      primary_blade_width primary_blade_length stipe_mass
R> stipe_length                   0.3413692           0.13303292 0.57681018
R> stipe_diameter                 0.8269196           0.31766879 0.82260910
R> frond_length                   0.2830722          -0.01584175 0.39471926
R> digits                         0.1395400           0.09784266 0.06958775
R> primary_blade_width            1.0000000           0.33931061 0.82745162
R> primary_blade_length           0.3393106           1.00000000 0.16175948
R> stipe_mass                     0.8274516           0.16175948 1.00000000
R> frond_mass                     0.3630630           0.14729132 0.47195130
R> epiphyte_length                0.4119969           0.26051399 0.50790877
R>                      frond_mass epiphyte_length
R> stipe_length          0.5124551      0.60561520
R> stipe_diameter        0.5066763      0.53724704
R> frond_length          0.5676242      0.61489806
R> digits                0.2816237      0.04634642
R> primary_blade_width   0.3630630      0.41199691
R> primary_blade_length  0.1472913      0.26051399
R> stipe_mass            0.4719513      0.50790877
R> frond_mass            1.0000000      0.43920289
R> epiphyte_length       0.4392029      1.00000000
```

> **Task:** What does the outcome of this test show?

## Spearman rank correlation

When the data we want to compare are not continuous, but rather ordinal, we will need to use a Spearman test. This is not often a test one uses in biology because we tend to want to compare continuous data within categories. In the code below we will add a column of ordinal data to our `ecklonia` data to so that we may look at this test.


```r
# Create ordinal data
ecklonia$length <- as.numeric(cut((ecklonia$stipe_length+ecklonia$frond_length), breaks = 3))

# Run test on any variable
cor.test(ecklonia$length, ecklonia$digits)
```

```
R> 
R> 	Pearson's product-moment correlation
R> 
R> data:  ecklonia$length and ecklonia$digits
R> t = 1.4979, df = 24, p-value = 0.1472
R> alternative hypothesis: true correlation is not equal to 0
R> 95 percent confidence interval:
R>  -0.1070908  0.6105880
R> sample estimates:
R>     cor 
R> 0.29239
```

> **Task:** How else might we use this?

## Kendall rank correlation

This test will work for both continuous and ordinal data. A sort of dealers choic of correlation tests. It's main purpose is to allow us to perform a correlation on non-normally distributed data. Let's look at the normality of our `ecklonia` variables and pull out those that are not normal in order to see how the results of this test may differ from our Pearson tests.


```r
ecklonia_norm <- ecklonia_sub %>% 
  gather(key = "variable") %>% 
  group_by(variable) %>% 
  summarise(variable_norm = as.numeric(shapiro.test(value)[2]))
ecklonia_norm
```

```
R> # A tibble: 9 x 2
R>   variable             variable_norm
R>   <chr>                        <dbl>
R> 1 digits                     0.0671 
R> 2 epiphyte_length            0.626  
R> 3 frond_length               0.202  
R> 4 frond_mass                 0.277  
R> 5 primary_blade_length       0.00393
R> 6 primary_blade_width        0.314  
R> 7 stipe_diameter             0.170  
R> 8 stipe_length               0.213  
R> 9 stipe_mass                 0.817
```

From this analysis we may see that the values for primary blade length are not normally distributed. In order to make up for this violation of our assumption of normality we may use the Spearman test.


```r
cor.test(ecklonia$primary_blade_length, ecklonia$primary_blade_width)
```

```
R> 
R> 	Pearson's product-moment correlation
R> 
R> data:  ecklonia$primary_blade_length and ecklonia$primary_blade_width
R> t = 1.7671, df = 24, p-value = 0.08993
R> alternative hypothesis: true correlation is not equal to 0
R> 95 percent confidence interval:
R>  -0.055311  0.642250
R> sample estimates:
R>       cor 
R> 0.3393106
```

## One panel visual

As is the case with everything else we have learned thus far, a good visualisation can go a long way to help us understand what the statistics are doing. Below we visualise the stipe length to frond length relationship.


```r
# Calculate Pearson r beforehand for plotting
r_print <- paste0("r = ", 
                  round(cor(x = ecklonia$stipe_length, ecklonia$frond_length),2))

# Then create a single panel showing one correlation
ggplot(data = ecklonia, aes(x = stipe_length, y = frond_length)) +
  geom_smooth(method = "lm", colour = "grey90", se = F) +
  geom_point(colour = "mediumorchid4") +
  geom_label(x = 300, y = 240, label = r_print) +
  labs(x = "Stipe length (cm)", y = "Frond length (cm)") +
  theme_pubclean()
```

<div class="figure">
<img src="09-correlations_files/figure-html/unnamed-chunk-8-1.png" alt="Scatterplot showing relationship between _Ecklonia maxima_ stipe length (cm) and frond length (cm). The correlation coefficient (Pearson r) is shown in the top left corner. Note that the grey line running through the middle is a fitted linear model and is not generating the correlation value. Rather it is included to help visually demonstrate the strength of the relationship." width="672" />
<p class="caption">(\#fig:unnamed-chunk-8)Scatterplot showing relationship between _Ecklonia maxima_ stipe length (cm) and frond length (cm). The correlation coefficient (Pearson r) is shown in the top left corner. Note that the grey line running through the middle is a fitted linear model and is not generating the correlation value. Rather it is included to help visually demonstrate the strength of the relationship.</p>
</div>

Just by eyeballing this scatterplot it should be clear that these data tend to increase at a roughly similar rate. Our Pearson r value is an indication of what that is.

## Multiple panel visual

But why stop at one panel? It is relatively straightforward to quickly plot correlation results for all of our variables in one go. In order to show which variables correlate most whith which other variables all at once, without creating chaos, we will create what is known as a heat map. This visualisation uses a range of colours, usually blue to red, to demonstrate where more of something is. In this case, we use it to show where more correlation is occurring between morphometric properties of the kelp _Ecklonia maxima_.


```r
corrplot(ecklonia_pearson, method = "circle")
```

<div class="figure">
<img src="09-correlations_files/figure-html/unnamed-chunk-9-1.png" alt="Correlation plot showing the strength of all correlations between all variables as a scale from red (negative) to blue (positive)." width="672" />
<p class="caption">(\#fig:unnamed-chunk-9)Correlation plot showing the strength of all correlations between all variables as a scale from red (negative) to blue (positive).</p>
</div>

> **Task:** What does the series of dark blue circles through the middle of this plot mean?
>
< **Task:** Which morphometric properties correlate best/worst?

Slightly more involved, but much more useful, is the generation of a heat map using __`ggplot2`__.

## Exercises

### Exercise 1

Produce a heat map using __`ggplot2`__.
