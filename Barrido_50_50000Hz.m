clear all
close all
clc

% Parámetros del barrido
fs = 44100; % Frecuencia de muestreo en Hz
t2 = 10; % Duración en segundos
t = 0:1/fs:t2; % Vector de tiempo


f1 = 50; % Frecuencia inicial en Hz
f2 = 50000; % Frecuencia final en Hz

% Genera el barrido sinusoidal en frecuencia
y = chirp(t, f1, t2, f2);

% Grafica el barrido sinusoidal en frecuencia
figure;
plot(t, y);
xlabel('Tiempo (s)');
ylabel('Amplitud');
title('Barrido Sinusoidal en Frecuencia de 50 Hz a 50kHz');
grid on;

% Reproduce el barrido como audio
sound(y, fs);

% Espera a que termine de reproducirse antes de continuar
pause(t2);

% Guarda el audio generado como archivo WAV
audiowrite('barrido_audio.wav', y, fs);
disp('Audio guardado como "barrido_audio.wav"');

