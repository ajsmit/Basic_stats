# Distributions



```
## Loading required package: methods
```

Therefore, we must next learn about the different types of data distributions we are likely to encounter in the wild.

## Binomial distribution


```r
knitr::include_app("https://robert-schlegel.shinyapps.io/binomial_dist/", height = "600px")
```

<iframe src="https://robert-schlegel.shinyapps.io/binomial_dist/?showcase=0" width="672" height="600px"></iframe>

## Poisson distribution


```r
knitr::include_app("https://robert-schlegel.shinyapps.io/poisson_dist/", height = "600px")
```

<iframe src="https://robert-schlegel.shinyapps.io/poisson_dist/?showcase=0" width="672" height="600px"></iframe>

## Continuous uniform distribution


```r
knitr::include_app("https://robert-schlegel.shinyapps.io/uniform_dist/", height = "600px")
```

<iframe src="https://robert-schlegel.shinyapps.io/uniform_dist/?showcase=0" width="672" height="600px"></iframe>

## Exponential distribution


```r
knitr::include_app("https://robert-schlegel.shinyapps.io/exponential_dist/", height = "600px")
```

<iframe src="https://robert-schlegel.shinyapps.io/exponential_dist/?showcase=0" width="672" height="600px"></iframe>

## Normal distribution

<!--html_preserve--><div class="form-group shiny-input-container">
<label class="control-label" for="bins">Number of bins:</label>
<input class="js-range-slider" id="bins" data-min="1" data-max="50" data-from="30" data-step="1" data-grid="true" data-grid-num="9.8" data-grid-snap="false" data-prettify-separator="," data-prettify-enabled="true" data-keyboard="true" data-keyboard-step="2.04081632653061" data-data-type="number"/>
</div><!--/html_preserve--><!--html_preserve--><div id="out0e86098d0b4deb98" class="shiny-plot-output" style="width: 100% ; height: 400px"></div><!--/html_preserve-->


<div class="figure">
<img src="figures/Boxplot_vs_PDF.svg" alt="Boxplot and probability density function of a normal distribution *N*(0, σ^2^). Credit: [Wikipedia](https://en.wikipedia.org/wiki/Probability_density_function)"  />
<p class="caption">(\#fig:PDF)Boxplot and probability density function of a normal distribution *N*(0, σ^2^). Credit: [Wikipedia](https://en.wikipedia.org/wiki/Probability_density_function)</p>
</div>

## Chi-squared distribution


```r
knitr::include_app("https://robert-schlegel.shinyapps.io/chi_squared_dist/", height = "600px")
```

<iframe src="https://robert-schlegel.shinyapps.io/chi_squared_dist/?showcase=0" width="672" height="600px"></iframe>

## Student t distribution


```r
knitr::include_app("https://robert-schlegel.shinyapps.io/student_t_dist/", height = "600px")
```

<iframe src="https://robert-schlegel.shinyapps.io/student_t_dist/?showcase=0" width="672" height="600px"></iframe>

## F distribution


```r
knitr::include_app("https://robert-schlegel.shinyapps.io/f_dist/", height = "600px")
```

<iframe src="https://robert-schlegel.shinyapps.io/f_dist/?showcase=0" width="672" height="600px"></iframe>
