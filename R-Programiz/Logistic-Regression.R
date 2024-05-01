library(MASS)
library(caret)
data(biopsy)
set.seed(41)
split = createDataPartition(biopsy$class, p=0.7,list = FALSE, times = 1)
train = biopsy[split,]
test = biopsy[-split,]
model = glm(class ~ V1 + V2, data = train, family = 'binomial')
test$predicted = predict(model, newdata = test, type='response')
predicted_labels = ifelse(test$predicted > 0.5, 'malignant','benign')
predicted_labels = factor(predicted_labels, levels = c('benign','malignant'))
cm = confusionMatrix(test$class, predicted_labels)$table
print('Confusion Matrix: ')
print(cm)