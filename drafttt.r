library(corrgram)
View(baseball)

######output dataset to .xlsx
install.packages("xlsx")
library(xlsx)
write.xlsx(baseball, "c:/baseball.xlsx")

install.packages("faraway")
library(faraway)

help(faraway)

View(gavote)
summary(gavote)
write.xlsx(gavote, "c:/gavote.xlsx")

View(gala)

getwd()
setwd()



install.packages("alr4")
library(alr4)
View(Heights)

?lm
View(salarygov)
head(salarygov)
msalarygov<-lm(MaxSalary~Score,salarygov)
summary(msalarygov)
plot(msalarygov)
write.xlsx(salarygov, "c:/salarygov.xlsx")

View(brains)
View(oldfaith)
View(UN11)
head(UN11)
mUN11<-lm(lifeExpF~fertility+ppgdp,UN11)
summary(mUN11)
write.xlsx(UN11, "c:/UN11.xlsx")

View(wblake)
head(wblake)
mwblake<-lm(Age~Length+Scale,wblake)
summary(mwblake)
write.xlsx(wblake, "c:/wblake.xlsx")



#2016.5.24==============================================

#update.packages
update.packages(ask = FALSE, dependencies = c('Suggests'))

#updating R using the {installr} package
#http://www.r-statistics.com/2013/03/updating-r-from-r-on-windows-using-the-installr-package/

# installing/loading the package:
if(!require(installr)) {
  install.packages("installr"); require(installr)} 
#load / install+load installr

library(installr)

# using the package:
updateR() # this will start the updating process of your R installation.  
#It will check for newer versions, and if one is available, will guide you 
#through the decisions you'd need to make.





#615

```{r}
#2016.9.9
a <- c(1,3,5,7,8)
b <- c(1:9)
plot(b)
```
#what
#the
#hell
#is




#2016.9.13 MA 589 Classnote

1:5
c <- c(1,3,5,-3)
exp(c)
?dnorm
#d:pdf/pmf; p:cdf; q:quantile, inverse cdf; r:sample
alpha <- .05
qnorm(1 - alpha/2)
rnorm(100) #generate 100 observations from a normal distribution
n = 100
s <- rnorm(n)
hist(s)

?cumsum

cummean <- function(s) cumsum(s) / 1:length(s) #create formulas, further packages
cummean(s)
cummean(rnorm(s))

m <- 100
?replicate
s <- replicate(m, cummean(rnorm(n)))

boxplot(t(s))
boxplot(t(s), outline=FALSE)

s1 <- replicate(m, rnorm(n))
?apply
apply(s1, 1, mean)


#set a function, normal confidence interval
norm.ci <- function (n, mu, sigma, alpha = .05) {
  cv <- qnorm(1 - alpha / 2) #critical value
  mu + c(-1, 1) * cv * sigma / sqrt(n)
}
#use apply family
sc <- apply(s, 1, function (r) norm.ci(length))

