
R version 3.5.0 (2018-04-23) -- "Joy in Playing"
Copyright (C) 2018 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[Workspace loaded from ~/.RData]

[Workspace loaded from ~/.RData]

[Workspace loaded from ~/.RData]

> sexbyR
[1] 2 1 2 1 1 1 1 2 1 1 2 1 2
Levels: 1 2
> n1R<-0
> n1R<-sexbyR[1]
> n1R
[1] 2
Levels: 1 2
> n1R<-sexbyR[0]
> n1R
factor(0)
Levels: 1 2
> n1R<-sexbyR[2]
> n1R
[1] 1
Levels: 1 2
> plot(sexbyR)
> plot(sexbyR, x=sex,y=kolvo)
Error in plot(sexbyR, x = sex, y = kolvo) : object 'sex' not found
> n1R<-8
> n2R<-5
> plot(sexbyT)
> 
  > 
  > sexbyT
[1] 2 2 1 1 2 1 1 1 1 2 1 2 1
Levels: 1 2
> n1T<-8
> n1T<-5
> n1T<-8
> n2T<-5
> tablsopr<-matrix(c(n1R,n2R,n1T,n2T))
> tablsopr
[,1]
[1,]    8
[2,]    5
[3,]    8
[4,]    5
> tablsopr<-matrix(c(n1R,n2R,n1T,n2T),nrow=2,byrow=TRUE)
> tablsopr
[,1] [,2]
[1,]    8    5
[2,]    8    5
> chisq.test(tablsopr)

Pearson's Chi-squared test

data:  tablsopr
X-squared = 0, df = 1, p-value = 1

> source('~/firstcript.R')
Error in file(filename, "r", encoding = encoding) : 
cannot open the connection
In addition: Warning message:
In file(filename, "r", encoding = encoding) :
cannot open file 'C:/Users/??????? ?????/Documents/firstcript.R': Invalid argument
> var.test(agebyR,agebyT)

F test to compare two variances

data:  agebyR and agebyT
F = 1.3976, num df = 12, denom df = 12, p-value = 0.571
alternative hypothesis: true ratio of variances is not equal to 1
95 percent confidence interval:
0.4264659 4.5804767
sample estimates:
ratio of variances 
1.397647 

> #не можем отклонить H0 гипотезу о однородности дисперсии, применим критерий Стьюдента для проверки гипотезы о разницы мат ожиданий возраста
> 
> tapply(Dataset$Возраст, Dataset$Группа.лечения, mean)
R        T 
61.84615 63.15385 
> 
> t.test(Dataset$Возраст ~ Dataset$Группа.лечения)

Welch Two Sample t-test

data:  Dataset$Возраст by Dataset$Группа.лечения
t = -0.49305, df = 23.358, p-value = 0.6266
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
-6.789680  4.174295
sample estimates:
mean in group R mean in group T 
61.84615        63.15385 

> 
> t.test(Dataset$Возраст ~ Dataset$Группа.лечения,var.equal = TRUE)

Two Sample t-test

data:  Dataset$Возраст by Dataset$Группа.лечения
t = -0.49305, df = 24, p-value = 0.6265
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
-6.781701  4.166316
sample estimates:
mean in group R mean in group T 
61.84615        63.15385 

> 
> #не можем отклонить H0 гипотезу (разницы нет) о разнице среднего возраста в группах лечения
> 
> #переходим к непараметрическому критерию сравнения Wдо в группах лечения
> #критерий Манна-Уитниwilcox.test(expend ~ stature, paired = FALSE)
> 
> wilcox.test(Dataset$Wдо ~ Dataset$Группа.лечения, paired = FALSE)

Wilcoxon rank sum test with continuity correction

data:  Dataset$Wдо by Dataset$Группа.лечения
W = 80, p-value = 0.8374
alternative hypothesis: true location shift is not equal to 0

Warning message:
In wilcox.test.default(x = c(59.52, 68.4, 80, 65, 62.5, 85, 78.89,  :
не могу подсчитать точное p-значение при наличии повторяющихся наблюдений
> 
> ?wilcox.test
> 
> install.packages("coin")
also installing the dependency ‘modeltools’

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/modeltools_0.2-21.zip'
Content type 'application/zip' length 203840 bytes (199 KB)
downloaded 199 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/coin_1.2-2.zip'
Content type 'application/zip' length 1463971 bytes (1.4 MB)
downloaded 1.4 MB

package ‘modeltools’ successfully unpacked and MD5 sums checked
package ‘coin’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\Аюшеева Арюна\AppData\Local\Temp\Rtmpc99FHI\downloaded_packages
> library(coin)
Загрузка требуемого пакета: survival
> tapply(Dataset$Wдо ~ Dataset$Группа.лечения)
Error in tapply(Dataset$Wдо ~ Dataset$Группа.лечения) : 
argument "INDEX" is missing, with no default
> tapply(WbfbyR,WbfbyT)
[1] 11  2 12  4 10  6  1  7  9  8  6  3  5
> tapply(WbfbyR,WbfbyT,mean)
33   50.6  55.09     57  58.33   58.5   62.5  66.67     75     78   97.5 
78.89  68.40   8.30  65.00  25.00  82.50   6.70  50.00  57.00  62.50  59.52 
111.11 
80.00 
> tapply(Dataset$Wдо, Dataset$Группа.лечения, mean)
R        T 
55.87000 66.29231 
> 
> wilcox_test(Dataset$Wдо ~ Dataset$Группа.лечения)

Asymptotic Wilcoxon-Mann-Whitney Test

data:  Dataset$Wдо by Dataset$Группа.лечения (R, T)
Z = -0.23093, p-value = 0.8174
alternative hypothesis: true mu is not equal to 0

> wilcox_test(Dataset$Wдо ~ Dataset$Группа.лечения,alternative="greater")

Asymptotic Wilcoxon-Mann-Whitney Test

data:  Dataset$Wдо by Dataset$Группа.лечения (R, T)
Z = -0.23093, p-value = 0.5913
alternative hypothesis: true mu is greater than 0

> wilcox_test(Dataset$Wдо ~ Dataset$Группа.лечения,alternative="greater",paired = FALSE)

Asymptotic Wilcoxon-Mann-Whitney Test

data:  Dataset$Wдо by Dataset$Группа.лечения (R, T)
Z = -0.23093, p-value = 0.5913
alternative hypothesis: true mu is greater than 0

> wilcox_test(Dataset$Wдо ~ Dataset$Группа.лечения,alternative="smaller",paired = FALSE)
Error in match.arg(alternative) : 
'arg' should be one of “two.sided”, “less”, “greater”
> wilcox_test(Dataset$Wдо ~ Dataset$Группа.лечения,alternative="less",paired = FALSE)

Asymptotic Wilcoxon-Mann-Whitney Test

data:  Dataset$Wдо by Dataset$Группа.лечения (R, T)
Z = -0.23093, p-value = 0.4087
alternative hypothesis: true mu is less than 0

> #p-value высокий, не можем опровергнуть гипотезу H0 о том, что нет разницы в Wдо в группах лечения
> wilcox.test(Dataset$Wпосле ~ Dataset$Группа.лечения, paired = FALSE)

Wilcoxon rank sum test with continuity correction

data:  Dataset$Wпосле by Dataset$Группа.лечения
W = 58.5, p-value = 0.1906
alternative hypothesis: true location shift is not equal to 0

Warning message:
In wilcox.test.default(x = c(67, 80.9, 82, 75, 62.5, 87, 90, 7,  :
не могу подсчитать точное p-значение при наличии повторяющихся наблюдений
> 
> tapply(Dataset$Wпосле, Dataset$Группа.лечения, mean)
R        T 
60.83846 80.17538 
> 
> wilcox_test(Dataset$Wпосле ~ Dataset$Группа.лечения,alternative="less",paired = FALSE)

Asymptotic Wilcoxon-Mann-Whitney Test

data:  Dataset$Wпосле by Dataset$Группа.лечения (R, T)
Z = -1.3345, p-value = 0.09102
alternative hypothesis: true mu is less than 0