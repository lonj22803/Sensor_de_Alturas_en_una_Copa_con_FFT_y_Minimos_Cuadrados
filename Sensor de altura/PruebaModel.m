% Prueba del modelo adquirido
clc; clear all; close all;
load('Modelo.mat')
prompt=("Ingrese la frecuencia para conocer su altura:  ");
Frecuen=input(prompt);
Altura=((B))*(Frecuen^2)+(((A)*Frecuen)+(C));
disp("Su altura es")
% FDM=max(Fdd);
FDM=mean(Fdd);
De=sqrt((((Altura*2*FDM)/Frecuen)^2)+(A^2*FDM^2)+(2*A*B*FDM));
Resul=strcat(num2str(Altura),' ±',{' '},num2str(De));
disp(Resul)
figure(3)
plot(H,Fdm)
hold on
scatter(Altura,Frecuen)
xlabel('Muestras [n]')
ylabel('Frecuencia Media [Hz]')
title('Media de las frecuencias')
ylim([300 800])
grid on
hold off