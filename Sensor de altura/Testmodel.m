clc;clear all; close all;
% cargar modelo
load('Modelo.mat')
% recuperar la señal desde el HDD
[y,Fs] = audioread('Random3.m4a');
sound(y,Fs)
% Número de muestras de la señal recuperada:
N = length(y);
dtt = 1/Fs;
Tmax = dtt * N - dtt;
figure(1)
tt = 0:dtt:Tmax;
plot(tt, y)

% graficar la magnitud de la FFT.
figure(2)
df = Fs / (N);
Fmax = df * (N/2) - df;
frec = 0:df:Fmax;
salida=abs(fft(y));
S=salida(1:floor(N/2));
r=S*(2/N);
plot(frec,r);
[y1,x1] = max(r);
Frecuen=frec(x1);
disp(Frecuen)
%Prueba del modelo adquirido

Altura=((B))*(Frecuen^2)+(((A)*Frecuen)+(C));
disp("Su altura es: ")
FDM=max(Fdd);
% FDM=mean(Fdd);
De=sqrt((((Altura*2*FDM)/Frecuen)^2)+(A^2*FDM^2)+(2*A*B*FDM));
Resul=strcat(num2str(Altura),' ±',{' '},num2str(De));
disp(Resul)
