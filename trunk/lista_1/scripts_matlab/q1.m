% Universidade Federal do Rio Grande do Norte
% Programa de Pos-Graduacao em Engenharia Eletrica e de Computacao
% Lista 1 - Questao 1
% Autores: Anna Giselle Camara Dantas Ribeiro
%          Cristiano Gurgel de Castro
%          Diogo Leite Reboucas
%          Thiago Medeiros Barros

clear;
clc;

p = [ 1 2 3 4 5 ];
tam = length( p );

% Malha aberta
figure;
hold on;

MGma = zeros( 1, tam );
MFma = zeros( 1, tam );
WGma = zeros( 1, tam );
WFma = zeros( 1, tam );

for i = 1 : tam
    Gma(i) = tf( [9], [1 p(i) 0] );
    margin( Gma(i) ); % Somente para o plot
    [MGma(i) MFma(i) WGma(i) WFma(i)] = margin( Gma(i) );
end

legend( 'p = 1', 'p = 2', 'p = 3', 'p = 4', 'p = 5' );

% Malha fechada
figure;
hold on;

for i = 1 : tam
    Gmf(i) = tf( [9], [1 p(i) 9] );
    bodeplot( Gmf(i) );
end

grid on;
legend( 'p = 1', 'p = 2', 'p = 3', 'p = 4', 'p = 5' );

% Resposta ao degrau
figure;
hold on;

for i = 1 : tam
    step( Gmf(i) );
end

legend( 'p = 1', 'p = 2', 'p = 3', 'p = 4', 'p = 5' );

% Sensibilidade
figure;
hold on;

for i = 1 : tam
    Gsensib(i) = tf( [-p(i) 0], [1 p(i) 9] );
    bodeplot( Gsensib(i) );
end

grid on;
legend( 'p = 1', 'p = 2', 'p = 3', 'p = 4', 'p = 5' );
