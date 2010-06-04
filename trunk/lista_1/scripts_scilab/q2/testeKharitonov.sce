// Universidade Federal do Rio Grande do Norte
// Programa de Pos-Graduacao em Engenharia Eletrica e de Computacao
// Controle Avancado
// Teste dos polinomios de Karitonov para controlador em atraso
// Autores:
//        Anna Giselle Camara Dantas Ribeiro
//        Cristiano Gurgel de Castro
//        Diogo Leite Reboucas
//        Thiago Medeiros Barros
Zc = 0.3;
Pc = 0.0022;
Kc = 1;

// Limite para a0
alpha0 = Zc;
beta0 = 2*Zc + 5*Pc;
// Limite para a1
alpha1 = 3*Pc + Kc*(Zc + 1);
beta1 = Kc*(Zc + 2) + 6*Pc + 5;
// Limite para a2
alpha2 = Kc + Pc  + 4;
beta2 = Kc + Pc + 6;
// Limite para a3
alpha3 = 1;
beta3 = 1;

q1 = poly([alpha0 alpha1 beta2 beta3], "s", "coeff");
q2 = poly([alpha0 beta1 beta2 alpha3], "s", "coeff");
q3 = poly([beta0 alpha1 alpha2 beta3], "s", "coeff");
q4 = poly([beta0 beta1 alpha2 alpha3], "s", "coeff");

result = [roots(q1) roots(q2) roots(q3) roots(q4)]
prettyprint(result)
