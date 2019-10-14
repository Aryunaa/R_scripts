#здесь происходит преобразование информации в удобоваримый для анализа вид



im <- read.csv('/home/aryuna/Downloads/генетика_НИИ/TZ/data2/im.csv')
imst <- read.csv('/home/aryuna/Downloads/генетика_НИИ/TZ/data2/imst.csv')
noim <- read.csv('/home/aryuna/Downloads/генетика_НИИ/TZ/data2/noim.csv')

str(im)

new_im <- im[,-7]
str(new_im)
new_im <- new_im[,-4]
new_im <- new_im[,-8]
new_im <- new_im[,-9]
str(new_im)

new_imst <- imst[,-12]
str(new_imst)

new_noim <- noim[,-4]
new_noim <- new_noim[,-6]
new_noim <- new_noim[,-8]
new_noim <- new_noim[,-9]

str(new_im)
str(new_imst)
str(new_noim)

new_im <- new_im[,-1]
new_imst <- new_imst[,-1]
new_noim <-new_noim[,-1]




new_imst$CHF <- factor(new_imst$CHF,levels = c(0,1))
new_imst$CHF

new_imst <-new_imst[c(2, 1, 3, 5, 4, 6, 9, 10, 8, 7,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68)]

View(new_imst)
View(new_im)
View(new_noim)

new_im$gender<-factor(new_im$gender,levels =c(1,2))
new_imst$gender<-factor(new_imst$gender,levels =c(1,2))
new_noim$gender<-factor(new_noim$gender,levels =c(1,2))

new_im$func_class_stenocard<-factor(new_im$func_class_stenocard,levels=c(0,1,2,3,4))
new_imst$func_class_stenocard<-factor(new_imst$func_class_stenocard,levels=c(0,1,2,3,4))
new_noim$func_class_stenocard<-factor(new_noim$func_class_stenocard,levels=c(0,1,2,3,4))

new_im$CHF<-factor(new_im$CHF,levels=c(0,1))
new_noim$CHF<-factor(new_noim$CHF,levels=c(0,1))

new_im$HBP<-factor(new_im$HBP,levels=c(1,2))
new_imst$HBP<-factor(new_imst$HBP,levels=c(1,2))
new_noim$HBP<-factor(new_noim$HBP,levels = c(1,2))

new_im$hyperlipidemia<-factor(new_im$hyperlipidemia,levels = c(1,2))
new_imst$hyperlipidemia<-factor(new_imst$hyperlipidemia,levels = c(1,2))
new_noim$hyperlipidemia<-factor(new_noim$hyperlipidemia,levels = c(1,2))

new_im$smoking<-factor(new_im$smoking,levels = c(1,2))
new_imst$smoking<-factor(new_imst$smoking,levels = c(1,2))
new_noim$smoking<-factor(new_noim$smoking,levels = c(1,2))

new_im$HF<-factor(new_im$HF,levels = c(1,2))
new_imst$HF<-factor(new_imst$HF,levels = c(1,2))
new_noim$HF<-factor(new_noim$HF,levels = c(1,2))


write.csv(new_im, "/home/aryuna/Downloads/генетика_НИИ/TZ/out1/new_im.csv")
write.csv(new_imst, "/home/aryuna/Downloads/генетика_НИИ/TZ/out1/new_imst.csv")
write.csv(new_noim, "/home/aryuna/Downloads/генетика_НИИ/TZ/out1/new_noim.csv")



