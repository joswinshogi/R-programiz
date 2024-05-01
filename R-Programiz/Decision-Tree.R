library(MASS)
library(caret)
library(rpart)
library(rpart.plot)
data(biopsy)
set.seed(29)
split = createDataPartition(biopsy$class, p=0.7, list = FALSE, times = 1)
train = biopsy[split, ]
test = biopsy[-split, ]
model = rpart(class~V1+V3+V5+V6, data = train, method = 'class')
rpart.plot(model)
prediction = predict(model,test,type = 'class')
accuracy = mean(prediction == test$class)
cat('Accuracy:',accuracy,'\n')
cm = confusionMatrix(test$class,prediction)$table
print('Confusion Matrix:')
print(cm)