% Programa para la caracterización de un sensor de alturas en una copa
% Medidas e instruemntación 
%Juan Jose Londoño Cardenas
% Docente Medidas e instrumentacion 2023-II
%09/09/2023
clc; close all; clear all;
format long;
Fre=[];
Fre2=[];
% rootdirectory = '"C:\Users\USER\Desktop\Sensor de altura\Audios_modelo"';

for i=0:10:100
for j=1:3
    Nombre=strcat(num2str(i),'_-',num2str(j),'subiendo.m4a');
    [y,Fs] = audioread(Nombre);
    sound(y,Fs)
    N = length(y);
    dtt = 1/Fs;
    Tmax = dtt * N - dtt;
    tt = 0:dtt:Tmax;
    df = Fs / (N);
    Fmax = df * (N/2) - df;
    frec = 0:df:Fmax;
    salida=abs(fft(y));
    S=salida(1:floor(N/2));
    r=S*(2/N);
    [y1,x1] = max(r);
    frecuencia=frec(x1);
    Fre=[Fre;frecuencia];
end
end

for i=0:10:100
for j=1:3
    Nombre=strcat(num2str(i),'_-',num2str(j),'bajando.m4a');
    [y,Fs] = audioread(Nombre);
    sound(y,Fs)
    N = length(y);
    dtt = 1/Fs;
    Tmax = dtt * N - dtt;
    tt = 0:dtt:Tmax;
    df = Fs / (N);
    Fmax = df * (N/2) - df;
    frec = 0:df:Fmax;
    salida=abs(fft(y));
    S=salida(1:floor(N/2));
    r=S*(2/N);
    [y1,x1] = max(r);
    frecuencia=frec(x1);
    Fre2=[Fre2;frecuencia];
end
end


cero=[Fre(1) Fre(2) Fre(3) Fre2(1) Fre2(2) Fre2(3)];
diez=[Fre(4) Fre(5) Fre(6) Fre2(4) Fre2(5) Fre2(6)];
veinte=[Fre(7) Fre(8) Fre(9) Fre2(7) Fre2(8) Fre2(9)];
treinta=[Fre(10) Fre(11) Fre(12) Fre2(10) Fre2(11) Fre2(12)];
cuarenta=[Fre(13) Fre(14) Fre(15) Fre2(13) Fre2(14) Fre2(15)];
cincuenta=[Fre(16) Fre(17) Fre(18) Fre2(16) Fre2(17) Fre2(18)];
sesenta=[Fre(19) Fre(20) Fre(21) Fre2(19) Fre2(20) Fre2(21)];
setenta=[Fre(22) Fre(23) Fre(24) Fre2(22) Fre2(23) Fre2(24)];
ochenta=[Fre(25) Fre(26) Fre(27) Fre2(25) Fre2(26) Fre2(27)];
noventa=[Fre(28) Fre(29) Fre(30) Fre2(28) Fre2(29) Fre2(30)];
cien=[Fre(31) Fre(32) Fre(33) Fre2(31) Fre2(32) Fre2(33)];

cerom=mean(cero); % media de 0
cerod=std(cero); % desviación de 0
diezm=mean(diez);
diezd=std(diez);
veintem=mean(veinte);
veinted=std(veinte);
treintam=mean(treinta);
treintad=std(treinta);
cuarentam=mean(cuarenta);
cuarentad=std(cuarenta);
cincuentam=mean(cincuenta);
cincuentad=std(cincuenta);
sesentam=mean(sesenta);
sesentad=std(sesenta);
setentam=mean(setenta);
setentad=std(setenta);
ochentam=mean(ochenta);
ochentad=std(ochenta);
noventam=mean(noventa);
noventad=std(noventa);
cienm=mean(cien);
ciend=std(cien);

Fdm=[cerom diezm veintem treintam cuarentam cincuentam sesentam setentam ochentam noventam cienm];
Fdd=[cerod diezd veinted treintad cuarentad cincuentad sesentad setentad ochentad noventad ciend];
H=[0 10 20 30 40 50 60 70 80 90 100];
disp(Fdm)
figure(2);
stem(H,Fdd)
xlabel('Muestras [n]')
ylabel('Desviación [Hz]')
title('Desviación de las frecuencias')

figure(1);
stem(H,Fdm)
xlabel('Muestras [n]')
ylabel('Frecuencia Media [Hz]')
title('Media de las frecuencias')
ylim([300 800])


% Se construye mínimos cuadrados
unos=ones(1,11);
disp("Matriz H")
disp(H)
A=[Fdm; Fdm.^2; unos];
disp(A)
% Moore-Penrose
Aa=pinv(A);
disp("Matriz A")
disp(Aa)
format long;
X=H*Aa;
disp(X)
A=(X(1));
B=(X(2));
C=(X(3));
% Valores para el Modelo
disp(A)
disp(B)
disp(C)
%% GUARDAR MODELO
save('Modelo.mat','A','B','C','H','Fdm','Fdd')
%%
fprintf('Altura    Frecuencia(Hz)\n')
for i=1:11
   fprintf('%5d      %.2f\n',H(i),Fdm(i));
end



