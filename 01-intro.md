# Introduction


> *"A scientist worthy of a lab coat should be able to make original discoveries while wearing a clown suit, or give a lecture in a high squeaky voice from inhaling helium. It is written nowhere in the math of probability theory that one may have no fun."*
>
> --- Eliezer Yudkowsky

> *"Prediction is very difficult, especially about the future."*
>
> --– Niels Bohr

<!-- ## Preliminaries -->



## Venue, date and time

Basic Statistics is the second half of the BSc (Hons) Biostats core module, and will run from 12 April to 26 April 2018. This workshop will take place on Tuesdays from **13:00--17:00**, Thursdays from **10:40--17:00**, and Fridays from **08:30--17:00**. There will be an assignment due about six weeks after the end of this module, and it will provide the other half of the marks for the Biostats module. More on the assignment later.

## Course outline

1. Introduction (this chapter)
2. Types of data
3. Descriptive statistics: Measures of location and dispersion
4. Representing data graphically
5. Distributions
6. One-sample and two-sample tests
7. Multi-sample (>2) tests
8. Linear regression
9. Correlation
10. Confidence intervals
11. Transforming data
12. Generalised linear model (GLM)
13. Chi square tests

The course content can broadly be classified into two parts: *Descriptive Statistics* and *Inferential Statistics*.

Descriptive statistics and their associated statistical and graphical data summaries will be covered in Chapters 3 and 4. In Chapter 5 we will introduce the concepts of data distributions, knowledge of which is required to select the most appropriate inferential statistical methods. 

Chapters 6-15 are about inferential statistics. Inferential tests allow us to evaluate hypotheses within a framework of probabalistic theory, which helps us infer the nature of a 'population' based on a smaller represenative set of samples. In partiucular, we can infer whether the property under scrutiny (arrived at by means of a designed experiment or a directed sampling programme) occured as a result of deterministic influences, or whether it is as a result of chance. 

## About this Workshop

The aim of this workshop is to guide you through the outline given above. The workshop focuses broadly (and unequally) on three groups of concepts:

* Data and distributions
* Descriptive statistics and graphics
* Inferential statistics

Data and distributions are unsurprisingly about the data itself. Here we will talk about the various kinds of data that we will encounter as biologists. In the second part we will describe the data using a combination of numerical and graphical summaries. Third, all of this culminates in trying to infer from a small subset (a sample) of subjects if the characteristics under scrutiny also hold true for the entire population. We may also ask questions about probailities, i.e. measuring the likelihood that an event will occur, or that an experiment has an outcome that is different from a situation where the influential factor(s) has no effect, or that some observation or outcome is non-random.

## This is biology: why more R coding?

Please refer to the [Intro R Workshop: Data Manipulation, Analysis and Graphing](https://robwschlegel.github.io/Intro_R_Workshop/) for why we feel strongly that you use R [@R2017] for the analyses that we will perform here. All of the reasons provided there are valid here too, but one reason perhaps more so than others---R and RStudio promote the principles of *reproducible research*, and in fact make it very easy to implement. We will focus on some of these principles throughout the workshop, and the assignments will require that you submit a fully functional working script, complete with all the notes, memos, examples, data, executable code, and output that will result from completing the course material. 

What other options are there for analysing the kinds of data that we will encounter in biological research? Software packages like the ones you may be familiar with, such as Statistica and SPSS, are often used to perform many of these analyses. They are rather limited with regards to the full scope of modern statistical methods in use by biologists today, but many people still use these kinds of software as they provide the basic kinds analyses that still form the staple of the biological and medical sciences. For the many reasons provided above, we prefer to use R as the *engine* within which to do our biological data analysis. R is used by academic statisticians the world over, and it is therefore an excellent choice for our purpose here.

## Installing R and RStudio

We assume that you already have R installed on your computer, as all of you will have already completed the the Intro R Workshop. If you need a refresher, please refer to [Intro R Workshop: Data Manipulation, Analysis and Graphing](https://robwschlegel.github.io/Intro_R_Workshop/) for the installation instructions.

## Resources

* New users should introduce themselves to the [R ecosystem](fg2re.sellorm.com)
* A fancy interactive website that covers a wide range of [basic statistics](http://students.brown.edu/seeing-theory/)
* An easy to follow walkthrough for a [statistical analysis](http://www.sthda.com/english/wiki/unpaired-two-samples-t-test-in-r)
* Learn more about [tidy statistical inference](https://infer.netlify.com)
* A thorough journey through the philosophy of [data visualisation](http://www.serialmentor.com/dataviz/)
* [Google](www.google.com)
* [Stack Overflow](www.stackoverflow.com)

## Style and code conventions

Early on, develop the habit of unambiguous and consistent style and formatting when writing your code, or anything else for that matter. Pay attention to detail and be pedantic. This will benefit your scientific writing in general. Although many R commands rely on precisely formatted statements (code blocks), style can nevertheless to *some extent* have a personal flavour to it. The key is *consistency*. In this book we use certain conventions to improve readability. We also use a consistent set of conventions to refer to code, and in particular to typed commands and package names.

  * Package names are shown in a bold font over a grey box, *e.g.* __`tidyr`__.
  * Functions are shown in normal font followed by parentheses and also over a grey box , *e.g.* `plot()`, or `summary()`.
  * Other R objects, such as data, function arguments or variable names are again in normal font over a grey box, but without parentheses, *e.g.* `x` and `apples`.
  * Sometimes we might directly specify the package that contains the function by using two colons, *e.g.* `dplyr::filter()`.
  * Commands entered onto the R command line (console) and the output that is returned will be shown in a code block, which is a light grey background with code font. The commands entered start at the beginning of a line and the output it produces is preceded by `R>`, like so:


```r
set.seed(666)
rnorm(n = 10, mean = 0, sd = 13)
```

```
R>  [1]   9.7930436  26.1866107  -4.6167480  26.3661820 -28.8193679
R>  [6]   9.8591503 -16.9804084 -10.4327544 -23.2991308  -0.5464219
```

Consult these resources for more about R code style :

  * [Google's R style guide](https://google.github.io/styleguide/Rguide.xml)
  * [The tidyverse style guide](http://style.tidyverse.org)
  * [Hadley Wickham's advanced R style guide](http://adv-r.had.co.nz/Style.html)

We may also insert maths expressions within the text, like this $f(k) = {n \choose k} p^{k} (1-p)^{n-k}$ or on their own, like this: $$f(k) = {n \choose k} p^{k} (1-p)^{n-k}$$

## Assessment and teaching philosophy

Grades will be based on the aggregate performance across two group projects; the first group project was completed after the Intro R Workshop. The project for this workshop will represent 35% of the total grade for BioStatistics. The remaining 15% will come from daily participation. This will be assessed by the R scripts produced in class and follows these five criteria: 

* The script has been uploaded to GitHub
* The script covers the content of the day
* The code runs without errors
* Proper style conventions have been observed
* Liberally commented

__BONUS POINTS__

* Additional analysis not performed in class
* Additional figure not created in class

In cases where students are borderline between lower and higher grades, a high level of participation in the class discussions and class in general will win the day for the higher grade.

The daily scripts are essential to understanding the material. Although they comprise only 15% of the final grade, performance on the projects is usually correlated with effort on the daily assignments.

Whereas plagiarism will not be tolerated, students ARE encouraged to work together to learn from one another and solve problems in a collaborative and collegial way.

## About this document

This document, which as available as an HTML file that's viewable on a web browser of your choice (anything will do, but we discourage using Internet Explorer) and as a PDF (accessible from the link at the top of any of the website's pages) that may be printed, was prepared by the software tools available to R via RStudio. We use the package called `bookdown` that may be accessed and read about [here](https://bookdown.org/yihui/bookdown/) to produce this documentation. The entire source code to reproduce this book is available from my [GitHub repo](https://github.com/ajsmit/Basic_stats).


```r
knitr::include_graphics("figures/bookdown_hex_logo.png")
```

\begin{figure}
\includegraphics[width=2.78in]{figures/bookdown_hex_logo} \caption{Bookdown hex.}(\#fig:rmarkdown)
\end{figure}

You will notice that this repository uses [GitHub](https://github.com), and you are advised to set up your own repository for R scripts and all your data. We will touch on GitHub and the principles of reproducible research later, and GitHub forms a core ingredient of such a workflow.

The R session information when compiling this book is shown below:

```r
sessionInfo()
```

```
R> R version 3.4.4 (2018-03-15)
R> Platform: x86_64-apple-darwin15.6.0 (64-bit)
R> Running under: macOS High Sierra 10.13.4
R> 
R> Matrix products: default
R> BLAS: /Library/Frameworks/R.framework/Versions/3.4/Resources/lib/libRblas.0.dylib
R> LAPACK: /Library/Frameworks/R.framework/Versions/3.4/Resources/lib/libRlapack.dylib
R> 
R> locale:
R> [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
R> 
R> attached base packages:
R> [1] stats     graphics  grDevices utils     datasets  base     
R> 
R> loaded via a namespace (and not attached):
R>  [1] compiler_3.4.4  backports_1.1.2 bookdown_0.7    magrittr_1.5   
R>  [5] rprojroot_1.3-2 tools_3.4.4     htmltools_0.3.6 yaml_2.1.18    
R>  [9] Rcpp_0.12.16    stringi_1.1.7   rmarkdown_1.9   knitr_1.20     
R> [13] methods_3.4.4   xfun_0.1        stringr_1.3.0   digest_0.6.15  
R> [17] png_0.1-7       evaluate_0.10.1
```

