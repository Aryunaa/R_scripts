#скрипт на проверку гипотез о нормальности распределения
#возьмемся за возраст и индекс массы тела. 
install.packages("nortest")
library(nortest)

#age  ненормально - > НПК!
age_f_nortest<-shapiro.test(age_f)
age_f_nortest
#data:  age_f   , W = 0.99292, p-value = 0.01259  P < 0.05 - нулевая гипотеза отвергается, распределение ненормальное

age_s_nortest<-shapiro.test(age_s)
age_s_nortest
#data:  age_s   W = 0.94979, p-value = 0.02436 . распределение ненормально


age_t_nortest<-shapiro.test(age_t)
age_t_nortest
#data:  age_t W = 0.98486, p-value = 0.04047 ненормально




#bmi - индекс массы тела, в первых двух группах норм, в другой ненорм

bmi_f_nortest<-shapiro.test(bmi_f)
bmi_f_nortest
#data:  bmi_f W = 0.88179, p-value < 2.2e-16 norm

bmi_s_nortest<-shapiro.test(bmi_s)
bmi_s_nortest
#data:  bmi_s W = 0.9229, p-value = 0.001927 norm

bmi_t_nortest<-shapiro.test(bmi_t)
bmi_t_nortest
#data:  bmi_t W = 0.98929, p-value = 0.1819 ненорм




#n_of_im_f количество инфарктов миокарда наверное даже и не нужен тест???????????????????
n_of_im_f_nortest<- shapiro.test(n_of_im_f)
n_of_im_f_nortest
#data:  n_of_im_f   W = 0.45889, p-value < 2.2e-16 наверное глупо было делать такую проверку тут

n_of_im_s_nortest<-shapiro.test(n_of_im_s)
n_of_im_s_nortest
# data:  n_of_im_s W = 0.24263, p-value = 3.501e-15




#оценка асииметрии и эксцесса в данных
#Асимметрия skewness(data)b
#Эксцесс kurtosis(data_ol)
install.packages("PerformanceAnalytics")
library(devtools)
install_github("cran/PerformanceAnalytics")
library(PerformanceAnalytics)
#library(PerformanceAnalytics)
#Error in library(PerformanceAnalytics) : 
 # ‘PerformanceAnalytics’ is not a valid installed package


#violin plot use

#lapply(aifh,asioijpf,function(x) {return})
#apply(temp[,2:ncol(temp)], 2, function(x) return(foo(x)))

#rtsne 
#psych
#Rtools   #