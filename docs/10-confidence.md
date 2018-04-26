# Confidence intervals




A confidence interval (CI) tells us within what range we may be certain to find the true mean from which any sample has been taken. If we were to repeaqtedly sample the same population ove and over and calculated a mean every time, the 95% CI indicates the range that 95% of those means would fall into.


```r
Input <- ("
Student  Sex     Teacher  Steps  Rating
a        female  Jacob    8000   7
b        female  Jacob    9000  10
c        female  Jacob   10000   9
d        female  Jacob    7000   5
e        female  Jacob    6000   4
f        female  Jacob    8000   8
g        male    Jacob    7000   6
h        male    Jacob    5000   5
i        male    Jacob    9000  10
j        male    Jacob    7000   8
k        female  Sadam    8000   7
l        female  Sadam    9000   8
m        female  Sadam    9000   8
n        female  Sadam    8000   9
o        male    Sadam    6000   5
p        male    Sadam    8000   9
q        male    Sadam    7000   6
r        female  Donald   10000  10
s        female  Donald    9000  10
t        female  Donald    8000   8
u        female  Donald    8000   7
v        female  Donald    6000   7
w        male    Donald    6000   8
x        male    Donald    8000  10
y        male    Donald    7000   7
z        male    Donald    7000   7
")

data <- read.table(textConnection(Input),header = TRUE)
summary(data)
```

```
R>     Student       Sex       Teacher       Steps           Rating      
R>  a      : 1   female:15   Donald: 9   Min.   : 5000   Min.   : 4.000  
R>  b      : 1   male  :11   Jacob :10   1st Qu.: 7000   1st Qu.: 7.000  
R>  c      : 1               Sadam : 7   Median : 8000   Median : 8.000  
R>  d      : 1                           Mean   : 7692   Mean   : 7.615  
R>  e      : 1                           3rd Qu.: 8750   3rd Qu.: 9.000  
R>  f      : 1                           Max.   :10000   Max.   :10.000  
R>  (Other):20
```


```r
library(rcompanion)
# ungrouped data is indicated with a 1 on the right side of the formula, or the group = NULL argument.
groupwiseMean(Steps ~ 1,data = data, conf = 0.95, digits = 3)
```

```
R>    .id  n Mean Conf.level Trad.lower Trad.upper
R> 1 <NA> 26 7690       0.95       7170       8210
```

```r
# one-way data
groupwiseMean(Steps ~ Sex, data = data, conf = 0.95,digits = 3)
```

```
R>      Sex  n Mean Conf.level Trad.lower Trad.upper
R> 1 female 15 8200       0.95       7530       8870
R> 2   male 11 7000       0.95       6260       7740
```

```r
# two-way data
groupwiseMean(Steps ~ Teacher + Sex, data = data, conf = 0.95,digits = 3)
```

```
R>   Teacher    Sex n Mean Conf.level Trad.lower Trad.upper
R> 1  Donald female 5 8200       0.95       6360      10000
R> 2  Donald   male 4 7000       0.95       5700       8300
R> 3   Jacob female 6 8000       0.95       6520       9480
R> 4   Jacob   male 4 7000       0.95       4400       9600
R> 5   Sadam female 4 8500       0.95       7580       9420
R> 6   Sadam   male 3 7000       0.95       4520       9480
```


```r
# by bootstrapping
groupwiseMean(Steps ~ Sex,
              data = data,
              conf = 0.95,
              digits = 3,
              R = 10000,
              boot = TRUE,
              traditional = FALSE,
              normal = FALSE,
              basic = FALSE,
              percentile = FALSE,
              bca = TRUE)
```

```
R>      Sex  n Mean Boot.mean Conf.level Bca.lower Bca.upper
R> 1 female 15 8200      8200       0.95      7530      8670
R> 2   male 11 7000      7000       0.95      6270      7550
```

```r
groupwiseMean(Steps ~ Teacher + Sex,
              data = data,
              conf = 0.95,
              digits = 3,
              R = 10000,
              boot = TRUE,
              traditional = FALSE,
              normal = FALSE,
              basic = FALSE,
              percentile = FALSE,
              bca = TRUE)
```

```
R>   Teacher    Sex n Mean Boot.mean Conf.level Bca.lower Bca.upper
R> 1  Donald female 5 8200      8190       0.95      6800      9000
R> 2  Donald   male 4 7000      7000       0.95      6000      7500
R> 3   Jacob female 6 8000      8010       0.95      6830      8830
R> 4   Jacob   male 4 7000      6990       0.95      5500      8000
R> 5   Sadam female 4 8500      8500       0.95      8000      8750
R> 6   Sadam   male 3 7000      7000       0.95      6000      7670
```


