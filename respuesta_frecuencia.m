clear all
close all
clc


% Audio de barrido de 50Hz a 50kHz

%audio_1 = 'grabacion_audio_laptop.wav'; 
audio_1 = 'grabacion_audio_celular.wav'; 
[audio, fs] = audioread(audio_1);

% Muestra 
inicio_muestra = 90000; 
fin_muestra = 160000; 
puntos_muestra = inicio_muestra:fin_muestra;

muestra_audio = audio(inicio_muestra:fin_muestra);
N = length(muestra_audio);

% Respuesta en frecuencia
trans_fourier = fft(muestra_audio);
eje_frecuencia = linspace(0, fs, N);



% Visualización de la señal en el dominio del tiempo
subplot(2,1,1);
plot(puntos_muestra, muestra_audio);
xlabel('Tiempo (s)');
ylabel('Amplitud');
title('Señal en el Dominio del Tiempo');

% Visualización del espectro de amplitud
subplot(2,1,2);
plot(eje_frecuencia, abs(trans_fourier));
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');
title('Espectro de Amplitud');
xlim([0, fs/2]); 


