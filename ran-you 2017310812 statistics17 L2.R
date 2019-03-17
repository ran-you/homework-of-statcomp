# 1 A + B = B + A
matrixNum1 <- matrix(1:12, 3, 4)
matrixNum2 <- matrix(13:24, 3, 4)
matrixNum3 = matrixNum1 + matrixNum2
matrixNum4 = matrixNum2 + matrixNum1
all(matrixNum3 == matrixNum4)

# 2 A + (B + C) = (A + B) + C
matrixNum1 <- matrix(1:12, 3, 4)
matrixNum2 <- matrix(13:24, 3, 4)
matrixNum3 <- matrix(25:36, 3, 4)
matrixNum4 = matrixNum1 + (matrixNum2 + matrixNum3)
matrixNum5 = (matrixNum1 + matrixNum2) + matrixNum3
all(matrixNum4 == matrixNum5)

# 3 (AB)C = A(BC)
matrixNum1 <- matrix(1:9, 3, 3)
matrixNum2 <- matrix(10:18, 3, 3)
matrixNum3 <- matrix(19:27, 3, 3)
matrixNum4 = (matrixNum1%*%matrixNum2) %*% matrixNum3
matrixNum5 = matrixNum1 %*% (matrixNum2%*%matrixNum3)
all(matrixNum4 == matrixNum5)

# 4 AB != BA
matrixNum1 <- matrix(1:9, 3, 3)
matrixNum2 <- matrix(10:18, 3, 3)
matrixNum3 = matrixNum1%*%matrixNum2
matrixNum4 = matrixNum2%*%matrixNum1
all(matrixNum3 == matrixNum4)

# 5 A(B + C) = AB + AC
matrixNum1 <- matrix(1:9, 3, 3)
matrixNum2 <- matrix(10:18, 3, 3)
matrixNum3 <- matrix(19:27, 3, 3)
matrixNum4 = matrixNum1 %*% (matrixNum2 + matrixNum3)
matrixNum5 = matrixNum1%*%matrixNum2 + matrixNum1%*%matrixNum3
all(matrixNum4 == matrixNum5)

# 6 (B + C)A = BA + CA
matrixNum1 <- matrix(1:9, 3, 3)
matrixNum2 <- matrix(10:18, 3, 3)
matrixNum3 <- matrix(19:27, 3, 3)
matrixNum4 = (matrixNum2 + matrixNum3) %*% matrixNum1
matrixNum5 = matrixNum2%*%matrixNum1 + matrixNum3%*%matrixNum1
all(matrixNum4 == matrixNum5)

# 7 (A')' = A
matrixNum1 <- matrix(1:12, 3, 4)
matrixNum2 = t(matrixNum1)
matrixNum3 = t(matrixNum2)
all(matrixNum1 == matrixNum3)

# 8 (A + B)' = A' + B'
matrixNum1 <- matrix(1:12, 3, 4)
matrixNum2 <- matrix(13:24, 3, 4)
matrixNum3 = t(matrixNum1 + matrixNum2)
matrixNum4 = t(matrixNum1) + t(matrixNum2)
all(matrixNum3 == matrixNum4)

# 9 (AB)' = B'A'
matrixNum1 <- matrix (1:12, 3, 4)
matrixNum2 <- matrix (13:24, 4, 3)
matrixNum3 = t(matrixNum1%*%matrixNum2)
matrixNum4 = t(matrixNum2) %*% t(matrixNum1)
all(matrixNum3 == matrixNum4)

# 10 (kA)' = kA'
matrixNum1 <- matrix(1:12, 3, 4)
kConstantK <- 5
matrixNum2 = t(kConstantK*matrixNum1)
matrixNum3 = kConstantK * t(matrixNum1)
all(matrixNum2 == matrixNum3)

# 11 |AB| = |A||B|
matrixNum1 <- matrix(1:9, 3, 3)
matrixNum2 <- matrix(10:18, 3, 3)
matrixNum3 = det(matrixNum1%*%matrixNum2)
matrixNum4 = det(matrixNum1) * det (matrixNum2)
matrixNum3 == matrixNum4

# 12 (A')^(-1) = (A^(-1))'
vectorNum1 <- c(1, 2, 3)
vectorNum2 <- c(4, 6, 8)
vectorNum3 <- c(9, 12, 16)
matrixNum1 = rbind(vectorNum1, vectorNum2, vectorNum3)
matrixNum2 = t(matrixNum1)
matrixNum3 = solve(matrixNum2)
matrixNum4 = solve(matrixNum1)
matrixNum5 = t(matrixNum4)
all(matrixNum3 == matrixNum5)
identical(matrixNum3, matrixNum5)
all.equal(matrixNum3, matrixNum5)

# 13 (AB)^(-1) = B^(-1)*A^(-1)
vectorNum1 <- c(1, 2, 3)
vectorNum2 <- c(4, 6, 8)
vectorNum3 <- c(9, 12, 16)
matrixNum1 = rbind(vectorNum1, vectorNum2, vectorNum3)
matrixNum2 = cbind(vectorNum1, vectorNum2, vectorNum3)
matrixNum3 = matrixNum1%*%matrixNum2
matrixNum4 = solve(matrixNum3)
matrixNum5 = solve(matrixNum2)
matrixNum6 = solve(matrixNum1)
matrixNum7 = matrixNum5%*%matrixNum6
all(matrixNum4 == matrixNum7)
identical(matrixNum4, matrixNum7)
all.equal(matrixNum4, matrixNum7)

# 14 Solve an equation group with the usage of the Cramer's Rule (P102 19.1)
vectorNum1 <- c(2, -1, 3, 2, 6)
vectorNum2 <- c(3, -3, 3, 2, 5)
vectorNum3 <- c(3, -1, -1 ,2, 3)
vectorNum4 <- c(3, -1, 3, -1, 4)
matrixD = rbind(vectorNum1, vectorNum2, vectorNum3, vectorNum4)
X1 <- det(matrixD[, -1])/det(matrixD[, -5])
X2 <- det(matrixD[, -2])/det(matrixD[, -5])
X3 <- det(matrixD[, -3])/det(matrixD[, -5])
X4 <- det(matrixD[, -4])/det(matrixD[, -5])
X1
X2
X3
X4

# 15 If you swap a row and a column, the determinant doesn't change
vectorNum1 <- c(1, 2, 3)
vectorNum2 <- c(4, 6, 8)
vectorNum3 <- c(9, 12, 16)
matrixNum1 = rbind(vectorNum1, vectorNum2, vectorNum3)
matrixNum2 = cbind(vectorNum1, vectorNum2, vectorNum3)
det(matrixNum1) ==det (matrixNum2)
identical(det(matrixNum1), det(matrixNum2))
all.equal(det(matrixNum1), det(matrixNum2))

# 16 The common factors of a row of a determinant can be factored out
vectorNum1 <- c(1, 2, 3)
vectorNum2 <- c(4, 6, 8)
vectorNum3 <- c(9, 12, 16)
vectorNum4 = 2*vectorNum1
matrixNum1 = rbind(vectorNum1, vectorNum2, vectorNum3)
matrixNum2 = rbind(vectorNum4, vectorNum2, vectorNum3)
2*det(matrixNum1) == det(matrixNum2)
identical(2*det(matrixNum1), det(matrixNum2))
all.equal(2*det(matrixNum1), det(matrixNum2))


# 17 If a row is the sum of two sets of Numbers, 
#    then the determinant is equal to the sum of two determinants 
#    that are the same as the original row except for this row
vectorNum1 <- c(1, 2, 3)
vectorNum2 <- c(4, 6, 8)
vectorNum3 <- c(9, 12, 16)
vectorNum4 <- c(17, 22, 28)
vectorNum5 = vectorNum1 + vectorNum4
matrixNum1 = rbind(vectorNum5, vectorNum2, vectorNum3)
matrixNum2 = rbind(vectorNum1, vectorNum2, vectorNum3)
matrixNum3 = rbind(vectorNum4, vectorNum2, vectorNum3)
det(matrixNum1) == det(matrixNum2) + det(matrixNum3)
identical(det(matrixNum1), det(matrixNum2) + det(matrixNum3))
all.equal(det(matrixNum1), det(matrixNum2) + det(matrixNum3))

# 18 If the determinant is proportional to two rows, then the determinant is 0
vectorNum1 <- c(1, 2, 3)
vectorNum2 <- c(4, 6, 8)
vectorNum3 = 10*vectorNum2
matrixNum1 = rbind(vectorNum1, vectorNum2, vectorNum3)
det (matrixNum1) == 0

# 19 When you add multiples of one row to another row, the determinant doesn't change
vectorNum1 <- c(1, 2, 3)
vectorNum2 <- c(4, 6, 8)
vectorNum3 <- c(9, 12, 16)
vectorNum4 = vectorNum3 + 5*vectorNum1 + 7*vectorNum2
matrixNum1 = rbind(vectorNum1, vectorNum2, vectorNum3)
matrixNum2 = rbind(vectorNum1, vectorNum2, vectorNum4)
det(matrixNum1) == det(matrixNum2)
identical(det(matrixNum1), det(matrixNum2))
all.equal(det(matrixNum1), det(matrixNum2))

# 20 Swap the positions of two rows in the determinant, and the sign of the determinant changes
vectorNum1 <- c(1, 2, 3)
vectorNum2 <- c(4, 6, 8)
vectorNum3 <- c(9, 12, 16)
matrixNum1 = rbind(vectorNum1, vectorNum2, vectorNum3)
matrixNum2 = rbind(vectorNum2, vectorNum1, vectorNum3)
-det(matrixNum1) == det(matrixNum2)


# 21 An example about funtion "apply"
arrayNum1 <- array(1:60, c(3,4,5))
apply(arrayNum1, c(1,2), mean)
apply(arrayNum1, c(1,3), sd)
apply(arrayNum1, c(2,3), length)

# 22 An example about function"tapply"
tapply(1:12, rep(1:3,4), sum)