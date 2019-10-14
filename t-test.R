##################################################################################################################
#Тест для двух независимых выборок. Алгоритм
library(ggplot2)

?iris
df  <- iris

str(df)
#из двух видов 
df1  <- subset(df, Species != "setosa")
str(df1)
table(df1$Species)
#длина чашелистика
hist(df1$Sepal.Length)

#для нескольких aes - данные
ggplot(df1, aes(x =Sepal.Length ))+
  geom_histogram(fill = "white", col = "black", binwidth = 0.4)+
  facet_grid(Species ~ .)

#плотность обоих групп
ggplot(df1, aes(Sepal.Length, fill = Species ))+
  geom_density(alpha = 0.5)

#boxplot на выбросы
ggplot(df1, aes(Species, Sepal.Length))+
  geom_boxplot()

#проверка на нормальнось
shapiro.test(df1$Sepal.Length) #норм для всей перем
#From the output, the p-value > 0.05 implying that the 
#distribution of the data are not significantly different from normal distribution. 
#In other words, we can assume the normality.
shapiro.test(df1$Sepal.Length[df1$Species == "versicolor"])
shapiro.test(df1$Sepal.Length[df1$Species == "virginica"])

#The same result in one line
by(df1$Sepal.Length, INDICES = df1$Species, shapiro.test)

str(df1$Sepal.Length[df1$Species=="versicolor"]) #50
str(df1$Sepal.Length[df1$Species=="virginica"])  #50


#dispersion - проверка однородности дисперсий для двух выборок с одним объемом
var.test(Sepal.Length ~ Species,df1)
#Как видим, полученное p-значение значительно превышает 5%-ный уровень
#значимости, на основании чего мы не можем отклонить нулевую гипотезу о равенстве
#дисперсий в исследованных совокупностях. Истинное отношение сравниваемых
#дисперсий с вероятностью 95% находится в интервале от 0.37 до 1.16 (см. 95 percent
#                                                                     confidence interval).

#dispersion для групп с разным объемом выборок
bartlett.test(Sepal.Length  ~ Species, df1)


t.test(Sepal.Length  ~ Species, df1) #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
test1  <- t.test(Sepal.Length  ~ Species, df1)
#позволяет отклонить нулевую гипотезу о равенстве средних двух независимых групп,пи значение меньше 0.05
str(test1)
test1$p.value

#var.equal=T - дисперсии гомогенны
t.test(Sepal.Length  ~ Species, df1, var.equal = T)

##################################################################################################################
#t-test для одновыборочной переменной 
mean <- mean(df1$Sepal.Length)
mean #=6.3 #нулевая гипотеза - средняя генеральной совокупности = 8
t.test(df1$Sepal.Length, mu = 8)


##################################################################################################################
#между длиной лепестка и шириной лепестка, зависимые выборки , paired = T
t.test(df1$Petal.Length, df1$Petal.Width, paired = T)
##################################################################################################################
#средние значения и границы доверительных интервалов
#ggplot(data,aes(factor,x)+stat_summary(fun,data = mean_doverit_interval))
#geom - как рисовать
ggplot(df1, aes(Species, Sepal.Length))+
  stat_summary(fun.data = mean_cl_normal, geom = "errorbar", 
               width = 0.1) +
  stat_summary(fun.y = mean, geom = "point", size = 4)

ggplot(df1, aes(Species, Sepal.Length))+
  stat_summary(fun.data = mean_cl_normal, geom = "pointrange", 
               size = 2)

#####################################################################################################
#непараметрический аналог параметра стьюдента - манна-уитни 
?wilcox.test

test2  <- wilcox.test(Petal.Length ~ Species, df1)

pv  <- test2$p.value

ggplot(df1, aes(Species, Petal.Length))+
  geom_boxplot()


wilcox.test(df1$Petal.Length, df1$Petal.Width, paired = T)

paired_wtest  <- wilcox.test(df1$Petal.Length, df1$Petal.Width, paired = T)

paired_wtest$p.value

