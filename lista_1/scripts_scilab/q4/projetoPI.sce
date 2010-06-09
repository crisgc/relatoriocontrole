// Universidade Federal do Rio Grande do Norte
// Programa de Pos-Graduacao em Engenharia Eletrica e de Computacao
// Controle Avancado
// Projeto do controlador PI para a questao 4 da lista 1
// Autores:
//        Anna Giselle Camara Dantas Ribeiro
//        Cristiano Gurgel de Castro
//        Diogo Leite Reboucas
//        Thiago Medeiros Barros

clear;
clc;
s=poly(0,'s');
Kc = 1;
z = 0.20;

// Funcoes de transferencia
g_ma = 2/(s + 0.25);
g_c = Kc*(s+z)/s;
g_c_ma = g_c * g_ma;
g_mf = g_ma/(1+g_ma);
g_c_mf = g_c * g_ma / (1 + g_c * g_ma);

// Análise da função de transferência
coeff(denom(g_c_mf))
Wn = sqrt(ans(1))
Xi = ans(2)/(2*Wn)

// Simulacao
Ts = 0.1;
sist_k_ma = dscr(tf2ss(syslin('c',g_ma)),Ts);
sist_k_mf = dscr(tf2ss(syslin('c',g_mf)),Ts);
sist_k_c_mf = dscr(tf2ss(syslin('c',g_c_mf)),Ts);
u=ones(1,200);
t=u;
t0 = 0;
for i=1:length(u)
  t(i) = t0;
  t0 = t0 + Ts;  
end
y_ma=dsimul(sist_k_ma,u);
y_mf=dsimul(sist_k_mf,u);
y_c_mf=dsimul(sist_k_c_mf,u);

// Figuras
plot(t,y_ma); xs2jpg(gcf(), "imgs/questao4/saida_ma.jpg");close();
plot(t,y_mf); xs2jpg(gcf(), "imgs/questao4/saida_mf.jpg");close();
plot(t,y_c_mf); xs2jpg(gcf(), "imgs/questao4/saida_comp_mf.jpg");close();
evans(g_ma, 2); xs2jpg(gcf(), "imgs/questao4/rlocus_ma.jpg");close();
evans(g_c_ma, 2); xs2jpg(gcf(), "imgs/questao4/rlocus_cma.jpg");close();

//exit

