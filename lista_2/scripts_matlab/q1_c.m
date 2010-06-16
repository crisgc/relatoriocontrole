% Universidade Federal do Rio Grande do Norte
% Programa de Pos-Graduacao em Engenharia Eletrica e de Computacao
% Lista 2 - Questao 1 - C
% Autores: Anna Giselle Camara Dantas Ribeiro
%          Cristiano Gurgel de Castro
%          Diogo Leite Reboucas
%          Thiago Medeiros Barros

clear all;
close all;
clc;

% Funcao de transferencia do sistema em Laplace
Gs = tf( [0.5], [1 1.5 0.5] );

% Periodo de amostragem
T = 0.2;

% Metodo de aproximacao
metodo = 'zoh';

% Funcao de transferencia do sistema em Zadeh
Gz = c2d( Gs, T, metodo );

% Numero de coeficientes
N = 25;

% Saida do sistema para a resposta ao degrau
saida = step( Gz, N );

% Coeficientes (Valores dos H's)
h = saida( 2:N );

% Os valores de delta_u existirao somente para a primeiro coeficiente 'h',
% pois a diferenca u(k) - u(k-1) = 0 para os demais coeficientes, conforme
% explicado no texto
delta_u = [ 1 ; zeros( N - 1, 1 ) ];

y = zeros( N, 1 );

for k = 1 : N
    soma = 0;
    
    for i = 1 : N
        if ( k - i ) > 0
            soma = soma + h(i) * delta_u( k - i );
        else
            break;
        end
    end
    
    y(k) = soma;
end

% Entrada degrau unitario
u = ones( N, 1 );

% Determinando a saida de acordo com:
% y_chapeu(k) =  1.7235*y_chapeu(k-1) - 0.7408*y_chapeu(k-2) + 
%                0.0091*u(k-1) + 0.0082*u(k-2)
y_chapeu = zeros( N, 1 );
y_chapeu( 1 ) = 0;
y_chapeu( 2 ) = 0;

for k = 3 : N
    y_chapeu(k) = 1.7235*y_chapeu(k-1) - 0.7408*y_chapeu(k-2) + ...
                  0.0091*u(k-1) + 0.0082*u(k-2);
end

figure;

subplot( 2, 1, 1 );
grid on;
hold on;
plot( y_chapeu, 'ko-' );
plot( y, 'r' );
legend( 'Planta', 'FSR' );
ylabel( 'Saida' );
xlabel( 'Amostras' );

subplot( 2, 1, 2 );
plot( abs( y_chapeu - y ), 'k' );
ylabel( 'Erro' );
xlabel( 'Amostras' );