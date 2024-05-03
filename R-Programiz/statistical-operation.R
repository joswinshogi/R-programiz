library(stats)
set.seed(123)
data <- data.frame(
  group = factor(c(rep('A',10),rep('B',10))),
  value = rnorm(20,mean = c(5,7),sd = 2)
)
print(t.test(value ~ group, data=data))
print(anova(lm(value ~ group, data=data)))
print(wilcox.test(value ~ group, data=data, paired = TRUE))
print(kruskal.test(value ~ group, data=data))
print(fligner.test(value ~ group, data=data))
print(ansari.test(data$value[data$group == 'A'],data$value[data$group == 'B']))
print(prop.test(sum(data$value > 6),length(data$value)))
print(binom.test(sun(data$value > 6),length(data$value),p = 0.5))
