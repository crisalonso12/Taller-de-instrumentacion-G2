clear all
close all
clc

% Audio del tono de 1kHz
%audio_1 = 'tono1kHz_laptop.wav'; 
audio_1 = 'tono1kHz_celular.wav'; 
[audio, frecuencia_muestreo] = audioread(audio_1);

% Audio de ruido
audio_2 = 'ruido_ambiente.wav';
[audio2, frecuencia_muestreo2] = audioread(audio_2);

%
inicio_muestra = 70000; % inicio de la muestra
fin_muestra = 75000; % fin de la muestra
puntos_muestra = inicio_muestra:fin_muestra;

% Muestra del audio
muestra_audio = audio(puntos_muestra);

% Amplitud de la muestra
amplitud_muestra = max(muestra_audio) - min(muestra_audio);

% Potencia de la muestra
potencia_audio = ((amplitud_muestra/sqrt(2))^2) / 2;

% Desviación estándar del ruido
desviacion_estandar_ruido = std(audio2);

%SNR
SNR = 10 * log10(potencia_audio / desviacion_estandar_ruido);


% Mostrar resultados 
disp(['Amplitud de la muestra: ' num2str(amplitud_muestra)]);
disp(['Potencia del tono: ' num2str(potencia_audio) ' W']);
disp(['Desviación estándar: ' num2str(desviacion_estandar_ruido) ' ']);
disp(['SNR: ' num2str(SNR) ' dB']);


% Gráfica de la muestra
figure;
subplot(3, 1, 1);
plot(puntos_muestra, muestra_audio);
xlabel('Tiempo (muestras)');
ylabel('Amplitud');
title('Muestra de Audio');

% Gráfica del tono
subplot(3, 1, 2);
tiempo_audio = (0:length(audio)-1) / frecuencia_muestreo;
plot(tiempo_audio, audio);
xlabel('Tiempo (s)');
ylabel('Amplitud');
title('Grabación del tono 1kHz');

hold on; % Mantener el gráfico existente
line([tiempo_audio(inicio_muestra), tiempo_audio(inicio_muestra)], ylim, 'Color', 'r', 'LineStyle', '--');
line([tiempo_audio(fin_muestra), tiempo_audio(fin_muestra)], ylim, 'Color', 'r', 'LineStyle', '--');
hold off; % Dejar de sobreponer elementos al gráfico

% Gráfica de ruido
subplot(3, 1, 3); 
tiempo_audio2 = (0:length(audio2)-1) / frecuencia_muestreo2;
plot(tiempo_audio2, audio2);
xlabel('Tiempo (s)');
ylabel('Amplitud');
title('Grabación de ruido ambiente');

sgtitle('Análisis de Audio');



