function c = rdivide(a, b)
c = builtin('rdivide', a, b)
c(b==0) = 0;