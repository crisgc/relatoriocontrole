% Universidade Federal do Rio Grande do Norte
% Programa de Pos-Graduacao em Engenharia Eletrica e de Computacao
% Controle Avancado
% Projeto do controlador PI para a questao 4 da lista 1
% Autores:
%        Anna Giselle Camara Dantas Ribeiro
%        Cristiano Gurgel de Castro
%        Diogo Leite Reboucas
%        Thiago Medeiros Barros



%% Definições
clear;
clc;
Kc = 1;
z = 0.20;

%% Funcoes de transferencia
s = tf('s');
g_ma = 2/(s+0.25);
g_c = Kc * (s+z)/s;
g_c_ma = series(g_c, g_ma);
g_mf = feedback(g_ma,1);
g_c_mf = feedback(g_c_ma, 1);

% g_ma_delay = series(g_ma, exp(-s));
% g_c_ma_delay = series(g_c, g_ma_delay);
% g_c_mf_delay = feedback(ss(g_c_ma_delay), 1);
%% Análise da função de transferência
[num, den] = tfdata(g_c_mf, 'v');
Wn = sqrt(den(3));
Xi = den(2)/(2*Wn);

%% Simulacao
step(g_ma);
print -depsc ../../imgs/questao4/saida_ma.eps
step(g_mf);
print -depsc ../../imgs/questao4/saida_mf.eps
step(g_c_mf);
print -depsc ../../imgs/questao4/saida_comp_mf.eps
rlocus(g_ma);
print -depsc ../../imgs/questao4/rlocus_ma.jpg.eps
rlocus(g_c_ma);
print -depsc ../../imgs/questao4/rlocus_cma.jpg.eps
