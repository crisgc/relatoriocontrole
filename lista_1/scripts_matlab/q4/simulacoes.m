% Universidade Federal do Rio Grande do Norte
% Programa de Pos-Graduacao em Engenharia Eletrica e de Computacao
% Controle Avancado
% Projeto do controlador PI para a questao 4 da lista 1
% Autores:
%        Anna Giselle Camara Dantas Ribeiro
%        Cristiano Gurgel de Castro
%        Diogo Leite Reboucas
%        Thiago Medeiros Barros

%% Limpando o workspace
clear;
clc;
Tf = 10;

%% PI controlando sistema com atraso
sim('sist_cont_dt.mdl', Tf);
plot(tout, [ref y_c_delay]);
xlabel('tempo');
legend( 'Referencia', 'Saida' )
print -depsc ../../imgs/questao4/saida_cont_dt.eps
set_param('sist_cont_dt', 'PaperOrientation', 'portrait');
print -ssist_cont_dt -depsc ../../imgs/questao4/sist_cont_dt.eps

%% PI com preditor de Smith
sim('sist_cont_dt_smith.mdl', Tf);
plot(tout, [ref y_smith]);
xlabel('tempo');
legend( 'Referencia', 'Saida' )
print -depsc ../../imgs/questao4/saida_smith.eps
set_param('sist_cont_dt_smith', 'PaperOrientation', 'portrait');
print -ssist_cont_dt_smith -depsc ../../imgs/questao4/sist_smith.eps

%% PI com preditor de Smith com funcao de transferencia nao-exata
sim('sist_cont_dt_smith_diff.mdl', Tf);
plot(tout, [ref y_smith_diff]);
xlabel('tempo');
legend( 'Referencia', 'Saida' )
print -depsc ../../imgs/questao4/saida_smith_diff.eps
set_param('sist_cont_dt_smith_diff', 'PaperOrientation', 'portrait');
print -ssist_cont_dt_smith_diff -depsc ../../imgs/questao4/sist_smith_diff.eps

%% Ruido sem o controle FF
sim('sist_noise.mdl', Tf);
plot(tout, [ref y_noise]);
xlabel('tempo');
legend( 'Referencia', 'Saida' )
print -depsc ../../imgs/questao4/saida_ruido.eps
set_param('sist_noise', 'PaperOrientation', 'portrait');
print -ssist_noise -depsc ../../imgs/questao4/sist_ruido.eps

%% Ruido com o controle FF (filtro 1/(s+1))
sim('noise_comp1.mdl', Tf);
plot(tout, [ref y_noise1]);
xlabel('tempo');
legend( 'Referencia', 'Saida' )
print -depsc ../../imgs/questao4/saida_ruido_ff1.eps
set_param('noise_comp1', 'PaperOrientation', 'portrait');
print -snoise_comp1 -depsc ../../imgs/questao4/sist_ruido_ff1.eps

%% Ruido com o controle FF (filtro 10/(s+10))
sim('sist_noise_comp.mdl', Tf);
plot(tout, [ref y_noise2]);
xlabel('tempo');
legend( 'Referencia', 'Saida' )
print -depsc ../../imgs/questao4/saida_ruido_ff2.eps
set_param('sist_noise_comp', 'PaperOrientation', 'portrait');
print -ssist_noise_comp -depsc ../../imgs/questao4/sist_ruido_ff2.eps
