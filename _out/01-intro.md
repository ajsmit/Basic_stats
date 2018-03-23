
# Introduction

> *"A scientist worthy of a lab coat should be able to make original discoveries while wearing a clown suit, or give a lecture in a high squeaky voice from inhaling helium. It is written nowhere in the math of probability theory that one may have no fun."*
>
> --- Eliezer Yudkowsky

> *"Prediction is very difficult, especially about the future."*
>
> --– Niels Bohr

## Preliminaries



## Venue, date and time

Quantitative Ecology is scheduled to replace Plant Ecophysiology, and will run between May 14th and June 29th, 2018. This workshop will take place from **9:00--16:00** on one day in each week during this period. There will also be a field component, where you will be taught about ecological field sampling in marine and terrestrial environments; this will also offer an opportunity to collect real data using actual ecological field methods (these will also be covered in the course), which we will then analyse using the multivariate methods used in this workshop.

## Course outline

* Descriptive versus inferential statistics
* Measures of central tendency
* Measures of dispersion and variability
* Distributions
* Graphical data displays
* T-tests (one- and two-sample, etc.)
* Confidence intervals
* ANOVA (one- and two-way)
* Linear mixed models
* Testing assumptions; transformations
* Non-parametric tests (Mann-Whitney, Kruskal-Wallis)
* Chi-square tests
* Correlation
* Linear models (linear regression)
* Generalised linear models

## About this Workshop

The aim of this five-day introductory workshop is to guide you through...

## This is biology: why more R coding?

Please refer to the [Intro R Workshop: Data Manipulation, Analysis and Graphing](https://robwschlegel.github.io/Intro_R_Workshop/) for why we feel strongly that you use R [@R2017] for the analyses that we will perform here. All of the reasons provided there are valid here too, but one reason perhaps more so than others --- R and RStudio promote the principles of *reproducible research*, and in fact make it very easy to implement. We will focus on some of these principles throughout the workshop, and the assignments will in fact require that you submit a fully functional working script, complete with all the notes, memos, examples, data, executable code, and output that will result from completing the course material. 

What other oprions are there for analysing the kinds of data that we will encounter in biological research? Software packages like the ones you may be familiar with, such as Statistica and SPSS, are often used to perform many of the analyses we will encounter. They are rather limited with regards to the full scope of modern statistical methods in use by biologists today, but many people still use these kinds of software as the provide the basic kinds analyses that still form the staple of the biological and medical sciewnces. For the many reasons provided above, we prefer to use R as the *engine* within which to do our biological data analysis. R is used by academic statisticians the world over, and it is therefore an excellent choice for our purpose here...

## Installing R and RStudio

We assume that you already have R installed on your computer, as all of you will have already completed the the Intro R Workshop. If you need a refresher, please refer to [Intro R Workshop: Data Manipulation, Analysis and Graphing](https://robwschlegel.github.io/Intro_R_Workshop/) for the installation instructions.

## Resources

### Required reading

### Resources about multivatiate ecological methods

### General resources about R

## Style and code conventions

Early on, develop the habit of unambiguous and consistent style and formatting when writing your code, or anything else for that matter. Pay attention to detail and be pedantic. This will benefit your scientific writing in general. Although many R commands rely on precisely formatted statements (code blocks), style can nevertheless to *some extent* have a personal flavour to it. The key is *consistency*. In this book we use certain conventions to improve readability. We use a consistent set of conventions to refer to code, and in particular to typed commands and package names.

  * Package names are shown in a bold font over a grey box, *e.g.* __`tidyr`__.
  * Functions are shown in normal font followed by parentheses and also over a grey box , *e.g.* `plot()`, or `summary()`.
  * Other R objects, such as data, function arguments or variable names are again in normal font over a grey box, but without parentheses, *e.g.* `x` and `apples`.
  * Sometimes we might directly specify the package that contains the function by using two colons, *e.g.* `dplyr::filter()`.
  * Commands entered onto the R command line (console) and the output that is returned will be shown in a code block, which is a light grey background with code font. The commands entered start at the beginning of a line and the output it produces is preceded by `R>`, like so:


```r
rnorm(n = 10, mean = 0, sd = 13)
```

```
R>  [1]  -1.382894   6.623550  10.016745   4.001517 -14.205712   5.993953
R>  [7]  -2.819659  18.533080  -7.519011  16.895566
```

Consult these resources for more about R code style :

  * [Google's R style guide](https://google.github.io/styleguide/Rguide.xml)
  * [The tidyverse style guide](http://style.tidyverse.org)
  * [Hadley Wickham's advanced R style guide](http://adv-r.had.co.nz/Style.html)

We can also insert maths expressions, like this $f(k) = {n \choose k} p^{k} (1-p)^{n-k}$ or this: $$f(k) = {n \choose k} p^{k} (1-p)^{n-k}$$

## Assessment and teaching philosophy:

Grades will be based on performance of two take home exams, and an individual project and homework problem sets. The exams and individual project will represent 30% of the grade. The homework problem sets will make up the remaining 10%. In cases where students are borderline between lower and higher grades, a high level of participation in the class discussions and class in general will win the day for the higher grade.

Homework problems are essential to understanding of the materials. Although the homework comprises only 10% of the final grade, performance on the exams is usually correlated with effort on the homework problems.

Whereas plagiarism will not be tolerated, students ARE encouraged to work together to learn from one another (especially those from the same IVN site) and solve problems in a collaborative and collegial way (aside from the take home exam).

## About this document

This document, which as available as a HTML file that's viewable on a web browser of your choice (anything will do, but we discourage using Internet Explorer) and as a PDF (accessible from the link at the top of any of the website's pages) that may be printed, was prepared by the software tools available to R via RStudio. We use the package called `bookdown` that may be accessed and read about [here](https://bookdown.org/yihui/bookdown/) to produce this documentation. The entire source code to reproduce this book is available from my [GitHub account](https://github.com/ajsmit/).


```r
knitr::include_graphics("figures/bookdown_hex_logo.png")
```

<div class="figure">
<img src="figures/bookdown_hex_logo.png" alt="Bookdown hex." width="100" />
<p class="caption">(\#fig:rmarkdown)Bookdown hex.</p>
</div>

You will notice that this repository uses [GitHub](https://github.com), and you are advised to set up your own repository for R scripts and all your data. We will touch on GitHub and the principles of reproducible research later, and GitHub forms a core ingredient of such a workflow.

The R session information when compiling this book is shown below:

```r
sessionInfo()
```

```
R> R version 3.4.3 (2017-11-30)
R> Platform: x86_64-apple-darwin15.6.0 (64-bit)
R> Running under: macOS Sierra 10.12.6
R> 
R> Matrix products: default
R> BLAS: /Library/Frameworks/R.framework/Versions/3.4/Resources/lib/libRblas.0.dylib
R> LAPACK: /Library/Frameworks/R.framework/Versions/3.4/Resources/lib/libRlapack.dylib
R> 
R> locale:
R> [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
R> 
R> attached base packages:
R> [1] stats     grDevices utils     datasets  graphics  base     
R> 
R> loaded via a namespace (and not attached):
R>  [1] Rcpp_0.12.15    bookdown_0.6    png_0.1-7       digest_0.6.14  
R>  [5] rprojroot_1.3-2 backports_1.1.2 magrittr_1.5    evaluate_0.10.1
R>  [9] highr_0.6       stringi_1.1.6   rmarkdown_1.8   tools_3.4.3    
R> [13] stringr_1.2.0   xfun_0.1        yaml_2.1.16     compiler_3.4.3 
R> [17] htmltools_0.3.6 knitr_1.19      methods_3.4.3
```


