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

# 14 ����Ĭ����ⷽ����(P102 19.1)
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

# 15 ���л���������ʽֵ����
a = c(1,2,3)
b = c(4,6,8)
c = c(9, 12, 16)
A = rbind(a,b,c)
B = cbind(a,b,c)
det(A)
det(B)

# 16 ����ʽ��һ�еĹ����ӿ������ȥ
a = c(1,2,3)
b = c(4,6,8)
c = c(9, 12, 16)
d = 2*X
A = rbind(a,b,c)
B = rbind(d,b,c)
2*det(A)
det(B)

# 17 ���ĳһ�����������ĺͣ���ô�������ʽ�͵�����������ʽ�ĺ�
#    ������������ʽ����һ������ȫ��ԭ������ʽ�Ķ�Ӧ����һ��
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

# 18 �������ʽ�����гɱ�������ô����ʽΪ0
a = c(1,2,3)
b = c(4,6,8)
c = 10*X
A = rbind(a,b,c)
det(A) == 0

# 19 ��һ�еı����ӵ���һ�У�����ʽ����
a = c(1,2,3)
b = c(4,6,8)
c = c(9, 12, 16)
d = c + 5*a + 7*b
A = rbind(a,b,c)
B = rbind(a,b,d)
det(A)
det(B)

# 20 �Ի�����ʽ�����е�λ�ã�����ʽ����
a = c(1,2,3)
b = c(4,6,8)
c = c(9, 12, 16)
A = rbind(a,b,c)
B = rbind(b,a,c)
-det(A) == det(B)