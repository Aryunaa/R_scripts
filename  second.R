
#взять данные из файла out1
#прикрутить дополнительные столбикi
#сделать соединение данных
#После загрузки данных в R исправить обозначения
#генотипов (функция «alleleToGenotype» в скрипте «my_functions.R»).
#наконец провести первичный анализ количественных и качественных данных
#используй свои старые скрины, тетради и методичку Корюкина 

#провести кластерный анализ(иерархическая кластеризация, MDS)
#анализ главных компонент(РСА)

#так понимаю выделение ключевых данных
#затем алгоритм распознвания - евклидовы расстояния, бинарные классификаторы, перцептроны и проч

new_im<-read.csv(new_im, "/home/aryuna/Downloads/генетика_НИИ/TZ/out1/new_im.csv")
new_imst<-read.csv(new_imst, "/home/aryuna/Downloads/генетика_НИИ/TZ/out1/new_imst.csv")
new_noim<-read.csv(new_noim, "/home/aryuna/Downloads/генетика_НИИ/TZ/out1/new_noim.csv")
#группа исследования c инфарктом миокарда и без ст - 1
#группа с удлинением ст и инфарктом -2
#группа без инфаркта -3
a <- rep(1, 558)
dim(a) <- c(558,1)
class(a)
first_group = cbind(a,new_im)


b<-rep(2,54)
dim(b) <-c(54,1)
second_group = cbind(b,new_imst)

c<-rep(3,188)
dim(c) <- c(188,1)
third_group = cbind(c,new_noim)

#перезапишу их в файл data2

write.csv(first_group, "/home/aryuna/Downloads/генетика_НИИ/TZ/out2/first_group.csv")
write.csv(second_group,"/home/aryuna/Downloads/генетика_НИИ/TZ/out2/second_group.csv")
write.csv(third_group, "/home/aryuna/Downloads/генетика_НИИ/TZ/out2/third_group.csv")

#в первой группе пациенты с инфарктом, во второй - с инфарктом и удлинением ст, в третьей -без им