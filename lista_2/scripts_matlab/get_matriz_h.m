function H = get_matriz_h(h, NY, NU)
flag = 1;
cont = 1;
for i=1:NY
   cont = flag;
   for j=1:NU
       if j > flag 
           break;
       end
       H(i, j) = h(cont);
       cont = cont - 1;
   end
   flag = flag + 1;
end