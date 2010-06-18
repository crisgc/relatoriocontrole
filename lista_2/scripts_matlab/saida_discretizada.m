function saida = saida_discretizada(k, y, u)
saida = 1.724*y(k-1)-0.7408*y(k-2)+0.0091*u(k-1)+0.0081*u(k-2);