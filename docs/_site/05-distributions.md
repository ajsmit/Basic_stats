# Distributions




Therefore, we must next learn about the different types of data distributions we are likely to encounter in the wild.

## Discrete distributions
A discrete random variable has a finite or countable number of possible values. As the name suggests, it models integer data. Below we provide options to generate and visualise data belonging to several classes of discrete distributions. Later (Chapter X) we will learn how to transform these data prior to performing the approapriate statistical analysis.

### Bernoulli distribution
A Bernoulli random variable, $x$, takes the value 1 with probability of $p$ and the value 0 with probability of $1−p$. It is used to represent data resulting from experiments with binary outcomes, such as a coin toss.

$$
f(x;p)=
  \begin{cases}
    p, &\text{if}~x=1\\
    1-p, &\text{if}~x=0
  \end{cases}
$$

### Binomial distribution
A binomial random variable, $x$, is the sum of $n$ independent Bernoulli random variables with parameter $p$. This data distribution results from repeating identical experiments that produce a binary outcome with probability $p$ a specified number of times, and choosing $n$ samples at random:

$$f(x;n,p)= {n\choose x}p^{x}(1-p)^{n-x}$$

### Negative binomial distribution
A negative binomial random variable, $x$, counts the number of successes in a sequence of independent Bernoulli trials with probability $p$ before $r$ failures occur. This distribution could for example be used to predict the number of heads that result from a series of coin tosses before three tails are observed:

$$f(x;n,r,p)= {x+r-1\choose x}p^{x}(1-p)^{r}$$

<iframe src="https://robert-schlegel.shinyapps.io/binomial_dist/?showcase=0" width="672" height="600px"></iframe>

### Geometric distribution
A geometric random variable, $x$, represents the number of trials that are required to observe a single success. Each trial is independent and has success probability $p$. As an example, the geometric distribution is useful to model the number of times a die must be tossed in order for a six to be observed. It is given by:

$$f(x;p)=(1-p)^{x}p$$

### Poisson distribution
A Poisson random variable, $x$, tallies the number of events occurring in a fixed interval of time or space, given that these events occur with an average rate $\lambda$. Poisson distributions can be used to model events such as meteor showers and or number of people entering a shopping mall. This equation describes the Poison distribution:

$$f(x;\lambda)=\frac{\lambda^{x}e^{-\lambda}}{x!}$$

<iframe src="https://robert-schlegel.shinyapps.io/poisson_dist/?showcase=0" width="672" height="600px"></iframe>

## Continuous distributions

### Uniform distribution

<iframe src="https://robert-schlegel.shinyapps.io/uniform_dist/?showcase=0" width="672" height="600px"></iframe>

### Normal distribution

<div class="figure">
<img src="figures/Boxplot_vs_PDF.svg" alt="Boxplot and probability density function of a normal distribution *N*(0, σ^2^). Credit: [Wikipedia](https://en.wikipedia.org/wiki/Probability_density_function)"  />
<p class="caption">(\#fig:PDF)Boxplot and probability density function of a normal distribution *N*(0, σ^2^). Credit: [Wikipedia](https://en.wikipedia.org/wiki/Probability_density_function)</p>
</div>

### Student T distribution

<iframe src="https://robert-schlegel.shinyapps.io/student_t_dist/?showcase=0" width="672" height="600px"></iframe>

### Chi-squared distribution

<iframe src="https://robert-schlegel.shinyapps.io/chi_squared_dist/?showcase=0" width="672" height="600px"></iframe>

### Exponential distribution

<iframe src="https://robert-schlegel.shinyapps.io/exponential_dist/?showcase=0" width="672" height="600px"></iframe>

### F distribution

<iframe src="https://robert-schlegel.shinyapps.io/f_dist/?showcase=0" width="672" height="600px"></iframe>

### Gamma distribution

### Beta distribution
