// Universidade Federal do Rio Grande do Norte
// Programa de Pos-Graduacao em Engenharia Eletrica e de Computacao
// Controle Avancado
// Simulacao dos sistemas e analise do lugar das raizes
// Autores:
//        Anna Giselle Camara Dantas Ribeiro
//        Cristiano Gurgel de Castro
//        Diogo Leite Reboucas
//        Thiago Medeiros Barros

clear;
clc;
s=poly(0,'s');
p = 4;
q = 0.5;
r = 1.5;

// Funcoes de transferencia
H1=(s+r)/((s+p)*(s+q));
g_ma = syslin('c', H1)
H2 = H1/(H1+1);
g_mf = syslin('c', H2)

// Compensadores
Kc1 = 1;
Zc1 = 0.3;
Pc1 = 0.0022;
H_c1 = Kc1*(s+Zc1)/(s+Pc1)
H_comp1 = (H_c1*H1) / (1 + H_c1*H1);
g_comp1 = syslin('c', H_comp1);
g_comp1_ma = syslin('c', H_c1*H1);

Kc2 = 20;
Zc2 = 0.3;
Pc2 = 0.0022;
H_c2 = Kc2*(s+Zc2)/(s+Pc2)
H_comp2 = (H_c2*H1) / (1 + H_c2*H1);
g_comp2 = syslin('c', H_comp2)
g_comp2_ma = syslin('c', H_c2*H1);

// simulacao
Ts = 0.1;
gk_ma = dscr(tf2ss(g_ma),Ts)
gk_mf = dscr(tf2ss(g_mf),Ts);
gk_comp1 = dscr(tf2ss(g_comp1),Ts);
gk_comp2 = dscr(tf2ss(g_comp2),Ts);
u=ones(1,200);
t=u;
t0 = 0;
for i=1:length(u)
  t(i) = t0;
  t0 = t0 + Ts;  
end
x0=dsimul(gk_ma,u);
x1=dsimul(gk_mf,u);
x2=dsimul(gk_comp1,u);
x3=dsimul(gk_comp2,u);

figure("BackgroundColor", [1 1 1]);plot(t,x0);
xs2eps(gcf(),"imgs/questao2/resposta_gma.eps");close();
figure("BackgroundColor", [1 1 1]);plot(t,x1);
xs2eps(gcf(),"imgs/questao2/resposta_gmf.eps");close();
figure("BackgroundColor", [1 1 1]);plot(t,x2);
xs2eps(gcf(),"imgs/questao2/resposta_gcomp1.eps");close();
figure("BackgroundColor", [1 1 1]);plot(t,x3)
;xs2eps(gcf(),"imgs/questao2/resposta_gcomp2.eps");close();
figure("BackgroundColor", [1 1 1]);evans(g_ma, 20);
xs2eps(gcf(),"imgs/questao2/rlocus_gma.eps");close();
figure("BackgroundColor", [1 1 1]);evans(g_comp1_ma, 3);
xs2eps(gcf(),"imgs/questao2/rlocus_gcma.eps");close();
