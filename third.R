#сделать соединение данных
#После загрузки данных в R исправить обозначения
#генотипов (функция «alleleToGenotype» в скрипте «my_functions.R»).
#наконец провести первичный анализ количественных и качественных данных
#используй свои старые скрины, тетради и методичку Корюкина 

#провести кластерный анализ(иерархическая кластеризация, MDS)
#анализ главных компонент(РСА)

#так понимаю выделение ключевых данных
#затем алгоритм распознвания - евклидовы расстояния, бинарные классификаторы, перцептроны и проч





first <-read.csv( "/home/aryuna/Downloads/генетика_НИИ/TZ/out2/first_group.csv")
second <- read.csv("/home/aryuna/Downloads/генетика_НИИ/TZ/out2/second_group.csv")
third <-read.csv( "/home/aryuna/Downloads/генетика_НИИ/TZ/out2/third_group.csv")
first<-first[,-1]
second<-second[,-1]
third<-third[,-1]

my_data<-rbind(first,second,third)

#скопировала из функции строчки
myList = as.list(my_data)
temp = lapply(myList, function (x) gsub("^A$", "AA", x))
temp = lapply(temp, function (x) gsub("^C$", "CC", x))
temp = lapply(temp, function (x) gsub("^G$", "GG", x))
temp = lapply(temp, function (x) gsub("^T$", "TT", x))
temp = lapply(temp, function (x) gsub(TRUE, "TT", x))
temp = lapply(temp, function (x) gsub("NA", NA, x))

#cохраняю в файл итоговый
write.csv(temp, "/home/aryuna/Downloads/генетика_НИИ/TZ/out3/out3_allele_to_genotype.csv")
#осталось сделать первичный анализ качественных и количественных данных в четвертом скрипте
#source("path") юзать в следующий раз