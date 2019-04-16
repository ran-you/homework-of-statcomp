rm(list = ls())
NormLogLike = function(x, mu, sigma){
  y = sum(dnorm(x, mu, sigma, log = TRUE))
  return(y)
}

vectorNum1 = c(1, 2, 20)
a = c()
mu = 0
sigma = mu
for (i in min(vectorNum1):max(vectorNum1)){
  for (j in 1:max(vectorNum1)){
    b = a
    a = c(a, NormLogLike(vectorNum1, i, j))
    if (max(a) > max(b)){
      mu = i
      sigma = j
    }
  }
}
mu
sigma

x = seq(min(vectorNum1):max(vectorNum1))
y = seq(1:max(vectorNum1))
z = matrix(as.matrix(a, nrow = max(vectorNum1)-min(vectorNum1), ncol = max(vectorNum1)), max(vectorNum1)-min(vectorNum1)+1, max(vectorNum1))
persp(x, y, z, theta = 45, phi = 20,
      xlim = range(x), ylim = range(y), #zlim = range(min(a):max(a), na.rm = TRUE),
      zlim = range(0:-200, na.rm = TRUE), 
      expand = 0.5,
      r=180,
      #ltheta = 120,
      #shade = 0.75, 
      ticktype = "detailed",
      xlab = "X", ylab = "Y", zlab = "z" ,
      border = 30
)