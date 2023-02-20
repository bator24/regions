library(readxl)

setwd("C:/Users/markb/OneDrive/Valicon")

data <- read_excel("SLO_OBCINE.xlsx")
head(data)

head(data$OB_UIME)
head(data$OB_ID)
head(data$X_C)
head(data$Y_C)
close(net)

net <- file("regije.net", "w", encoding = "UTF-8")

cat("% regije", date(), "\n", file = net)
cat("*Vertices", nrow(data$OB_ID), "\n", file = net)
cat(paste(data$OB_ID, ' "',data$OB_IME,'" ', data$X_C, " ", data$Y_C, "\n", sep = ""), file = net)



data_povezave <- read.csv("STO168_baza_pajek.csv", sep = ";")
head(data_povezave)


m <- nrow(data_povezave)

cat('*Arcs :1 "Trenutne povezave"', "\n", file = net)

for (i in 2:m) for (j in (7:219)){
  if (!is.na(data_povezave[i,j])) cat(data_povezave$Q1A[i], j-6, "\n", file = net)
}

cat('*Arcs :2 "Željene povezave"', "\n", file = net)

for (i in 2:m){
  R <- unlist(data_povezave[i, 222:433])
  Q <- R[!is.na(R)]; k <- length(Q)
  if(k>0) for (j in 1:k) cat(data_povezave$Q1A[i], Q[j], "\n", file = net)
}
class(R[1])

close(net)

#povezave
i <- 6
R <- data_povezave[i, 7:218]
Q <- R[!is.na(R)]
Q

#želje
i <- 6
R <- data_povezave[i, 222:433]
Q <- R[!is.na(R)]
Q




