# Before using ggplot, you need to install the library
install.packages('ggplot2') 

# to use the library..
library(ggplot2)

attach(mtcars)  # convenient way to refer to the fields
                # eg. "mpg" instead of "mtcars$mpg"

##################### Bar Chart s24 ###################### 
ggplot(mtcars, aes(x = mpg, fill = factor(cyl))) +
	geom_histogram(binwidth = 5, col = "black") +
	ggtitle("Histogram of MPG by Cylinders ") +
  labs(fill="Cylinders") +
	theme(legend.position="top")

##################### Bar Chart s25 ###################### 
# Scatterplot with confidence intervals
fcyl= factor(cyl, labels = c("Four", "Six", "Eight"))
ggplot(mtcars, aes(wt, mpg)) + 
	geom_point(aes(color=fcyl), size=4, alpha=0.5) + 
	geom_smooth(size = 1, linetype = 1, se = FALSE) + 
	theme_bw(base_family = "Times") + 
	labs(x = "Car Gross Weight (1000'lbs)", 
               y = "Highway (miles/gallon)", 
               title = "Fuel Consumption for 32 Automobiles (1973-1974 models)", 
               subtitle = "Statistics Bootcamp Course", 
               color = "No. Cylinders")

# add method='lm' into geom_smooth
# try: theme_linedraw, theme_dark, theme_light, theme_classic

##################### Bar Chart s26 ###################### 
# Faceting example
ggplot(mtcars, aes(x=wt, y=mpg)) + 
	geom_point(aes(color=factor(am))) + 
	theme_bw(base_family = "Times") + 
	labs(x = "Highway (miles/gallon)", 
          y = "Car Gross Weight (1000'lbs)", 
          title = "Fuel Consumption for 32 Automobiles (1973-1974 models)", 
          subtitle = "Statistics Bootcamp", 
          color = "0=Auto, 1=Manual") + 
	facet_grid(cyl ~ gear, margins = TRUE)

# try changing margins = FALSE

# A very Simple version
ggplot( mtcars , aes(x=mpg, y=wt )) + 
  geom_point() +
  facet_grid( cyl ~ gear)

#### TITANIC VISUALISATION ####

##################### Data Preparation s30 ######################
t = read.csv('titanic3.csv', stringsAsFactors=FALSE)

# factorizing the categorical variables
t$pclass = factor(t$pclass)
t$survived = factor(t$survived)
t$gender = factor(t$sex)

##################### Bar Chart s31 ######################

# Create bar chart using R graphics
barplot(table(t$pclass), col= rainbow(3),
        xlab= 'Passenger Class',
        ylab= 'Count',
        main= 'Passenger Distribution by Pclass')

# Create bar chart using ggplot2
ggplot(t, aes(x=pclass)) + 
	geom_bar( fill=rainbow(3)) +
	labs(x = "Passenger Class)", 
	     y = "Count", 
	  title = "Passenger Distribution by Pclass")

##################### Bar Chart s32 ######################
ggplot(t, aes(x=pclass, fill=gender)) + 
  geom_bar() +
  theme_bw() + 
  theme(legend.position="top") +
  labs(x = "Passenger Class)", 
       y = "Count", 
       title = "Passenger Distribution by Pclass & Gender")

ggplot(t, aes(x=gender, fill=survived))+
  geom_bar() +
  theme(legend.position="top") +
  labs(x = "Passenger Class)", 
       y = "Count", 
       title = "Passenger Distribution by Pclass & Gender") +
  facet_grid(~pclass) 


##################### Box Plot s33 ######################
# Create box plot using R graphics
boxplot(t$age ~ t$gender, col='yellow',
        ylab='AGE', 
        xlab='GENDER',
        main='Age Distribution by Gender')

# Create box plot using ggplot2
ggplot(t, aes(gender, age, fill=gender)) +
  geom_boxplot(outlier.color='red',
               outlier.shape = 4, 
               outlier.size=4)+
  labs(title='Age Distribution by Gender')

##################### Histogram s34 ######################

ggplot(t, aes(x=age, fill=survived))+
  geom_histogram() +
  theme(legend.position="top") +
  geom_vline(xintercept = 12,size=0.5,color='darkblue') +
  labs(title='Passengers Survival [cut:12yrs]')+
  facet_grid(~gender) 

ggplot(t, aes(x=age, fill=survived))+
  geom_histogram(bins=30) +
  scale_x_continuous(limits = c(0, 18)) +
  theme(legend.position="top") +
  geom_vline(xintercept = 12,size=0.5,color='darkblue') +
  labs(title='Childrens Survival [cut:12yrs]')+
  facet_grid(~gender) 

##################### Who Survived s35 ######################

# Create stacked barplot using ggplot2
ggplot(t, aes(x=gender, fill=survived)) + 
	geom_bar()

# Create stacked barplot using ggplot2
ggplot(t, aes(x=pclass, fill=survived)) + 
	geom_bar()

############### Exercises ###############
# "Women and children first" (or to a lesser extent, the Birkenhead Drill) 
# is a code of conduct dating from 1852, whereby the lives of women and children 
# were to be saved first in a life-threatening situation, typically abandoning ship, 
# when survival resources such as lifeboats were limited." (ref: Wikipedia)

# Using only charts, can you find evidence that this was the order of the day on 15th April 1912?
  

