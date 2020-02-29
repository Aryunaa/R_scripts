library(ggplot2)
library(fitdistrplus)
library(corrplot)

#DATA LOADING ##########################################################################################################################
{
metadata_marker <- read.delim("/home/ariuna/Downloads/metabolom/metadata_marker", sep = "\t", row.names = 1, header = T, na.strings = c("NA", ""))
noesy_clinic <- read.delim("/home/ariuna/Downloads/metabolom/noesy_clinic.txt", sep = "\t", row.names = 1, header = T, na.strings = c("NA", ""))
#Sparrows <- read.table(file = "~/ariuna/r_study/r-tutorials-master/Edition_2014/Data/SparrowsElphick.txt", header = TRUE)
#metadata_marker <- read.delim("/home/metserver/ariuna/r_study/metabolom/metadata_marker", sep = "\t", row.names = 1, header = T, na.strings = c("NA", ""))
#noesy_clinic <- read.delim("/home/metserver/ariuna/r_study//metabolom/noesy_clinic.txt", sep = "\t", row.names = 1, header = T, na.strings = c("NA", ""))


for (i in 1:nrow(metadata_marker)){
  if (metadata_marker[i,1]=="factor")
  {noesy_clinic[[rownames(metadata_marker)[i]]] <- as.factor(noesy_clinic[[rownames(metadata_marker)[i]]])} else
    if (metadata_marker[i,1]=="ordered")
    {noesy_clinic[[rownames(metadata_marker)[i]]] <- ordered(noesy_clinic[[rownames(metadata_marker)[i]]])} else
    {noesy_clinic[[rownames(metadata_marker)[i]]] <- as.numeric(as.character(noesy_clinic[[rownames(metadata_marker)[i]]]))}
}

noesy_clinic$Intensity <- factor(noesy_clinic$Intensity, levels(noesy_clinic$Intensity)[c(4,2,3,1)])
}
#END_OF_DATA_LOADING ###################################################################################################################



#PCA!FOR OUTLIERS IN NMR-data ###########################################################################################################
{
metab.pca <- prcomp(noesy_clinic[,27:ncol(noesy_clinic)], center = TRUE,scale. = TRUE)
summary(metab.pca)
pc_1to6_noesy <- as.data.frame(metab.pca$x[,1:6])


#sex and metabolites
ggplot(data = pc_1to6_noesy, aes(x = PC1, y = PC2, color = noesy_clinic$Sex))+
  geom_label(aes(label = rownames(pc_1to6_noesy)))
#86101, 94503,82802 - outlier
ggplot(data = pc_1to6_noesy, aes(x = PC3, y = PC4, color = noesy_clinic$Sex))+
  geom_point()
ggplot(data = pc_1to6_noesy, aes(x = PC3, y = PC4, color = noesy_clinic$Sex))+
  geom_label(aes(label = rownames(pc_1to6_noesy)))
#95501,81701,94503,94601,11301, 97401 - outlier

#noesy_clinic[0:3,7:26]
}
#SEARCHING FOR OUTLIERS IN NON_NMR-data ###################################################
{
nometab.pca <- prcomp(na.omit(noesy_clinic[,8:26]), center = TRUE, scale. = TRUE)
summary(nometab.pca)

#K is clinical data without metabolom and NAs
sum(is.na(noesy_clinic[,0:26]))
k<-na.omit(noesy_clinic[,0:26])
sum(is.na(k))

no_pc_1to6_noesy <- as.data.frame(nometab.pca$x[,1:6])
ggplot(data = no_pc_1to6_noesy, aes(x = PC1, y = PC2, color = k$Sex))+
  geom_label(aes(label = rownames(no_pc_1to6_noesy)))
ggplot(data = no_pc_1to6_noesy, aes(x = PC1, y = PC2, color = k$DrinkingAlcohol))+
  geom_label(aes(label = rownames(no_pc_1to6_noesy)))
ggplot(data = no_pc_1to6_noesy, aes(x = PC1, y = PC2, color = k$Age))+
  geom_label(aes(label = rownames(no_pc_1to6_noesy)))
ggplot(data = no_pc_1to6_noesy, aes(x = PC1, y = PC2, color = k$BodyMassIndexPhEx))+
  geom_label(aes(label = rownames(no_pc_1to6_noesy)))
#
}#END_OF_PCA 

#BASIC STATISTICS FOR CLINICAL DATA AND LABOLATORY MEASURES#############################################################################
{

  #Opi_status_micro - sex ,figure
  #Хи-квадрат для факторных данных ##########################################################
  {
sum(is.na(noesy_clinic))
factor_vab <- k[,0:7]
factor_vab[0:3,]

    {
      my_chisq.test <- function(x)
        {
  value = matrix(nrow = ncol(x),ncol = ncol(x))
  for(i in 1:ncol(x))
  {
    for (j in 1:ncol(x))
    {
      tbl <- table(x[,i],x[,j])
      tst <- chisq.test(tbl)
      value[i,j] <- tst$p.value
    }
  }
  return(value)
  
}

      my_chisq_ch.test <- function(x)
        {
  value = matrix(nrow = ncol(x),ncol = ncol(x))
  for(i in 1:ncol(x))
  {
    for (j in 1:ncol(x))
    {
      tbl <- table(x[,i],x[,j])
      tst <- chisq.test(tbl)
      value[i,j] <- tst$statistic
    }
  }
  return(value)
  
}
    }
#Error: C stack usage  7973764 is too close to the limit  |
#ulimit -s                                                |
#R --slave -e 'Cstack_info()["size"]'                     |
#ulimit -s 16384 # enlarge stack limit to 16 megs         |
#R --slave -e 'Cstack_info()["size"]'                     |

factor_vab[0:3,]
chisq_all_p <- my_chisq.test(factor_vab)
chisq_all <- my_chisq_ch.test(factor_vab)
chisq_all_p
chisq_all
# [Opi_status_micro Opi_status_elisa    Sex DrinkingAlcohol IncreasedEchogenicityUS PeriductalFibrosisIntrahepaticBileDuctsUS Intensity]
#SEX does not differ, group has gomogenecity
#drinking alcohol p= 5.726765e-03 , Chi = 7.634330e+00 ; for elisa-alcogol 4.836466e-03 , 7.939595 
#Drinking alcohol may be cofounder


#IncreasedEchogenicityUS- Opi_status_elisa is better; 9.593752 , 1.952406e-03 
#микро - элиса не дотягивает. ИФА и узи лучше чем мазок и узи
#опистатус - алко, эхо, фиброз, интенсивность



#Вывод : Алкоголь кофаундер, надо посмотреть прицельно
ggplot(data = no_pc_1to6_noesy, aes(x = PC1, y = PC2, color = k$DrinkingAlcohol))+
  geom_label(aes(label = rownames(no_pc_1to6_noesy)))
drink_tab <-table(k[,2],k[,4])
drink_tab
#При обсчете численных данных обязательно сравнить по полу, алкоголю

#ordered№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№
#Фиброз отличается по опистатусу, полу, повышенной эхогенности, интенсивности инвазии
#интенсивность инвазии отличается по алкоголю

#При обсчете численных клинических данных осторожнее к алкоголю 

  }#конец факторным
  #Численные ################################################################################
  {
    #Численные, разнящиеся по шкале наименований (пол, алкоголь и др)
    {
      k_case <- k[k$Opi_status_micro=="1",]
      k_case <- k_case[,8:26]
      k_control <- k[k$Opi_status_micro=="0",]
      k_control <- k_control[,8:26]
      shap_case <- array(1:19)
      shap_control <- array(1:19)
      b <- array(1:19)
      
      """
      for(j in 1:19)
        {  
        writeLines(names(k_case)[j])
        print(ks.test(k_case[,j], k_control[,j]))  
        }
      """
      stat_k <- data.frame(Trait=character(19), kriteria_value=numeric(19), p=numeric(19), criteria = character(19),stringsAsFactors=F)
      for(j in 1:19)
        {  
        shap_case[j] <- shapiro.test(k_case[,j])$p.value
        print(shap_case[j])
        if(j != 3) #там одни нули
        {shap_control[j] <- shapiro.test(k_control[,j])$p.value
        print(shap_control[j])
        }
        stat_k$Trait[j] <- names(k_case)[j]
        print(names(k_case)[j])
        if((shap_case[j] > 0.05) && (shap_control[j] >0.05)) #if normal distribution
          {#norm_stat_k$D[j]       <- k$statistic
          #norm_stat_k$p[j]       <- k$p.value
          #bartlett.test(Sepal.Length  ~ Species, df1) выборки с разным объемом выборок -> барлетт
          #b<-bartlett.test(k[,j] ~ k$Opi_status_micro, k)
          #8 колонка - возраст для к, для остальных это первая колонка. 7+1 =8 
          b[j]<-var.test(k[,j+7] ~ k$Opi_status_micro, k)$p.value
          print(b[j])
          if(b[j]>0.05) # if ratio of variance is equal to 1
              {
              t <- t.test(k_case[,j],k_control[,j])
              print(t)
              stat_k$kriteria_value[j] <- t$statistic
              stat_k$p[j] <- t$p.value  
              stat_k$criteria[j] <- "t-test"
              } else
              {
              w <- wilcox.test(k[,j+7] ~ k$Opi_status_micro, k)
              print(w)
              stat_k$kriteria_value[j] <- w$statistic
              stat_k$p[j] <- w$p.value
              stat_k$criteria[j] <- "M - U (wilcox), norm distr"
      
              }
    

          } else
          {
          u <- wilcox.test(k_case[,j],k_control[,j])
          print(u)
          stat_k$kriteria_value[j]= u$statistic
          stat_k$p[j]= u$p.value
          stat_k$criteria[j] = "M - U (wilcox)"
          } 
        }
      stat_k
      significant_stat_k <- data.frame(Trait=character(1), kriteria_value=numeric(1), p=numeric(1),criteria = character(1), stringsAsFactors=F)
      for (j in 1:19)
        {
          if (stat_k$p[j] < 0.05)
          {
            significant_stat_k<-rbind(significant_stat_k,stat_k[j,])
            
          }
        
        
        }
      
      significant_stat_k
      #важные отличия в группах зараженных протеин, AST, creatine, kp
      
      
      
      
      
      }


    #Численные между собой corrplots
    {
pairs(k[,8:26])
library(psych)
library(corrplot)
corr_nometab <- corr.test(k[,8:26], method = "spearman")
corrplot(corr_nometab$r, method="color",type = "upper",p.mat = corr_nometab$p, sig.level = 0.05,insig = "blank")
corrplot(corr_nometab$r, method="number",type = "upper",p.mat = corr_nometab$p, sig.level = 0.05,insig = "blank")

col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
corrplot(corr_nometab$r, method="color", col=col(200),  
         type="upper", order="hclust", 
         addCoef.col = "black", # Add coefficient of correlation
         tl.col="black", tl.srt=45, #Text label color and rotation
         # Combine with significance
         p.mat = corr_nometab$p, sig.level = 0.05, insig = "blank", 
         # hide correlation coefficient on the principal diagonal
         diag=FALSE 
)
    }
    #Cofounders:
    #Возраст связан с ИМТ, VLDLa, TG, urea, cholesterol, LDL
    #ИМТ - VLDLa,TG,GGTP,cholesterol

  }#конец численным


}
#END OF BASIC STAT 


#TRYING_create corr logistic regression #################################################################################################
{
noesy_clinic[0:3,3:25]
#logistic regr
#http://r-statistics.co/Logistic-Regression-With-R.html
#kp - копропорфирин?  
M2 <- glm(Opi_status_micro ~ protein + AST + creatinine + kp,  
          family = binomial(link = "logit"), data = noesy_clinic)

summary(M2)         
predicted <- plogis(predict(M2, noesy_clinic)) 

library(plotROC)
#plotROC(noesy_clinic$Opi_status_micro, predicted)
#rocplot<-ggplot(noesy_clinic, aes(m = predicted, d = noesy_clinic$Opi_status_micro))
#rocplot + style_roc(theme = theme_grey) + geom_rocci(fill="pink") 
#may be theyare main cofounders
#AGE, BMI, SEX , drinking alcohol
#compouns - from bilirubin to kp#

#Increased Echogenesity of  what? Liver? Gall Bladder?
#With help it doctors make diagnosis (it is cheap)

#PeriductalFibrosisIntrahepaticBileDuctsUS - это Околопроточный фиброз желчных протоков печени

#взаимосвязь между признаками
#регрессии с описторхозом - лин модели (кроме kp), найти кофаундеры
#какие метаданные ассоциированы с описторхозом

}
#END of building models




