#RStudio
#Day 2: Quick Assesment

#Question #1: Determining Sample Size
#Refer to slide#31 on finding the sample size n for the mean.
#Code the formula given in the slide, and find the answer required

#sd = $25
#z = 99% [2.58] | 95% [1.96]
#E = +/-$5

sample_size1 <- ((2.58*25)/5) ** 2
sample_size1 #at 167 least homes would need to be selected to sample @ 99% CI

sample_size2 <- ((1.96*25)/5) ** 2
sample_size2 #at least 97 homes would need to selected in the sample @ 95% CI

#samples sizes rounded up as per readings

#Question #2
#A company produces stools with a nominal load strength of 40 kg. 
#Some manufacturing adjustments were made and nine samples were produced. 
#Their measured strengths are:
#   
#   39.6   40.2   40.9   40.9   41.4   39.8   39.4   41.8   43.6
# 
# Construct the following three Confidence Intervals:
# 95%, 99% and 90%
# What do you observe?
# Have these adjustments resulted in an increase in strength? 
# n=9
# df=9-1 (t.test already takes care of degree's of freedom)

#step 1 - Create the vector of the samples
sample_stools <- c(39.6, 40.2, 40.9, 40.9, 41.4, 39.8, 39.4, 41.8, 43.6)
sample_stools

#step 2 - calculate the mean = 40.84444
mean(sample_stools)

#step 3 - calculate the confidence intervals

ci_90 <- t.test ( sample_stools, conf.level = 0.90 )
ci_95 <- t.test ( sample_stools, conf.level = 0.95 )
ci_99 <- t.test ( sample_stools, conf.level = 0.99 )

ci_90 #@90% CI: 40.02557 41.66332 : mean = 40.84kg +-0.82kg
ci_95 #@95% CI: 39.82897 41.85992 : mean = 40.84kg +-1.02kg 
ci_99 #@99% CI: 39.36686 42.32203 : mean = 40.84kg +-2.96kg

#We can be fairly certain that the adjustments increased the nominal strength of
#the the stools.  The sample mean is higher and even at the widest CI @99% the
#lower limit is pretty close to the previouse value.  


#Question #3
#A freelance delivery man wants to offer delivery services to warehouses 
#in Malaysia. Being new to this business, he estimates that it should take 
#5.5hrs per trip. He managed to get some work and starts his business. 
#He carefully recorded the delivery times. 
#After one week, he recorded the following hours taken per trip:
#   
#   5.5	7	6.4	4.5	3.9	7.1	5.6	5.8	7.8	4.6	4.5	5.5
# 
# Find out if his estimate of 5.5hrs/trip is reasonable. 
# Assuming a 95 percent confidence level, was this estimation accurate?

#step 1 - create vector
sample_delivery <- c(5.5, 7, 6.4, 4.5, 3.9, 7.1, 5.6, 5.8, 7.8, 4.6, 4.5, 5.5)
sample_delivery

#step 2 - calculate the mean
mean(sample_delivery) 

#The average time takes 5.68.  
#Given that the original values have been recorded in decimals and not hours:mins,
#it has been decided to leave the result in the same format.  

#step 3 - calculate the CI
del_ci_95 <- t.test ( sample_delivery, conf.level = 0.95 )

del_ci_95 #95% CI : 4.917608 6.449059 : mean = 5.68 Hours +-0.77 Hours (approx 45 min)

#Given a 95% confiidence level, the estmated time falls with in the Confidence 
#Interval.  The driver can feel pretty happy with himself
