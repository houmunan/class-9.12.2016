#Class 9.12.2016 MON

a <- 2
b <- 50
c <- 3
a+b
b/a
50%%3 #余
a_vec <- c(3, 50, 5, 6, 10, 50, 20, 2, 100, 30, 25, 80)
str(a_vec) #structure command, show structure
sum(a_vec) #和
summary(a_vec)
length(a_vec)
boxplot(a_vec)
cumsum(a_vec) #cumulative sum
is.vector(a_vec) #
data()

#rundom numbers 生成随机数
runif(20) #括号里点“Tab”显示下拉菜单
options(digits = 2)
nums <- runif(20)
nums

plot(nums)
hist(nums)

set.seed(5)
runif(30)

head(nums) #显示前五个
tail(nums) #显示后五个


#生成矩阵MATRIX

A <- matrix(data = floor(30*runif(16)),nrow = 4, byrow = TRUE)
View(A) #View大写开头

#byrow的意思是什么：
values <- 30*runif(16)
values

#floor的意思是，

A
A[3,3]

dim(A) #显示Dimension

d <- dim(A)
d[1]

b <- floor(20*runif(dim(A)[2]))

x <- solve(A,b)

A%*%x #矩阵相乘


e <- floor(20*runif(4))
f <- floor(20*runif(4))
e*f
sum(e*f)

t(e)%*%f #transport of e


e
f
outer(e,f,"*")
outer(e,f,">")
outer(e,f,">")*1



#Class 9.14.2016 Wed

#TURN IN HOMEWORK: Click"File - Compile Notebook"


a <- runif(9)
a
str(a) #structure command, show structure,显示大体结构等资料
length(a)
typeof(a)

#判断类型

is.atomic(a)
is.list(a)
is.vector(a)

a[5]
a[5] <- NA #删除a中第五个;you can decide how to modify the data

typeof(a[5])

c <- as.integer(50*a)
c
is.atomic(c)
is.list(c)
c[5]
is.na(c)
is.na(c)*1
typeof(c[5])
class(a)

d <- c(c(1,2,3),c(4,5,6))
d

#example:mtcars
dat1 <- mtcars
str(dat1)



mtcars[,1]
typeof(mtcars[,1])
model1 <- lm(mtcars$mpg~mtcars$hp,data = mtcars)
model1 <- lm(mtcars$mpg~mtcars$hp)







#Class 9.16.2016 FRI


#Exercise 1 Question 2

par(new=TRUE)
x <- seq(3,6,by=0.1)
prod <- exp(x)*cos(x)
plot(prod, col="blue", type="l")
points(cos(x),col="red")
#par(new=TRUE)
#y <- exp(x)
points(exp(x),col="green")



#Exercise 1 Question 6

set.seed(50)


xVec <- sample(0:999, size=250, replace=TRUE)
yVec <- sample(0:999, size=250, replace=TRUE)

#hehe
a <- c(10:20)
a[-3]#dropped the 3rd element of the vector
#hehe over

yVec <- yVec[-1]#delete the first element
xVec <- xVec[-length(xVec)]#dropping the last one, can also use"-250" instead of "-length"
dVec <- yVec - xVec


#Ex 1 Q 7

#a

set.seed(50)

yVec <- sample(0:999, size=250, replace=TRUE)
plot(yVec, col="red")

bVec <- yVec[yVec>600]
points(bVec, col="green")


#another way

cVec <- (yVec>600)*1
head(cVec, 20)
length(cVec)
points(yVec*cVec, col="blue")



#Ex 2 Q 4

outer(0:4,0:4,"+") #if no "+" then default is multiplication

A <- matrix(0, nrow=6, ncol=6, byrow=TRUE)
row(A)
col(A)

#abs(col(A)-row(A))==1
(abs(col(A)-row(A))==1)*1

#try not using any FOR loops cause toooooo slow













#Class 9.19.2016 MON

dir() #List the files under your repository directory location?? wtf

#> dir()
#[1] "1.Rmd"                 "Assignment 2.Rmd"      "Assignment_2.html"     "Class 2 outline.Rmd"  
#[5] "class 9.12.2016.R"     "class 9.12.2016.Rproj" "class 9.16.2016.R"     "draft.html"           
#[9] "draft.R"

data <- read.csv("blue2.csv", header = TRUE, stringsAsFactors = FALSE)

datacars <- mtcars

#clean up data 接下来











#Class 9.21.2016 WED

#sapply(some matrix) merge each row into one row
sb <- matrix(c(1,2,3,4,2,3,4,5,3,4,5,6,4,5,6,7), nrow = 4, byrow = TRUE)
sb
sapply(sb,FUN = "+")
sapply(sb,FUN = "-")

apply(sb,1,"sum") #summary by each row
apply(sb,2,"sum") #summary by each column
?apply
??apply

#class note
#data from usda website https://quickstats.nass.usda.gov/

dir()
data <- read.csv(file = "B1952F63-B856-3C48-BF5E-7F3ADF2E795D.csv")

agdata <- data
length(agdata$County[agdata$County==NA])

data <- read.csv(file = "B1952F63-B856-3C48-BF5E-7F3ADF2E795D.csv", stringsAsFactors = )


#use of "APPLY"
m <- matrix(c(1:10,11:20), nrow=10, ncol=2)
m

apply(m,1,mean) #m is data, 1 is dimension, i.e. row, mean is the function

??magrittr

library(magrittr)

m %>% apply(1, mean)
m %>% apply(1, mean) %>% sum()

m %>% apply(2, mean)


#alt-shift-k  so cntrl-shift-m


#how about lists? lappaly -- but BEWARE it returns lists

myList <- list(A = matrix(1:12,4), b = c(20,3,7), C = matrix(7,5,10))
myList

b <- myList %>% lapply(sum)
b
?lapply












#Class 9.23.2016 FRI


sum <- 0
c <- c(2,3,pi,4)
for (i in 1:24) {
  for (j in 1:4) {
    sum <- sum + (cos(i * pi * c[j]))
  }
}
sum

i <- 1:24
j <- c(2,3,pi,4)
c <- outer(1:24, c(2, 3, pi, 4), "*")
m <- cos(c*pi)
sum(m)








#Class 10.3.2016 MON class note

#ggplot2, writing functions
#ggplot2 <- <- <- <- <- <- <- <- <- 
#Wed assignments


#functions

func.name <- function(inputs){
  #-your staff goes here-
  return()
}

#example

hi <- function(){
  "hello there"
}

hii <- function(n){
  a = rep(x = "hello",n)
  print(a)
  b = runif(n)
  return(b)
}

hii(20)

#ggplot2
#this package simply start of saying 
install.packages("munsell")
install.packages("labeling")
library(ggplot2)
library(labeling)


ggplot(Orange, aes(x=circumference, y=age)) + geom_point() + geom_smooth(method = lm)

model <- lm(formula = )


p1 <- ggplot(model, aes(.fitted, .resid))+geom_point()
p1 <- p1+stat_smooth(method="loess")+geom_hline(yintercept = 0, col="red", linetype="dashed")










#Class 13 10.5.2016 WED class note

#############
#summ 1(a).R#
#############

summ = function(x){
  # Note that I have added a message to stop().  I haven't been able to reproduce
  # the message was saw in class.
  if(is.numeric(x)==F)stop("Invalid input. summ() only takes numeric vectors.")
  return(list(mean(x),median(x),var(x)))
}


## test with z and z1.  z produces values and z1 stops the program.

z <- c(1,2,3,4,5,6,7,8,9)

z1 <- "how about a mean?"


#############
#rand 1(d).R#
#############

library(ggplot2)


# random walk function
rands <- function(k){
  # check to make sure input is an integer.
  k1 = as.integer(k)
  if(k1 != k)stop('rands() requires an integer value to start.')
  
  # initialize i and x
  i=1
  x=0
  while(x[i] != k){
    if(runif(1)<.5)D = 1
    else D = -1
    i = i+1
    x[i] = x[i-1]+ D
    
  }
  return(data.frame(x))
}

## try it with 11
set.seed(10)
ser <- data.frame(rands(11))
t <- 1:length(ser$x)
qplot(t,x, data=ser, geom="line") #qplot: quick plot, simple version of qqplot


## try it with "hello"

ser <-data.frame("hello")

## try it with 3.4

ser <- data.frame(3.4)



rands(ser)



#########
# ma3.R #
#########


set.seed(10)

rand <- rnorm(20)


ma3 <- function(x)
{
  #check for size and type
  r=length(x) 
  x=c(x,0,0,0,x,0,0,0,x)
  x=matrix(x, ncol = r+2, nrow = 3, byrow = TRUE)
  
  return(as.vector(colMeans(x)))
  
}

mov <- ma3(rand)
# acf(rand)   auto correlation function
# pacf(mov)   partial acf
# pacf(rand)
# acf(mov)



##################
#exp-poi-gam(1).R#
##################


library(ggplot2)
library(qualityTools)


# create a vector of w exponential waiting times with lambda = lam

wait <- function(w,lam){
  a = NULL
  for(i in 1:w){
    a = c(a,rexp(1,rate = lam))
  }
  return(a)
}




# create a vector of exponential waiting times which total t <= Max with lambda = lam

wait.until <- function(Max,lam){
  # set.seed(50)
  time = 0
  a = NULL
  while(time < Max){
    inter = rexp(1,lam)
    a = c(a,inter)
    time = time + inter
  }
  return(a[1:(length(a)-1)])  ##test w seed ## haha use ()
}


# now simulate the number of events to show that the number of events divided by
# exponential waiting times are Poisson distributed
# (don't forget to comment out the "set.seed")

poi.test <- function(rep, Max, lam){
  a = NULL
  for(i in 1:rep){
    q = wait.until(Max,lam)
    a = c(a,length(q))
  }
  return(a)
}


# now simlate the waiting time for k events to occur with lambda = lam

wait.for <- function(k, lam){
  time = 0
  count = 0
  a = NULL
  while(count < k){
    inter=rexp(1,lam)
    count = count + 1
    time = time+inter
  }
  
  return(time)
} 



gam.test <-function(rep, max.e, lam ){
  a=NULL
  for (i in 1:rep){
    t = wait.for(max.e,lam)
    a = c(a,t)
    
  }
  
  return(a)
}


















##Class 13 10.7.2016 FRI class note Assignment 4 note

left <- function(x){
  return(x^2 + 4^x - 7)
}

right <- function(x){
  return(x^2 - 4^x - 7)
}

combo <- function(x){
  if(x<0){return(left(x))}
  else if(x >= 0 & x < 2){return(mod(x))}
  else if(x >= 2){return(right(x))}
  else(stop("yo"))
}


four24 <- function(x, plot = FALSE){
  loops = length(x)
  out = rep(0,loops)
  for(i in 1:loops){
    if (x[i] <= -4 | x[1] >= 4) {
      #warn .... [TRUNCATED]
      warning("input values outside the range -4<x<4 are skipped")
      out[i] = NA
      next
    }
  out[i] = combo(x[i])
  }
  if(plot==TRUE){
    plot(out,na.omit)
  }
  return(out)
}

four24(seq(-4, 4, .5), plot = TRUE)




14.4/(sqrt((1.4)^2*52))
100/52

.4207^52

















##Class 14 10.11.2016 MON(TUE) class note midterm project note

library(jsonlite)
?jsonlite
dir()









##Class 16 10.12.2016 WED class note Assignment 4 note

# Writing data, in txt, csv or Excel file formats, 
# is the best solution if you want to open these files 
# with other analysis software, such as Excel. However 
# this solution doesn’t preserve data structures, such 
# as column data types (numeric, character or factor). In
# order to do that, the data should be written out in R 
# data format.

# 1) save a single R object
# 2) save multiple R objects
# 3) save entire workspace in a specified file.

x <- rep(c(1,1,3,4,5),10000)
y <- rep(c('a','b','c','d','e'),10000)
z <- rep(c(as.Date("2016-08-01"),as.Date("2016-09-01"),
           as.Date("2016-10-01"),as.Date("2016-11-01"),
           as.Date("2016-12-01")),10000)
df <- data.frame(x=x,y=y,z=z)
p <- hist(x)


# save one object to a file (saveRDS, readRDS)

write.csv(df,'xyz.csv')
saveRDS(df, file="xyz.rds")
saveRDS(df, file="xyz.rda")

saveRDS(x,'x.rds') # Rds stores a single r object
saveRDS(x,'x.rda') # Rda, short name for RData


# clear your work space
rm(list=ls())

# read data
df <- read.csv('xyz.csv')
df1 <- readRDS("xyz.rds")
df2 <- readRDS("xyz.rda")
x1 <- readRDS("x.rds")
x2 <- readRDS("x.rda")
x <- rep(c(1,1,3,4,5),10000)
y <- rep(c('a','b','c','d','e'),10000)
z <- rep(c(as.Date("2016-08-01"),as.Date("2016-09-01"),
           as.Date("2016-10-01"),as.Date("2016-11-01"),
           as.Date("2016-12-01")),10000)
p <- hist(x)


# save multiple objects (save, load)

save(df, x, y, p, file="xyz.Rdata")
rm(list=ls())
load("xyz.Rdata")


# save entire workspace (save.image, load)

save.image()
rm(list=ls())
load('.RData')

save.image('myworkspace.RData')
rm(list=ls())
load('myworkspace.RData')


#plyr package 拆分list，转换vector matrix list之类的
install.packages("plyr")
library("plyr")














##Class 17 10.17.2016 MON class note ggplot2 note

data(mtcars)
df <- mtcars[,c("mpg", "cyl", "wt")]#subset of mtcars

head(df)

levels(df$cyl) #所有outcome的种类，列出来
# NULL #因为是numerical，不是factor，要先转化factor
df$cyl <- as.factor(df$cyl)
levels(df$cyl)

library(ggplot2) #用ggplot画图
qplot(x = wt, y = mpg, data = df, geom = c("point"))
qplot(x = wt, y = mpg, data = df, geom = c("point", "smooth"))

ggplot(data = mtcars, aes(x = wt, y = mpg)) + geom_point()
ggplot(data = mtcars, aes(x = wt, y = mpg)) + geom_point() + geom_smooth()
ggplot(data = mtcars, aes(x = wt, y = mpg)) + geom_point() + stat_smooth()

qplot(x = wt, y = mpg, data = df, color = cyl, shape = cyl)





##Class 18 10.19.2016 WED discuss note ggvis dplyr leaflet note

install.packages("ggvis")
library(ggvis)

head(mtcars)
mtcars$wt
mtcars$mpg

p <- ggvis(mtcars, x=~wt, y=~mpg)
layer_points(p)
layer_points(ggvis(mtcars, x=~wt, y=~mpg))

mtcars %>% ggvis(x=~wt, y=~mpg) %>% layer_points()
mtcars %>% ggvis(x=~wt, y=~mpg) %>% layer_lines()
mtcars %>% ggvis(x=~wt, y=~mpg) %>% layer_paths()

mtcars %>% ggvis(x=~factor(cyl), y=~mpg) %>% layer_boxplots()

set.seed(100)

df <- data.frame(x=1:10, y=runif(10), y2=runif(10))
df

df %>% ggvis(~x, ~y) %>% layer_paths(fill:="red")
df %>% ggvis(~x, ~y, y2=~y2) %>% layer_ribbons(fill:="blue") #fill gap between to var.

t <- seq(0, 2*pi, length = 100)
df <- data.frame(x=sin(t), y=cos(t))
df %>% ggvis(~x, ~y) %>% layer_paths(fill:="brown")


df <- data.frame(x=c(1:3), y=c(2,4,3), z=c("X", "y", "z"))
df %>% ggvis(~x, ~y, text:=~z) %>% layer_text(fontSize=~45, angle:=45) #fontSize, S capital


#dplyr

library(dplyr)

mtcars %>% filter(gear>3) %>% ggvis(x=~wt, y=~mpg) %>% layer_points() %>% layer_smooths()

mtcars %>% filter(gear>3) %>% ggvis(x=~wt, y=~mpg, stroke=~gear) %>% layer_points()
mtcars %>% filter(gear>3) %>% ggvis(x=~wt, y=~mpg, size=~gear) %>% layer_points()
mtcars %>% filter(gear>3) %>% ggvis(x=~wt, y=~mpg, size=~gear, fill=~am) %>% layer_points()
mtcars %>% filter(gear>3) %>% ggvis(x=~wt, y=~mpg, size=~gear, fill:="red", shape=~factor(am)) %>% layer_points()
mtcars %>% filter(gear>3) %>% ggvis(x=~wt, y=~mpg, size=~gear, fill:="red", shape=~factor(am), opacity:=0.4) %>% layer_points()


######

mtcars %>% ggvis(~wt, ~mpg, size= input_slider(10,100), opacity= input_slider(0,1)) %>% layer_points()
mtcars %>% ggvis(~wt) %>% layer_histograms(width= input_slider(0.1,3,step=.05))
mtcars %>% ggvis(~wt, y= input_select(c("mpg", "am", "gear"), map=as.name)) %>% layer_points()

mtcars %>%
  ggvis(x=input_select(colnames(mtcars), map=as.name,label='x'),
        y=input_select(colnames(mtcars), map=as.name,label='y'),
        size=input_select(colnames(mtcars), map=as.name,label='size'),
        fill=input_select(colnames(mtcars), map=as.name,label='fill')
  ) %>% layer_points() %>%
  add_axis("x", title='x axis') %>%
  add_axis("y", title='y axis')

install.packages("leaflet") #grab things from internet and showing in R
library(leaflet)
# m=leaflet() %>% ...............................................






##Class 20 10.24.2016 MON

##Class 21 10.26.2016 WED BOOTSTRAP Bootstrap Package:"shiny"
install.packages("shiny")
library(shiny)

p11 <- 42/49
p21 <- 7/12
p12 <- 7/49
p22 <- 5/12

ep11 <- 49/61
ep21 <- 49/61
ep12 <- 12/61
ep22 <- 12/61

chisq <- (
  ((p11 - ep11)^2/ep11)
  +((p12 - ep12)^2/ep12)
  +((p21 - ep21)^2/ep21)
  +((p22 - ep22)^2/ep22)
  )

chisq



(73.5)/(1.79)^2
(80)/(1.79)^2








##Class 21 10.31.2016 MON mapping package:“ggmap”

install.packages("ggplot2")
install.packages("ggmap")
install.packages("sp")
install.packages("RgoogleMaps")
install.packages("maptools")
install.packages("datasets")
install.packages("tigris")

library(ggplot2)
library(ggmap)
library(sp)
library(RgoogleMaps)
library(ggmap)
library(maptools)
library(datasets)
library(tigris)


################################
#Kahle-Wickham Fig 1 - step 1.R#
################################

library(tigris)
library(sp)
library(rgeos)

# Dallas, TX census tracts

dfw = tracts(state='TX', county = c('Dallas', 'Tarrant'))
plot(dfw)

# Houston, TX census tracts

hou = tracts(state='TX', county = 'Harris County')
plot(hou)


# MA census tracts

ma = tracts(state='MA')
plot(ma)


# Houston, TX zip code areas

# uas <- urban_areas()
# 
# dfh <- zctas(cb=T, starts_with = "77")
# houston_ua <- uas[grep("Houston, TX", uas$NAME10), ]
# hou_zcta <- dfh[as.vector(gIntersects(dfh, houston_ua, byid = TRUE)), ]
# plot(hou_zcta)


# Boston, MA zip code areas
# 
# dfb <- zctas(cb=T, starts_with = "02")
# boston_ua <- uas[grep("Boston, MA", uas$NAME10), ]
# bos_zcta <- dfb[as.vector(gIntersects(dfb, boston_ua, byid = TRUE)), ]
# plot(bos_zcta)




########
#maps.R#
########

library(sp)
library(RgoogleMaps)
library(ggmap)
library(ggplot2)
library(maptools)
library(datasets)
library(tigris)


# figure 2
murder <- subset(crime, offense == "murder") # the data is from ggmap
qmplot(lon, lat, data = murder, colour = I('red'), size = I(3), darken = .3)

## from google maps
# ?geocode
#
geocode("the white house")
qmap("the white house", zoom=18)


geocode("Hawaii")
qmap("Hawaii",zoom=8)

qmap("hanalei",zoom=12)
qmap("hanalei", zoom = 14)
qmap("hanalei", zoom = 15)
geocode(location="02134")

qmap(location="02215", zoom=17)

qmap("hanalei", zoom = 14, source = "stamen", maptype = "watercolor")

# figure 3
baylor <- "baylor university"
qmap(baylor, zoom=14)
qmap(baylor, zoom=14, source="osm")

# figure 4
set.seed(50)
df <- round(data.frame(
  x = jitter(rep(-71.05977, 40), amount = .3),
  y = jitter(rep( 42.35843, 40), amount = .3)
), digits = 2)
map <- get_googlemap('Boston', markers = df, path = df, scale = 1)
ggmap(map, extent = 'device')

# figure 5
qmap(baylor, zoom = 14, source = "stamen", maptype = "watercolor")
qmap(baylor, zoom = 14, source = "stamen", maptype = "toner")


paris <- get_map(location="paris")
str(paris)

# ggplot(aes(x = lon, y = lat), data = fourCorners) +
#   geom_blank() + coord_map("mercator") +
#   annotation_raster(ggmap, xmin, xmax, ymin, ymax)

# figure 7
ggmap(paris, extent = "normal")



# find a reasonable spatial extent
qmap('houston', zoom=13)
#gglocator(2)
# only violent crimes
violent_crimes <- subset(crime, offense != "auto theft" & offense != "theft" & offense != "burglary")
# order violent crimes
violent_crimes$offense <- factor(violent_crimes$offense, levels=c("robbery", "aggravated assault", "rape", "murder"))
# restrict to downtown
violent_crimes <- subset(violent_crimes, -95.39681 <= lon & lon <= -95.34188 & 29.73631 <= lat & lat <= 29.78400)

# figure 8
theme_set(theme_bw(16))
HoustonMap <- qmap("houston", zoom=14, color="bw")#, legend="topleft") # it's just like ggplot()
HoustonMap + geom_point(aes(x=lon, y=lat, colour=offense, size=offense), data=violent_crimes)
HoustonMap + stat_bin2d(aes(x=lon, y=lat, colour=offense, fill=offense), 
                        size=.5, 
                        bins=30, 
                        alpha=0.5, # transparency
                        data=violent_crimes)

# figure 9
houston <- get_map("houston", zoom=14)
HoustonMap + stat_density2d(aes(x=lon,y=lat,fill=..level.., alpha=..level..),
                            size=2, bins=4, data=violent_crimes,
                            geom="polygon")
overlay <- stat_density2d(aes(x=lon, y=lat, fill=..level.., alpha=..level..),
                          bins=4, geom="polygon",
                          data=violent_crimes)
HoustonMap + overlay + inset(grob=ggplotGrob(ggplot()+overlay+theme_inset()),
                             xmin=-95.35836, xmax=Inf, ymin=-Inf, ymax=29.75062)

# figure 10
houston <- get_map(location="houston", zoom=14, color="bw",
                   source="osm")
HoustonMap <- ggmap(houston, base_layer=ggplot(aes(x=lon,y=lat),
                                               data=violent_crimes))
HoustonMap + 
  stat_density2d(aes(x=lon,y=lat,fill=..level..,alpha=..level..),
                 bins=5, geom="polygon",
                 data=violent_crimes) +
  scale_fill_gradient(low="black", high="red") +
  facet_wrap(~day)

# ggmap's utility functions
geocode("baylor university", output="more")
gc <- geocode("boston university")
(gc <- as.numeric(gc))
revgeocode(gc)
revgeocode(gc, output="more")
from <- c("houston", "houston", "dallas")
to <- c("waco, texas", "san antonio", "houston")
mapdist(from, to)
###############################################################
map <- get_googlemap("02134", markers = df, scale = 4)
ggmap(map, extent = 'device')

geocode("Boston")
set.seed(50)
df <- round(data.frame(
  x = jitter(rep(-71.05977, 40), amount = .3),
  y = jitter(rep( 42.35843, 40), amount = .3)
), digits = 2)
map <- get_googlemap('Boston', markers = df, path = df, scale = 1)
ggmap(map, extent = 'device')

# Google's four type: terrain, satellite, roadmap, hybrid



# Both Stamen Maps and CloudMade Maps are built using OpenStreetMap data

#                                the ggmap function
# The one minor drawback to using
# CloudMade Maps is that the user must register with CloudMade to obtain an API key and then pass
# the API key into get_map with the api_key argument
paris <- get_map(location = "paris")
str(paris)
qmap(baylor, zoom = 14, maptype = 53428, api_key = api_key, source = "cloudmade") 
qmap("houston", zoom = 10, maptype = 58916, api_key = api_key, source = "cloudmade")

ggplot(aes(x = lon, y = lat), data = fourCorners) +
  geom_blank() + coord_map("mercator") +
  annotation_raster(ggmap, xmin, xmax, ymin, ymax)

# It accepts three possible strings: "normal" shown in Figure 7, "panel" shown in Figures 10 and
# 12, and "device" shown in every other figure.

# setting the limits of the plot panel to be the longitude and latitude extents of the map with
# scale_[x,y]_continuous(expand = c(0,0))

# base_layer, facet_wrap and facet_grid

ggmap(paris, extent = "device")

# The legend-related arguments of ggmap are legend and padding, only applicable
# when extent = "device" 

#                                ggmap in action
str(crime)

# gglocator , a ggplot2 analogue of base’s locator function exported from ggmap. 
# gglocator works not only for ggmap plots, but ggplot2 graphics in general.

# find a reasonable spatial extent
qmap('houston', zoom = 13)
gglocator(2)
# only violent crimes
violent_crimes <- subset(crime, 
                         offense != "auto theft" & offense != "theft" & offense != "burglary")
# order violent crimes
violent_crimes$offense <- factor(violent_crimes$offense,
                                 levels = c("robbery", "aggravated assault", "rape", "murder"))
# restrict to downtown
violent_crimes <- subset(violent_crimes,
                         -95.39681 <= lon & lon <= -95.34188 &
                           29.73631 <= lat & lat <= 29.78400)




clicks <- clicks <- gglocator(4)
box <- expand.grid(lon=clicks$lon, lat=clicks$lat)



install.packages("ctest")



























##Class 25 11.2.2016 WED mapping package:“ggmap” continue DISCUSS

########
#maps.R#
########


##### ggmap
install.packages("rgdal")
install.packages("scales")
install.packages("ggplot2")
install.packages("ggthemes")
library(rgdal)
library(ggmap)
library(ggplot2)
library(scales)
library(ggthemes)

# get US county shape file
# https://www.census.gov/geo/maps-data/data/cbf/cbf_counties.html
us_county <- readOGR(dsn=".", layer="cb_2015_us_county_5m") #S4
county_shape <- spTransform(us_county, CRS("+proj=longlat +datum=WGS84")) #S4
county_shape <- fortify(county_shape) # list
county_shape$group <- as.numeric(as.character(county_shape$id))

USmap <- get_map("United States", zoom=4)
ggmap(USmap) + geom_polygon(aes(x=long, y=lat, group=group,fill=group), 
                            size=.2,color='green', 
                            data=county_shape, alpha=.3)

View(county_shape)
# boston shape file
# https://data.cityofboston.gov/City-Services/Boston-Neighborhood-Shapefiles/af56-j7tb/data
bos_shape_source <- readOGR(dsn=".", layer="Bos_neighborhoods") #S4
bos_shape_0 <- spTransform(bos_shape_source, CRS("+proj=longlat +datum=WGS84")) #S4
bos_shape <- fortify(bos_shape_0) # list

# combine boundary with neighborhoods name
df.name <- data.frame(name=bos_shape_source$Name,
                      id=c(0:(length(bos_shape_source$Name)-1)))
df.name$name <- as.character(df.name$name)

# merge
bos_shape <- merge(x=bos_shape, y=df.name, by.x="id", by.y="id")
bos_shape <- merge(x=bos_shape, y=bos_shape_0, by.x="name", by.y="Name")

# aggregate
name.location <- aggregate(cbind(long,lat) ~ name, data=bos_shape, FUN=function(x) mean(range(x))) # mean of upper and lower limit

# draw the shape
ggplot(data = bos_shape, aes(x = long, y = lat, group = group)) + geom_path()
ggplot(data = bos_shape, aes(x = long, y = lat, group = group)) + geom_polygon()

# combine with map
BostonMap <- get_map("Boston", zoom=11)

ggmap(BostonMap) + geom_path(data = bos_shape, aes(x = long, y = lat, group = group))
ggmap(BostonMap) + geom_polygon(data = bos_shape, aes(x = long, y = lat, group = group), 
                                alpha=0.5) # opacity

# test
#bos_shape_temp <- bos_shape[bos_shape$id==21,]
ggmap(BostonMap) + geom_polygon(aes(x=long, y=lat, group=group), 
                                fill='grey', size=.2,color='green', 
                                data=bos_shape, alpha=.3)
#View(bos_shape_0)
# make up some fake data
bos_shape$fake <- (as.numeric(as.vector(bos_shape$group))*10)%%45
ggmap(BostonMap) + geom_polygon(aes(x=long, y=lat, group=group, fill=fake), 
                                size=.2,color='green', 
                                data=bos_shape, alpha=.6)

# pop data
library(plotly)
ggmap(BostonMap) + geom_polygon(aes(x=long, y=lat, group=group, fill=SqMiles), 
                                size=.2,color='green', 
                                data=bos_shape, alpha=.6) +
  geom_text(data=name.location, aes(long, lat, label = name), size=3)
p <- ggplotly()
layout(p)

########################################################################################
##### leaflet interactive map
#Library
library(leaflet)

### change background tile
# Background 1: NASA
m=leaflet() %>% addTiles() %>% setView( lng = 2.34, lat = 48.85, zoom = 5 ) %>% addProviderTiles("NASAGIBS.ViirsEarthAtNight2012")
m

# Background 2: World Imagery
m=leaflet() %>% addTiles() %>% setView( lng = 2.34, lat = 48.85, zoom = 3 ) %>% addProviderTiles("Esri.WorldImagery")
m

### add circles and rectangles
# Create 20 markers (Random points)
data=data.frame(long=sample(seq(-150,150),20) ,  lat=sample(seq(-50,50),20) , val=round(rnorm(20),2) , name=paste("point",letters[1:20],sep="_")  ) 

# Show a circle at each position
m=leaflet(data = data) %>% addTiles() %>% 
  addCircleMarkers(~long, ~lat , popup = ~as.character(name))
m

# Show a CUSTOM circle at each position. Size defined in Pixel. Size does not change when you zoom
# (addCircleMarkers)
m=leaflet(data = data) %>% addTiles() %>%  addProviderTiles("Esri.WorldImagery") %>%
  addCircleMarkers(~long, ~lat, radius=~val*14, 
                   color=~ifelse(data$val>0 , "red", "orange"), stroke = TRUE, 
                   fillOpacity = 0.2, popup = ~as.character(name)) 
m

# Show a CUSTOM circle at each position. Size in meters --> change when you zoom.
# (addCircles)
m=leaflet(data = data) %>% addTiles()  %>%  addProviderTiles("Esri.WorldImagery") %>%
  addCircles(~long, ~lat, radius=~val*1000000, 
             color=~ifelse(data$val>0 , "red", "orange"), stroke = TRUE, 
             fillOpacity = 0.2, popup = ~as.character(name)) %>% 
  setView( lng = 166.45, lat = 21, zoom = 2)
m

# Show a rectangle
m=leaflet() %>% addTiles() %>%  
  addRectangles(
    lng1=-118.456554, lat1=34.078039,
    lng2=-118.436383, lat2=34.062717,
    fillColor = "transparent"
  )
m

### Choropleth map with leaflet (shapefile)

# First we need to to load the shape file of the world map to know the border 
# position of every country. See graph #168 to have a complete description of this step. 
# We can summarize this step with these 4 lines of code:
# Download .shp file on the web:
download.file("http://thematicmapping.org/downloads/TM_WORLD_BORDERS_SIMPL-0.3.zip" , destfile="world_shape_file.zip")
system("unzip world_shape_file.zip")
# Read the file with rgdal
#install.packages('rgeos', type="source")
#install.packages("rgdal", repos = 'http://cran.us.r-project.org', dependencies=T)
library(rgdal)
world_spdf=readOGR( dsn= getwd() , layer="TM_WORLD_BORDERS_SIMPL-0.3")

# Color by quantile
m=leaflet(world_spdf)%>% addTiles()  %>% setView( lat=10, lng=100 , zoom=2) %>%
  addPolygons( stroke = FALSE, fillOpacity = 0.5, smoothFactor = 0.5, color = ~colorQuantile("YlOrRd", POP2005)(POP2005) )
m

# Numeric palette
m=leaflet(world_spdf)%>% addTiles()  %>% setView( lat=10, lng=0 , zoom=2) %>%
  addPolygons( stroke = FALSE, fillOpacity = 0.5, smoothFactor = 0.5, color = ~colorNumeric("YlOrRd", POP2005)(POP2005) )
m

# Bin
m=leaflet(world_spdf)%>% addTiles()  %>% setView( lat=10, lng=0 , zoom=2) %>%
  addPolygons( stroke = FALSE, fillOpacity = 0.5, smoothFactor = 0.5, color = ~colorBin("YlOrRd", POP2005)(POP2005) )
m

### Add markers on leaflet map
# Show a marker at each position
m=leaflet(data = data) %>% addTiles() %>% addMarkers(~long, ~lat, popup = ~as.character(long))
m




# DRAFT
########################################################################################
########################################################################################
########
# read data
pop <- read.csv("pop.csv")
pop$neighborhood <- as.character(pop$neighborhood)
df.name$name[df.name$name %in% c("Allston","Brighton")] <- pop$neighborhood[1]
df.name$name[df.name$name %in% c("Bay Village")] <- pop$neighborhood[2]
df.name$name[df.name$name %in% c("West End")] <- pop$neighborhood[3]
df.name$name[df.name$name %in% c("South Boston","South Boston Waterfront")] <- pop$neighborhood[15]
df.name$name[df.name$name %in% c("Downtown","Chinatown","North End","Leather District")] <- pop$neighborhood[6]
df.name$name[df.name$name %in% c("Fenway","Longwood Medical Area")] <- pop$neighborhood[8]
bos_shape <- fortify(bos_shape_0) # list
########





oilgas <- read.csv("oilgascounty.csv")
View(oilgas)




###
summary(county_shape$long[county_shape$id==1])
county_shape[county_shape$long<=-90&county_shape$long>-91&county_shape$lat>35&county_shape$lat<36,]
unique(county_shape$id)
state.abb
### 



# group oilgas data by states
state_gas <- data.frame(stabr=oilgas$Stabr,gas2011=oilgas$gas2011)
state_gas <- aggregate(gas2011~stabr, state_gas, function(x){sum(as.numeric(x))})

# join county_shape & oilgas data
county_shape <- merge(x=county_shape, y=state_gas, by.x="abb", by.y="stabr")
county_shape$gas2011per <- log(county_shape$gas2011+1)/max(log(county_shape$gas2011+1))
# draw map 
ggmap(USmap) + geom_polygon(aes(x=long, y=lat, group=group,fill=gas2011per), 
                            size=.2, color='green', 
                            data=county_shape, alpha=.6)

# https://www.census.gov/geo/maps-data/data/tiger-cart-boundary.html

##########################################################################

# get state name for each point
# I found this function on stackoverflow
library(sp)
library(maps)
library(maptools)
# The single argument to this function, pointsDF, is a data.frame in which:
#   - column 1 contains the longitude in degrees (negative in the US)
#   - column 2 contains the latitude in degrees
latlong2state <- function(pointsDF) {
  # Prepare SpatialPolygons object with one SpatialPolygon
  # per state (plus DC, minus HI & AK)
  states <- map('state', fill=TRUE, col="transparent", plot=FALSE)
  IDs <- sapply(strsplit(states$names, ":"), function(x) x[1])
  states_sp <- map2SpatialPolygons(states, IDs=IDs,
                                   proj4string=CRS("+proj=longlat +datum=WGS84"))
  
  # Convert pointsDF to a SpatialPoints object 
  pointsSP <- SpatialPoints(pointsDF, 
                            proj4string=CRS("+proj=longlat +datum=WGS84"))
  
  # Use 'over' to get _indices_ of the Polygons object containing each point 
  indices <- over(pointsSP, states_sp)
  
  # Return the state names of the Polygons object containing each point
  stateNames <- sapply(states_sp@polygons, function(x) x@ID)
  stateNames[indices]
}
# Test the function using points in Wisconsin and Oregon.
testPoints <- data.frame(x = county_shape$long, y = county_shape$lat)
state_name <- latlong2state(testPoints)
county_shape$state_name <- state_name


# get abbreviations of state names
library(dplyr)
county_shape$abb <- state.abb[match(state_name,sapply(as.list(state.name),tolower))]






















install.packages("plyr")
install.packages("dplyr")
install.packages("tidyr")



##Class 25 11.2.2016 WED twitterR

install.packages("twitteR")
install.packages("devtools")
