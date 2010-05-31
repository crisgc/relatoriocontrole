p = [ 1 2 3 4 5 ];
cores = ['k' 'b' 'r' 'g' 'm'];

figure;
hold;
grid on;

for i = 1 : length( p )
    Gmf = tf([-2*p(i) p(i)^2],[1 p(i) 9]);
    bodeplot( Gmf, cores(i) );
end

grid