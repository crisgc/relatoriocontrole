// UFRN - CT - DCA
// Controle Avan�ado
// Simula��o dos sistemas
// Autor: Cristiano Gurgel de Castro <crisgc@dca.ufrn.br>

clear;
clc;
s=poly(0,'s');
p = 4;
q = 0.5;
r = 1.5;
Kc = 20;
Zc = 0.3;
Pc = 0.0022;

// Fun��es de transfer�ncia
H1=(s+r)/((s+p)*(s+q));
g_ma = syslin('c', H1)
H2 = H1/(H1+1);
g_mf = syslin('c', H2)
H_c = Kc*(s+Zc)/(s+Pc)
H_comp = (H_c*H1) / (1 + H_c*H1);
g_comp = syslin('c', H_comp)

g_comp_ma = syslin('c', H_c*H1);

// simula��o
Ts = 0.1;
gk_mf = dscr(tf2ss(g_mf),Ts);
gk_comp = dscr(tf2ss(g_comp),Ts);
u=ones(1,200);
t=u;
t0 = 0;
for i=1:length(u)
  t(i) = t0;
  t0 = t0 + Ts;  
end
x1=dsimul(gk_mf,u);
x2=dsimul(gk_comp,u);
figure("BackgroundColor", [1 1 1]);plot(t,x1);
figure("BackgroundColor", [1 1 1]);plot(t,x2);
//
figure("BackgroundColor", [1 1 1]);evans(g_ma, 20);
//figure();evans(g_comp_ma, 3);
//figure();bode(g_comp_ma);

//halt("Pressione para fechar as figuras")

