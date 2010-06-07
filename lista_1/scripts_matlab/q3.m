% Universidade Federal do Rio Grande do Norte
% Programa de Pos-Graduacao em Engenharia Eletrica e de Computacao
% Lista 1 - Questao 3
% Autores: Anna Giselle Camara Dantas Ribeiro
%          Cristiano Gurgel de Castro
%          Diogo Leite Reboucas
%          Thiago Medeiros Barros

clear;
clc;

a = 1;
b = 1;
c = 1;

a_m = 2;
b_m = 1;
c_m = 1;

gammas = [0.1 0.2 0.5 0.7 1.0];
cores = [ 'b', 'g', 'r', 'c', 'm' ];

periodo_ref = 200;
tempo_simulacao = 1000;

tam = length( gammas );

% Guardando as saidas
saidas = cell( tam, 1 );

for i = 1 : tam
    gamma = gammas( i );
    
    open( 'q3_simulacao' );
    sim( 'q3_simulacao' );
    
    saidas{i} = saida;
end

% Plot das saidas
for i = 1 : tam
    figure;    
    
    % Referencia + Saida
    subplot( 3, 1, 1 );
    ylabel( 'Saida' );
    hold on;
    grid on;
    plot( saidas{i}( :, 1 ), saidas{i}( :, 4 ), 'k--' );
    plot( saidas{i}( :, 1 ), saidas{i}( :, 3 ), 'b' );
    legend( 'Referencia', 'Saida' );
    
    % Erro + Sinal de Controle
    subplot( 3, 1, 2 );
    ylabel( 'Erro / Sinal de Controle' );
    hold on;
    grid on;
    plot( saidas{i}( :, 1 ), saidas{i}( :, 2 ), 'r' );
    plot( saidas{i}( :, 1 ), saidas{i}( :, 5 ), 'b' );
    legend( 'Erro', 'Sinal de Controle' );
    
    % Evolucao Theta
    subplot( 3, 1, 3 );
    ylabel( 'Valores de \theta' );
    hold on;
    grid on;
    plot( saidas{i}( :, 1 ), saidas{i}( :, 6 ), 'r' );
    plot( saidas{i}( :, 1 ), saidas{i}( :, 7 ), 'g' );
    plot( saidas{i}( :, 1 ), saidas{i}( :, 8 ), 'b' );
    legend( '\theta_1', '\theta_2', '\theta_3' );
end