%dmc versao 2
%% definicao de parametros
%funcao de transferencia
h = tf(0.5,[1 1.5 0.5]);

%taxa de amostragem
td = 0.2;

%discretizacao da planta
plantaz = c2d(h, td);

%tamanho do truncamento do modelo FSR
N = 10;

%horizonte de predicao
NY = 5;

%horizonte de controle
NU = 5;

%lambda (penalizacao da var do sinal de controle)
lambda = 0.8;

%simular com o degrau e obter os h
y = step(plantaz, 2*N);

%truncamento da saida
y_truncado = y(2:N+1);

%matriz H da resposta forcada
Hf = get_matriz_h(y_truncado, NY, NU);

%matriz H da resposta livre
Hl = get_matriz_hl(y_truncado, NY, 0);

%identidade
I = eye(NU);

%amplitude da referencia
varef = 5;

%referencia
ref = [ones(100,1);ones(100,1)*varef;ones(100,1);ones(130,1)*varef]; %vetor com a referencia

%inicializando...
%sinal de controle
u  = 0;

%var do sinal de controle
du = zeros(N, 1);

%definindo a matriz K 
K = inv( Hf'*Hf+lambda*I )*Hf';

%% simulacao
for k=1:length(ref)-NY
    %saida real da planta
    if k <= 2
        ym(k) = 0;
    else
        ym(k) = saida_discretizada(k, ym, u);
    end
        
    %atualizando vetor de entradas passadas
    deltaUP =[];
    for j=1:(N-1)
        if (k-j)>0
            deltaUP = [deltaUP;du(k-j)];
        else
            deltaUP = [deltaUP;0];
        end
    end
         
    %saida livre
    yl = Hl*deltaUP + ym(k);
      
    %lei da variacao de controle
    du(k:k+NU-1) = K*(ref( k:k+NY-1 ) - yl);
   
    %controle
    if k == 1
        u(k) = du(k);
    else
        u(k) = u(k-1)+du(k);
    end

    %predicao: resposta livre + resposta forcada
    ypred(k+1:k+NY) = yl + Hf*du(k:k+NU-1);
    
end

x = 1:length(ref);
plot(1:length(ypred), ypred, '-r', 1:length(u), u, '-b', x, ref, 'k', 1:length(ym), ym, '-g');

% figure(5)
% t = 1:length(ym);
% plot(u,'r')
% hold on
% plot(ref,'b')
% hold on
% plot(ym,'k')
% [tt,uu] = stairs(t,u);
% [ttr,rr] = stairs(t,ref(1:length(t)));
% figure(4)
% plot(ttr,rr,'--',t,ym(1:length(t)))
% hold on
% plot(tt,uu,'k')
% title('saida da planta')
