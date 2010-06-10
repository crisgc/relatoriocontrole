% Universidade Federal do Rio Grande do Norte
% Programa de Pos-Graduacao em Engenharia Eletrica e de Computacao
% Lista 2 - Questao 2
% Autores: Anna Giselle Camara Dantas Ribeiro
%          Cristiano Gurgel de Castro
%          Diogo Leite Reboucas
%          Thiago Medeiros Barros

clear;
clc;

% Numero de amostras
N = 100;

% Definindo os vetores de entrada/saida
y = zeros( N, 1 );
y_est = zeros( N, 1 );
u = zeros( N, 1 );

% Condicoes iniciais
y(1) = 0;
y(2) = 0;

y_est(1) = 0;
y_est(2) = 0;

u(1) = 1;
u(2) = 1;

% Parametros
a1 = -1.724;
a2 = 0.7408;
n = 2;

b1 = 0.00956;
b2 = 0.008194;
m = 2;

% Parametros com variacao
a1_tmp = a1;
a2_tmp = a2;
b1_tmp = b1;
b2_tmp = b2;

% Numero de vezes em que o sinal de controle ira variar (Ate 50% do numero
% de amostras)
num_var_sinal_cont = fix( random( 1, 0.5*N ) );
amostras_por_var_sinal_cont = fix( random( 1, 0.1*N ) );

% Valores de entrada
for k = 3 : N
    % Novos valores de entrada
    if mod( k, amostras_por_var_sinal_cont ) == 0
        u(k) = u(k-1) * random( 0.5, 1.5 );
    else
        u(k) = u(k-1);
    end
end     


% Numero de vezes em que os parametros irao variar (Ate 5% do numero de
% amostras)
num_variacoes = fix( random( 1, N * 0.05 ) );
amostras_por_variacao = fix( N / num_variacoes );

% Valores de saida
for k = 3 : N
    % Saida real
    y(k) = -a1*y(k-1) - a2*y(k-2) + b1*u(k-1) + b2*u(k-2);
    
    % Saida com variacao dos parametros
    if mod( k, amostras_por_variacao ) == 0
        a1_tmp = a1 * random( 0.9, 1.1 );
        a2_tmp = a2 * random( 0.9, 1.1 );
        b1_tmp = b1 * random( 0.9, 1.1 );
        b2_tmp = b2 * random( 0.9, 1.1 );
    end
            
    y_est(k) = -a1_tmp*y_est(k-1) - a2_tmp*y_est(k-2) + ...
               b1_tmp*u(k-1) + b2_tmp*u(k-2);
end

% Matriz X
X = [-y((2:N-1), 1) -y((1:N-n), 1) u((2:N-1), 1) u((1:N-m), 1)];
X_est = [ -y_est((2:N-1), 1) -y_est((1:N-n), 1) ...
          u((2:N-1), 1) u((1:N-m), 1)];

% Estimacao de theta
theta_est_real = inv( X'*X ) * X' * y((3:N), 1);
theta_est_variacao = inv( X_est'*X_est ) * X_est' * y_est((3:N), 1);

% Exibindo as saidas
figure;
grid on;
hold on;
plot( y, 'r' );
plot( y_est, 'b' );
plot( u, 'k' );
ylabel( 'Amplitude' );
xlabel( 'Amostra' );
title( 'Saida do sistema' )
legend( 'Parametros reais', 'Parametros variaveis', 'Sinal de controle' );

disp( 'Theta estimado com parametros reais' );
disp( theta_est_real );
disp( 'Theta estimado com parametros reais' );
disp( theta_est_variacao );