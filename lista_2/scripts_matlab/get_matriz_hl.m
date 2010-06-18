function H = get_matriz_hl(h, NY, d)
% H = zeros(NY, length(h)-1);
% H(1, :) = h(end:-1:2);
% cont = 3;
% for i=2:NY
%    z = zeros(1, cont-2);
%    H(i, :) = [z h(end:-1:cont)'];
%    cont = cont + 1;
% end

H = [];
N = length(h);
for k=1:NY
   for j=1:(N-1)
       if(k+j)>N
           H(k,j)=h(N)-h(j);
       else
           H(k,j)=h(k+j)-h(j);
       end
   end
end