---
output: html_document
---
Statistic Inference
========================================================
# Part 1 Simulation Exercise
## Simulations
In this project I investigate the exponential distribution in R and compare it with the Central Limit Theorem. The exponential distribution can be simulated in R with rexp(n, lambda) where lambda is the rate parameter. The mean of exponential distribution is 1/lambda and the standard deviation is also 1/lambda. Set lambda = 0.2 for all of the simulations. I investigate the distribution of averages of 40 exponentials. 


```{r}
set.seed(1234)
lambda <- 0.2
n <- 40
nSim <- 1000
simulated_exponentials <- replicate(nSim, rexp(n, lambda))
means_exponentials <- apply(simulated_exponentials, 2, mean)
```

## Results
1. Show the sample mean and compare it to the theoretical mean of the distribution.

```{r}
## distrribution mean
mean_dist <- mean(means_exponentials)
mean_dist

# analytical mean
mean_theory <- 1/lambda
mean_theory

# visualization
hist(means_exponentials, xlab = "mean", main = "Exponential Function Simulations")
abline(v = mean_dist, col = "red")
abline(v = mean_theory, col = "yellow")
```

The analytics mean is 4.974239 and  the theoretical mean is 5. The center of distribution of averages of 40 exponentials is very close to the theoretical center of the distribution.

2. Show how variable the sample is (via variance) and compare it to the theoretical variance of the distribution.

```{r}
# standard deviation of distribution
sd_dist <- sd(means_exponentials)
sd_dist

# standard deviation from analytical expression
sd_theory <- (1/lambda)/sqrt(n)
sd_theory

# variance of distribution
var_dist <- sd_dist^2
var_dist

# variance from analytical expression
var_theory <- ((1/lambda)*(1/sqrt(n)))^2
var_theory
```
Standard Deviation of the distribution is  0.7554171 with the theoretical SD calculated as 0.7905694. The Theoretical variance is calculated as 0.625. The actual variance of the distribution is 0.5706551.

3. Show that the distribution is approximately normal.

```{r}


xfit <- seq(min(means_exponentials), max(means_exponentials), length=100)
yfit <- dnorm(xfit, mean = 1/lambda, sd = 1/lambda/sqrt(n))
hist(means_exponentials,breaks=n,prob=T,col="lightblue",xlab = "means",main="Density of means",ylab="density")

lines(xfit, yfit , col = "purple", lty = 5, lwd = 2)


# compare the distribution of averages of 40 exponentials to a normal distribution
qqnorm(means_exponentials, col = "lightblue")
qqline(means_exponentials, col = "red")
```

Due to the central limit theorem (CLT), the distribution of averages of 40 exponentials is very close to a normal distribution.