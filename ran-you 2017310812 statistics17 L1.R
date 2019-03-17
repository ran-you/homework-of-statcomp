# 1 A + B = B + A
A = matrix(1:12,3,4)
B = matrix(13:24,3,4)
C = A + B
D = B + A
C == D

# 2 A + (B + C) = (A + B) + C
A = matrix(1:12,3,4)
B = matrix(13:24,3,4)
C = matrix(25:36,3,4)
D = A + (B + C)
E = (A + B) + C
D == E

# 3 (AB)C = A(BC)
A = matrix(1:9,3,3)
B = matrix(10:18,3,3)
C = matrix(19:27,3,3)
D = (A%*%B)%*%C
E = A%*%(B%*%C)
D == E

# 4 AB != BA
A = matrix(1:9,3,3)
B = matrix(10:18,3,3)
C = A%*%B
D = B%*%A
C == D

# 5 A(B + C) = AB + AC
A = matrix(1:9,3,3)
B = matrix(10:18,3,3)
C = matrix(19:27,3,3)
D = A%*%(B + C)
E = A%*%B + A%*%C
D == E

# 6 (B + C)A = BA + CA
A = matrix(1:9,3,3)
B = matrix(10:18,3,3)
C = matrix(19:27,3,3)
D = (B + C)%*%A
E = B%*%A + C%*%A
D == E

# 7 (A')' = A
A = matrix(1:12,3,4)
B = t(A)
C = t(B)
A == C

# 8 (A + B)' = A' + B'
A = matrix(1:12,3,4)
B = matrix(13:24,3,4)
C = t(A + B)
D = t(A) + t(B)
C == D

# 9 (AB)' = B'A'
A = matrix(1:12,3,4)
B = matrix(13:24,4,3)
C = t(A%*%B)
D = t(B)%*%t(A)
C == D

# 10 (kA)' = kA'
A = matrix(1:12,3,4)
k = 5
B = t(k*A)
C = k*t(A)
B == C

# 11 |AB| = |A||B|
A = matrix(1:9,3,3)
B = matrix(10:18,3,3)
C = det(A%*%B)
D = det(A) * det(B)
C == D

# 12 (A')^(-1) = (A^(-1))'
a = c(1,2,3)
b = c(4,6,8)
c = c(9, 12, 16)
A = rbind(a,b,c)
B = t(A)
C = solve(B)
D = solve(A)
E = t(D)
C
E

# 13 (AB)^(-1) = B^(-1)*A^(-1)
a = c(1,2,3)
b = c(4,6,8)
c = c(9, 12, 16)
A = rbind(a,b,c)
B = cbind(a,b,c)
C = A%*%B
D = solve(C)
E = solve(B)
G = solve(A)
H = E%*%G
D
H

# 14 克拉默法则解方程组(P102 19.1)
a = c(2,-1,3,2,6)
b = c(3,-3,3,2,5)
c = c(3,-1,-1,2,3)
d = c(3,-1,3,-1,4)
D = rbind(a,b,c,d)
x1 = det(D[,-1])/det(D[,-5])
x2 = det(D[,-2])/det(D[,-5])
x3 = det(D[,-3])/det(D[,-5])
x4 = det(D[,-4])/det(D[,-5])
x1
x2
x3
x4

# 15 行列互换，行列式值不变
a = c(1,2,3)
b = c(4,6,8)
c = c(9, 12, 16)
A = rbind(a,b,c)
B = cbind(a,b,c)
det(A)
det(B)

# 16 行列式的一行的公因子可以提出去
a = c(1,2,3)
b = c(4,6,8)
c = c(9, 12, 16)
d = 2*X
A = rbind(a,b,c)
B = rbind(d,b,c)
2*det(A)
det(B)

# 17 如果某一行是两组数的和，那么这个行列式就等于两个行列式的和
#    而这两个行列式除这一行以外全与原来行列式的对应的行一样
a = c(1,2,3)
b = c(4,6,8)
c = c(9, 12, 16)
d = c(17,22,28)
e = a + d
A = rbind(e,b,c)
B = rbind(a,b,c)
C = rbind(d,b,c)
det(A)
det(B) + det(C)

# 18 如果行列式中两行成比例，那么行列式为0
a = c(1,2,3)
b = c(4,6,8)
c = 10*X
A = rbind(a,b,c)
det(A) == 0

# 19 把一行的倍数加到另一行，行列式不变
a = c(1,2,3)
b = c(4,6,8)
c = c(9, 12, 16)
d = c + 5*a + 7*b
A = rbind(a,b,c)
B = rbind(a,b,d)
det(A)
det(B)

# 20 对换行列式中两行的位置，行列式反号
a = c(1,2,3)
b = c(4,6,8)
c = c(9, 12, 16)
A = rbind(a,b,c)
B = rbind(b,a,c)
-det(A) == det(B)