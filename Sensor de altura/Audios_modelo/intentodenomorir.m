clc;clear all; close all;

% recuperar la senal desde el HDD
[y,Fs] = audioread('90_-2subiendo.m4a');
sound(y,Fs)

% Numero de Muestras de la signal recuperda:
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
frecuencia=frec(x1);
disp(frecuencia)
