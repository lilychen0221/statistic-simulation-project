# set seed for reproducability
set.seed(1234)

# set lambda to 0.2
lambda <- 0.2

# 40 samples and 1000 simulations
n <- 40
nSim <- 1000

# simulate
simulated_exponentials <- replicate(nSim, rexp(n, lambda))

# calculate mean of exponentials
means_exponentials <- apply(simulated_exponentials, 2, mean)

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

# standard deviation of distribution
sd_dist <- sd(means_exponentials)
sd_dist

# standard deviation from analytical expression
sd_theory <- (1/lambda)/sqrt(n)
sd_theory

# variance of distribution
var_dist <- var(means_exponentials)
var_dist

# variance from analytical expression
var_theory <- ((1/lambda)*(1/sqrt(n)))^2
var_theory

#fitting the data with a normal distrution (mean = 1/lambda, sd = 1/lambda/sqrt(40))
xfit <- seq(min(means_exponentials), max(means_exponentials), length=100)
yfit <- dnorm(xfit, mean = 1/lambda, sd = 1/lambda/sqrt(n))
hist(means_exponentials,breaks=n,prob=T,col="purple",xlab = "means",main="Density of means",ylab="density")
lines(xfit, yfit , col = "green", lty = 5, lwd = 2)


# compare the distribution of averages of 40 exponentials to a normal distribution
qqnorm(means_exponentials, col = "blue")
qqline(means_exponentials, col = "red")
