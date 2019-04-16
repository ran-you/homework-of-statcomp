#  1 change (for) into (while)
is.leapyear = function(year){
  if ((year%%4 == 0 & year%%100 != 0) | year%%400 == 0){
    return(TRUE)
  }else{
    return(FALSE)
  }
}

year = 0
while(year <= 5000){
  if (is.leapyear(year)){
    print(year)
    year = year+1
  }else{
    year = year+1
  }
}

proc.time()



#  2 replicate 5000 times to compare the difference of computation times between using loop and vector
#  using loop 
proc.time()
loop_leapyear = function(year){
  if ((year%%4 == 0 & year%%100 != 0) | year%%400 == 0){
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
proc.time()
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
matrixNum1 = matrix(1:12, 3, 4)
matrixNum2 = matrix(13:24, 4, 3)
matrixResult = matrix(0, length(matrixNum1[, 1]), length(matrixNum2[1, ]))
if (length(matrixNum1[1, ]) == length(matrixNum2[, 1])){
  for (i in 1:length(matrixNum1[, 1])){
    for (k in 1:length(matrixNum1[, 1])){
      for (j in 1:length(matrixNum1[1, ])){
        sum = sum + matrixNum1[i, j] * matrixNum2[j, k]
        }
      matrixResult[i, k] = sum
      sum = 0
    }
    }
  }else{
    print("These two matrix can't be producted!")
    }
matrixResult
matrixNum1%*%matrixNum2



#  4 compute (det(A)) with recursion
DetMatrix = function(matrixTest){
  if (length(matrixTest[1, ]) == 2){
    return((matrixTest[1, 1]*matrixTest[2, 2]) - (matrixTest[1, 2]*matrixTest[2, 1]))
  }else{
    for (i in 1:length(matrixTest[1, ])){
      sum = sum + ((-1)^(1 + i))*matrixTest[1, i]*DetMatrix(matrixTest[-1, -i])
    }
    return(sum)
  }
}

Det = function(matrixTest){
  if (length(matrixTest[1, ]) == length(matrixTest[, 1])){
    return(DetMatrix(matrixTest))
  }else{
    print("Please give me a square matrix!")
    invisible("Don't give me something like THAT!!!")
  }
}
vectorNum1 = c(1, 3, 5)
vectorNum2 = c(2, 5, 9)
vectorNum3 = c(3, 7, 12)
matrixNum3 = matrix(1:9, 3, 3)
matrixNum4 = matrix(1:12, 4, 3)
matrixNum5 = cbind(vectorNum1, vectorNum2, vectorNum3)
Det(matrixNum3)
Det(matrixNum4)
Det(matrixNum5)
det(matrixNum3)
det(matrixNum4)
det(matrixNum5)
