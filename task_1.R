# Prediction using Supervised ML
# Predict the percentage marks of an student based on the no. of study hours. 

#installing csv loader package
install.packages("xlsx")
library(xlsx)

#loading data
stud_Data <- read.csv(file= "https://raw.githubusercontent.com/AdiPersonalWorks/Random/master/student_scores%20-%20student_scores.csv")


View(stud_Data)

#to check structure of our data set
str(stud_Data)

summary(stud_Data)

#creating linear regression model using lm() function
lrmodel <- lm(formula = Scores ~ Hours, data = stud_Data)
lrmodel

summary(lrmodel)

#showing corelation b/w variables
cor(stud_Data$Scores, stud_Data$Hours)

#we need to find the marks obtained by student if he/she studies for 9.25 hours
test_data <- data.frame(Hours = c(9.25))

#predicting on the basis of test data
pred <- predict(lrmodel, newdata = test_data, interval = "confidence")
pred

#visualizing our model graphically
plot(stud_Data, main='Scores Vs Hours', col='red')
abline(lrmodel, lwd=3, col='green')
