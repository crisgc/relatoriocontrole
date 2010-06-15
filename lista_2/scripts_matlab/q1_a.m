% Universidade Federal do Rio Grande do Norte
% Programa de Pos-Graduacao em Engenharia Eletrica e de Computacao
% Lista 2 - Questao 1 - A
% Autores: Anna Giselle Camara Dantas Ribeiro
%          Cristiano Gurgel de Castro
%          Diogo Leite Reboucas
%          Thiago Medeiros Barros

clear;
clc;

% Funcao de transferencia do sistema em Laplace
Gs = tf( [0.5], [1 1.5 0.5] );

% Periodo de amostragem
T = 0.2;

% Metodo de aproximacao
metodo = 'zoh';

% Funcao de transferencia do sistema em Zadeh
Gz = c2d( Gs, T, metodo )