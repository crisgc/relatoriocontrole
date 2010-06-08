% Universidade Federal do Rio Grande do Norte
% Programa de Pos-Graduacao em Engenharia Eletrica e de Computacao
% Lista 1 - Questao 2 - Simulacoes / LGR
% Autores: Anna Giselle Camara Dantas Ribeiro
%          Cristiano Gurgel de Castro
%          Diogo Leite Reboucas
%          Thiago Medeiros Barros

clear;
clc;

p = 4;
q = 0.5;
r = 1.5;

% Malha aberta
g_ma = tf( [1 r], [1 (p+q) p*q] );

figure;
step( g_ma );
grid on;

figure;
rlocus( g_ma );

% Malha fechada
g_mf = g_ma / ( 1 + g_ma );

figure;
step( g_mf );
grid on;

figure;
rlocus( g_mf );

% Compensador 1
Kc1 = 1;
Zc1 = 0.3;
Pc1 = 0.0022;

H_c1 = Kc1 * tf( [1 Zc1], [1 Pc1] );

g_ma_comp1 = H_c1 * g_ma;
g_mf_comp1 = g_ma_comp1 / ( 1 + g_ma_comp1 );

figure;
step( g_mf_comp1 );
grid on;

figure;
rlocus( g_mf_comp1 );

% Compensador 2
Kc2 = 20;
Zc2 = 0.3;
Pc2 = 0.0022;

H_c2 = Kc2 * tf( [1 Zc2], [1 Pc2] );

g_ma_comp2 = H_c2 * g_ma;
g_mf_comp2 = g_ma_comp2 / ( 1 + g_ma_comp2 );

figure;
step( g_mf_comp2 );
grid on;

figure;
rlocus( g_mf_comp2 );