> n1T<-8
> n1T<-5
> n1T<-8
> n2T<-5
> tablsopr<-matrix(c(n1R,n2R,n1T,n2T),nrow=2,byrow=TRUE)
> tablsopr
[,1] [,2]
[1,]    8    5
[2,]    8    5
> chisq.test(tablsopr)

