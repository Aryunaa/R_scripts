
Dataset <- readXL("C:/Users/������� �����/Desktop/�����������/zadanie.xlsx", rownames=FALSE,
   header=TRUE, na="", sheet="����1", stringsAsFactors=TRUE)
with(Dataset, Hist(�������, groups=������.�������, scale="frequency", 
  breaks="Sturges", col="darkgray"))
with(Dataset, Dotplot(�������, by=������.�������, bin=FALSE))
with(Dataset, Dotplot(���, by=������.�������, bin=FALSE))
with(Dataset, Hist(���, groups=������.�������, scale="frequency", 
  breaks="Sturges", col="darkgray"))


with(Dataset, qqPlot(�������, dist="norm", id=list(method="y", n=2, 
  labels=rownames(Dataset))))

