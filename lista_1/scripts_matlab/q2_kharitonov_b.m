% Universidade Federal do Rio Grande do Norte
% Programa de Pos-Graduacao em Engenharia Eletrica e de Computacao
% Lista 1 - Questao 2 - Teste Kharitonov B
% Autores: Anna Giselle Camara Dantas Ribeiro
%          Cristiano Gurgel de Castro
%          Diogo Leite Reboucas
%          Thiago Medeiros Barros

clear;
clc;

Zc = 0.3;
Pc = 0.0022;
Kc = 20;

% Limite para a0
alpha0 = Zc;
beta0 = 2*Zc + 5*Pc;

% Limite para a1
alpha1 = 3*Pc + Kc*(Zc + 1);
beta1 = Kc*(Zc + 2) + 6*Pc + 5;

% Limite para a2
alpha2 = Kc + Pc  + 4;
beta2 = Kc + Pc + 6;

% Limite para a3
alpha3 = 1;
beta3 = 1;

% Polinomios de Karithonov
r1 = roots( [alpha0 alpha1 beta2 beta3] );
r2 = roots( [alpha0 beta1 beta2 alpha3] );
r3 = roots( [beta0 alpha1 alpha2 beta3] );
r4 = roots( [beta0 beta1 alpha2 alpha3] );

disp( 'Raizes expostas nas colunas da matriz' );

M = [r1 r2 r3 r4]