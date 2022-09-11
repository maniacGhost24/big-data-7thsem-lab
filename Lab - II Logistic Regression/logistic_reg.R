#Loading library
library(dplyr)
library(caTools)
library(ROCR)

summary(mtcars)

#Splitting dataset.
split <- sample.split(mtcars, SplitRatio=0.8)
split

train_reg <- subset(mtcars, split=="TRUE")
test_reg <- subset(mtcars,split=="FALSE")

#Training model.
logistic_model <- glm(vs ~ wt + disp, data=train_reg, family="binomial")
logistic_model

#Summary
summary(logistic_model)

#Predict test data
predict_reg <- predict(logistic_model, test_reg, type="response")
predict_reg



#Changing probabilities.
predict_reg <- ifelse(predict_reg>0.5,1,0)

#Evaluating model accuracy, using confusion matrix.
table(test_reg$vs, predict_reg)

missing_classer <- mean(predict_reg!=test_reg$vs)
print(paste('Accuracy=',1-missing_classer))

#print(paste("Mean",mean(df['disp'])))