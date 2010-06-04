// UFRN - CT - Controle Avançado
// Lista 1 - Questão 2
// Teste de Kharitonov para controlador em atraso
// Autor: Cristiano Gurgel de Castro <crisgc@dca.ufrn.br>

clc;
clear;

Zc = 0.9;
Pc = 0.007;

// Limites para a0
alpha0 = Zc;
beta0 = 2*Zc + 5*Pc;

// Limites para a1
alpha1 = 3*Pc + Zc + 1;
beta1 = 6*Pc + Zc + 1;

// Limites para a2
alpha2 = Pc + 4;
beta2 = Pc + 7;

// Limites para a3
alpha3 = 1;
beta3 = 1;

// Polinômios de Karithonov
q1 = poly([alpha0 alpha1 beta2 beta3], "s", "coeff")
q2 = poly([alpha0 beta1 beta2 alpha3], "s", "coeff")
q3 = poly([beta0 alpha1 alpha2 beta3], "s", "coeff")
q4 = poly([beta0 beta1 alpha2 alpha3], "s", "coeff")

roots(q1)
roots(q2)
roots(q3)
roots(q4)

