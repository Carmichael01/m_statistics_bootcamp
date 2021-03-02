##################### Bar Charts s7 #####################
## display the built-in dataset called "mtcars"

mtcars

## attach is convenient way to use the build-in dataset 

attach(mtcars)

# sets the bottom, left, top and right margins of the plot region 
# in number of lines of text. 
# you can ignore this set of code if your plots are showing correctly
# par(mar=c(2,1,2,1))

##################### Bar Charts s8 #####################
count_gears <- table(gear)
barplot(count_gears, 
        names.arg = c('Three','Four','Five'),
        main= "Distribution of Gears",
        xlab= "Gears", 
        ylab= "Frequency",
        col=rainbow(length(count_gears)))

##################### Bar Charts s9 #####################
# Check the cylinder vector (variable)
mtcars$cyl
print(cyl)

# Count the frequencies for each value of cyl
# using the Frequency-Table function
counts_cyl <- table(cyl)
print(counts_cyl)

# Create the simplest basic barplot
barplot(counts_cyl)

# Add Title, axis labels and color
barplot(counts_cyl,
        names.arg = c('Four','Six','Eight'),
        main= "Simple Bar Chart",
        xlab= "Number of Cylinders", 
        ylab= "Frequency",
        col=rainbow(length(counts_cyl)))

##################### Pie Chart s10 #####################
pie(count_gears, 
    labels = c('Three','Four','Five'),
    main= "Distribution of Gears",
    col=rainbow(length(count_gears)))

##################### Pie Chart s11 #####################

## count frequency for each value of cyl
counts_cyl <- table(cyl)
counts_cyl

# Plot the pie chart
pie(counts_cyl, 
    labels = c('4-cyl','6-cyl','8-cyl'), 
    main='Cylinders Distribution',
    col = rainbow(length(counts_cyl)))

##################### Line Charts s13 ####################

## A line plot is actually a scatter plot 
## with line passing through the points. 
## The function used is the same - plot() but with type='l'

## using another built-in dataset "pressure" as it has time-series

plot(x = pressure$temperature, y = pressure$pressure,
     xlab = "Temperature (Celsius)",
     ylab = "Pressure",
     main = "Vapor Pressure of Mercury", type = "l")

# if you remove "type = "l", you will get only the scatter plot.

# add points
points(x = pressure$temperature, y = pressure$pressure,
       col = 'red')

##################### Histogram s15 #####################

## plot simple histogram
hist(mpg)

## histogram with Title, labels, bins
hist(mpg, 
     breaks=12,
     xlab="Miles Per Gallon",
     main="Histogram with 12 Bins")

hist(mpg, 
     breaks= c(0,5,10,15,20,25,30,35),
     xlab="Miles Per Gallon",
     main="Histogram with 12 Bins")

##################### Scatter Plots s17 #####################

## a very basic scatter plot of MPG vs. Weight
plot(wt, mpg,
     main="Basic Scatter Plot of MPG vs. Weight",
     xlab="Car Weight (lbs/1000)",
     ylab="Miles Per Gallon")

## Add labels, color dots, regression line
plot(wt, mpg,
     main="Scatter Plot of MPG vs. Weight", # title
     xlab="Car Weight (lbs/1000)",          # x axis label
     ylab="Miles Per Gallon",               # y axis label
     font.lab=2,                            # 2=bold, 3=italics
     pch=16,                                # change point symbol
     col="blue")                            # set point colour

## add a line to fit the data
abline(lm(mpg~wt),                          # add a regression line
       col="red",                           # set line colour
       lty=3,                               # set line type
       lwd=2)                               # set line width

##################### Box Plots s19 #####################

## A very simple boxplot
boxplot(mpg, main = "Boxplot of Miles/Gallon")

## use boxplots for comparison
boxplot(mpg~cyl, main = "Miles/Gallon by Cylinders")
# engine: v=0, straight=1
boxplot(mpg~vs, main = "Miles/Gallon by Engine Types")
boxplot(mpg~gear, main = "Miles/Gallon by Gear")


############## Some practice Exercises ################
# (1) Run the code below. 
#     Add labels & titles to make the chart readable

counts = table(mtcars$vs, mtcars$gear)
barplot(counts, col=c("darkblue","red"),legend = rownames(counts)) 

# (2) create a table with row=vs and col=gear 
counts <- table(mtcars$vs, mtcars$gear)
# now plot this as bar chart. 
# what kind of plot has been produced?

# (3) run the code below. It looks familiar - What does it show?
#     Add labels and title to make it readable
counts = table(mtcars$vs, mtcars$gear)
barplot(counts,col=c("darkblue","red"), 
          legend = rownames(counts), beside=TRUE) 

# (4) Plot 4 Charts to show if there are relationships between 
#     pickup speed and mpg, hp, wt and disp
#     What is your conclusion?

# for example, one of the plot can be...
plot(qsec, mpg,
     xlab="qsec", ylab="MPG")
abline(lm(mpg ~ qsec, data = mtcars), col = "blue")

# conculsion: positive relationship. The > Mpg, the slower pickup

