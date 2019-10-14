
Dataset <- readXL("C:/Users/Àşøååâà Àğşíà/Desktop/ëåòïğàêòèêà/zadanie.xlsx", rownames=FALSE,
   header=TRUE, na="", sheet="Ëèñò1", stringsAsFactors=TRUE)
with(Dataset, Hist(Âîçğàñò, groups=Ãğóïïà.ëå÷åíèÿ, scale="frequency", 
  breaks="Sturges", col="darkgray"))
with(Dataset, Dotplot(Âîçğàñò, by=Ãğóïïà.ëå÷åíèÿ, bin=FALSE))
with(Dataset, Dotplot(Ïîë, by=Ãğóïïà.ëå÷åíèÿ, bin=FALSE))
with(Dataset, Hist(Ïîë, groups=Ãğóïïà.ëå÷åíèÿ, scale="frequency", 
  breaks="Sturges", col="darkgray"))


with(Dataset, qqPlot(Âîçğàñò, dist="norm", id=list(method="y", n=2, 
  labels=rownames(Dataset))))

