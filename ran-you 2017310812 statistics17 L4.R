#  1 change (for) into (while)
is.leapyear = function(year){
  if((year%%4 == 0 & year%%100 != 0) | year%%400 == 0){
    return(TRUE)
  }else{
    return(FALSE)
  }
}

year = 0
while(year <= 5000){
  if(is.leapyear(year)){
    print(year)
    year = year+1
  }else{
    year = year+1
  }
}

proc.time()



#  2 replicate 5000 times to compare the difference of computation times between using loop and vector
#  using loop 
loop_leapyear = function(year){
  if((year%%4 == 0 & year%%100 != 0) | year%%400 == 0){
    return(TRUE)
  }else{
    return(FALSE)
  }
}

loop_five_thousands_leapyears = function(){
  for (year in 0:5000){
    if(loop_leapyear(year)){
      print(year)
    }
  }
}
replicate(5000, loop_five_thousands_leapyears())  # the script is difficult to be computed 5000 times
proc.time()


# using vector
vector_leapyears = function(years){
  ((years%%4 == 0 & years%%100 != 0) | years%%400 == 0)
}

vector_five_thousands_leapyears = function(){
  print(years[vector_leapyears(0:5000) == TRUE])
}
years = c(0:5000)
replicate(5000, vector_five_thousands_leapyears())  # the script is difficult to be computed 5000 times either
proc.time()
#  warning: Be caution to compute!!!Both of them!!!



#  3 compute (A %*% B) without functions in R
vectorNum1 = c()
vectorNum2 = c()
sum = 0
matrixNum1 = matrix(1:12, 3, 4)
matrixNum2 = matrix(13:24, 4, 3)
if(length(matrixNum1[1, ]) == length(matrixNum2[, 1])){
  for(i in 1:length(matrixNum1[, 1])){
    for(k in 1:length(matrixNum1[, 1])){
      for(j in 1:length(matrixNum1[1, ])){
        sum = sum+(matrixNum1[i, j] * matrixNum2[j, k])
        }
      vectorNum1 = c(vectorNum1, sum)
      sum = 0
    }
    vectorNum2 = rbind(vectorNum2, vectorNum1)
    vectorNum1 = c()
    sum = 0
  }
}else{
  print("These two matrix can't be producted!")
}
vectorNum2
