## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)


## ------------------------------------------------------------------------
library(frost)

temp <- 25
rh <- 54

calcDewPoint(rh,temp,mode="A")
calcDewPoint(rh,temp,mode="B")
calcDewPoint(rh,temp,mode="C")


## ------------------------------------------------------------------------
library(frost)

library(frost)
convert.temperature(from="K", to="C",350)
cels <- convert.temperature(from="F",to="C",c(120,80,134,110))
k <- convert.temperature(from="C", to="K",cels)


## ------------------------------------------------------------------------
library(frost)
# We create random data
x1 <- rnorm(100,mean=2,sd=5)
x2 <- rnorm(100,mean=1,sd=3)
y <- rnorm(100,mean=0,sd=2)
buildFAO(dw = x2,temp=x1,tmin=y)
# data example taken from FAO Book
t0 <- c(3.2,0.8,0.2,2.6,4.4,5.2,2.7,1.2,4.5,5.6) # temperature 2 hours after sunset
td <- c(-4.2,-8.8,-6.5,-6.2,-6.1,2.6,-0.7,-1.7,-1.2,0.1) # dew point 2 hours after sunset
tn <- c(-3.1,-5,-6.3,-5.4,-4,-2.5,-4.8,-5,-4.4,-3.3)
out <- buildFAO(dw = td,temp=t0,tmin=tn)

# We use the results of the model to have the coefficients for the formula
current_temp <- 10
current_dw <- 2
ptmin <- predFAO(out,current_temp,current_dw)
cat("The predicte minimum temperature is ",ptmin," °C")

# We plot the temperature trend, we have 12 hours until sunrise
getTrend(Tmin = ptmin ,t2 = current_temp,n = 12,plot=TRUE) # in °C degress

## ---- fig.show='hold'----------------------------------------------------
library(frost)

getTrend(Tmin = 22.2,t2 = 33.7,n = 15) # in °F degress
getTrend(Tmin = -5.45,t2 = 0.95,n = 15, plot=TRUE) # in °C degress

## ---- fig.show='hold'----------------------------------------------------
library(frost)
var <- getTrend(Tmin = -5.45,t2 = 0.95,n = 15) # in °C degress
require(ggplot2)
# just plotting points
ggplot(var,aes(x=x,y=y)) + geom_point(color="blue")
# add trend line
ggplot(var,aes(x=x,y=y)) + geom_point() + geom_smooth(color="red")

## ------------------------------------------------------------------------
# just an example
dw <- c(-2,-5,2,6,8)
tempMax <- c(10,20,30,25,29)
tmin <- c(-1,-2,3,5,10)
out <- buildMdz(dw,tempMax,tmin)
predMdz(dw = -3, tempMax = 15, out)

