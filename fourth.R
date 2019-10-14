#наконец провести первичный анализ количественных и качественных данных
#используй свои старые скрины, тетради и методичку Корюкина 

#провести кластерный анализ(иерархическая кластеризация, MDS)
#анализ главных компонент(РСА)

#так понимаю выделение ключевых данных
#затем алгоритм распознвания - евклидовы расстояния, бинарные классификаторы, перцептроны и проч
temp<-read.csv( "/home/aryuna/Downloads/генетика_НИИ/TZ/out3/out3_allele_to_genotype.csv")

#количественные переменные: age,bmi,n_of_im
#качественные: группа от 1 до 3 вкл-но, gender, func_class_stenocard,
#             CHF,HBP,hyperlipidemia,smoking,HF
#cперва поработаем над количественными данными

#Посмотрим на распределения по возрастам в группах 1, 2, 3
#leadership[which(leadership$gender=="M" &      leadership$age > 30),]
temp$group<- factor(temp$group,levels = c(1,2,3))
age_f <-temp$age[which(temp$group=="1")]
age_s <-temp$age[which(temp$group=="2")]
age_t <-temp$age[which(temp$group=="3")]

library(lattice)
densityplot(~ age_f, xlab = "age of group 1", ylab = "density", main = "Плотность распределения по возрасту у первой группы")
densityplot(~ age_s, xlab = "age of group 2", ylab = "density", main = "Плотность распределения по возрасту у второй группы")
densityplot(~ age_t, xlab = "age of group 3", ylab = "density", main = "Плотность распределения по возрасту у третьей группы")

#qq-plot
#library("carData", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.4")
#y <- rnorm(558) # генерация нормально распределенной совокупности с n = 558
qqnorm(age_f)
qqnorm(age_s)
qqnorm(age_t)
#qqplot(y,age_f, col=palette()[1] , pch=19,
#     xlab="Квантили нормального распределения",
  #    ylab="Наблюдаемые квантили 1st group age",
 #    main="Сравнение квантилей ЭР и НР")

#hist
hist(age_f, breaks = 20, freq = FALSE, col = "lightblue",
     xlab = "age of first group",
     ylab = "Плотность вероятности",
     main = "Гистограмма, совмещенная с кривой плотности")
lines(density(age_f), col = "red", lwd = 2)
lines(density(age_f, bw = 0.8), col = "blue", lwd = 2)

hist(age_f, breaks = 20, freq = TRUE, col = "lightblue",    xlab = "age of first group",   ylab = "Частота",    main = "Гистограмма")
hist(age_s, breaks = 20, freq = TRUE, col = "lightblue",    xlab = "age of sec group",   ylab = "Частота",    main = "Гистограмма")
hist(age_t, breaks = 20, freq = TRUE, col = "lightblue",    xlab = "age of third group",   ylab = "Частота",    main = "Гистограмма")

#summmary
sum_age_f <- summary(age_f)
sum_age_s <-summary(age_s)
sum_age_t <-summary(age_t)

boxplot(age ~ group,xlab = "group",ylab = "age",main = "evaluation of age", col = "coral", data = temp)












#bmi
attach(temp)
bmi_f <-bmi[which(group=="1")]
bmi_s <-bmi[which(group=="2")]
bmi_t <-bmi[which(group=="3")]
densityplot(~ bmi_f, xlab = "bmi of group 1", ylab = "density", main = "Плотность распределения по индексу массы тела у первой группы")
densityplot(~ bmi_s, xlab = "bmi of group 2", ylab = "density", main = "Плотность распределения по индексу массы тела у второй группы")
densityplot(~ bmi_t, xlab = "bmi of group 3", ylab = "density", main = "Плотность распределения по индексу массы тела у третьей группы")

qqnorm(bmi_f)
qqnorm(bmi_s)
qqnorm(bmi_t)

hist(bmi_f, breaks = 20, freq = TRUE, col = "lightblue",    xlab = "bmi of first group",   ylab = "Частота",    main = "Гистограмма")
hist(bmi_s, breaks = 20, freq = TRUE, col = "lightblue",    xlab = "bmi of sec group",   ylab = "Частота",    main = "Гистограмма")
hist(bmi_t, breaks = 20, freq = TRUE, col = "lightblue",    xlab = "bmi of third group",   ylab = "Частота",    main = "Гистограмма")


sum_bmi_f<-summary(bmi_f)
sum_bmi_s<-summary(bmi_s)
sum_bmi_t<-summary(bmi_t)

boxplot(bmi ~ group,xlab = "group",ylab = "age",main = "evaluation of bmi", col = "coral", data = temp)




#im
n_of_im_f<-n_of_im[which(group=="1")]
n_of_im_s<-n_of_im[which(group=="2")]
n_of_im_t<-n_of_im[which(group=="3")]
densityplot(~ n_of_im_f, xlab = "number of heart failures (im) at first group", ylab = "density", main = "Плотность распределения по количеству инфарктов миокарда у первой группы")
densityplot(~ n_of_im_s, xlab = "number of heart failures (im) at second group", ylab = "density", main = "Плотность распределения по количеству инфарктов миокарда у второй группы")




#densityplot(~ n_of_im_t, xlab = "number of heart failures (im) at third group", ylab = "density", main = "Плотность распределения по количеству инфарктов миокарда у третьей группы")


qqnorm(n_of_im_f)
qqnorm(n_of_im_s)
#qqnorm(n_of_im_t)

hist(n_of_im_f, breaks = 20, freq = TRUE, col = "lightblue",    xlab = "n_of_im of first group",   ylab = "Частота",    main = "Гистограмма")
hist(n_of_im_s, breaks = 20, freq = TRUE, col = "lightblue",    xlab = "n_of_im of sec group",   ylab = "Частота",    main = "Гистограмма")
#hist(n_of_im_t, breaks = 20, freq = TRUE, col = "lightblue",    xlab = "n_of_im of third group",   ylab = "Частота",    main = "Гистограмма")


sum_nim_f <- summary(n_of_im_f)
sum_nim_s <-summary(n_of_im_s)

boxplot(n_of_im ~ group,xlab = "group",ylab = "age",main = "evaluation of number of myocardial infarction", col = "coral", data = temp)
#сохранила это сама в out4
#проверим распределение возраста на нормальность в пятом скрипте
# первой группы 558 объектов
#у второй 52 пациентов
#у третьей 188 пациентов  т.е. выборки очень несбалансированные

# мб поискать другие выборки, что было сделано
#литературный поиск
#кто пытался делать такие классификаторы
#как сделать лучше, чем у них

