Input = ("
 Day  Snake  Openings
         1    D1        85
         1    D3       107
         1    D5        61
         1    D8        22
         1    D11       40
         1    D12       65
         2    D1        58
         2    D3        51
         2    D5        60
         2    D8        41
         2    D11       45
         2    D12       27
         3    D1        15
         3    D3        30
         3    D5        68
         3    D8        63
         3    D11       28
         3    D12        3
         4    D1        57
         4    D3        12
         4    D5        36
         4    D8        21
         4    D11       10
         4    D12       16
         ")

Data <- read.table(textConnection(Input), header = TRUE)
Data$Day = as.factor(Data$Day)

snakes.aov <- aov(Openings ~ as.factor(Day) + Snake, data = Data)
summary(snakes.aov)

# Checking assumptions
# make a histogram of the residuals;
# they must be normal
snakes.res <- residuals(snakes.aov)
hist(snakes.res)

# make a plot of residuals and the fitted values;
# # they must be normal and homoscedastic
plot(fitted(snakes.aov),
     residuals(snakes.aov))
