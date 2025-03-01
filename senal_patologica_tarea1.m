%%% Señal Sintética Patológica

clear all;
close all;
clc

fs = 1000; % Frecuencia de muestreo (Hz)
d = 2; % Duración en segundos
t = 0:1/fs:d; % Vector de tiempo

% Parámetros de la señal patológica
A = 10; % Mayor amplitud para representar actividad anormal
f_base = 40; % Frecuencia base aumentada para simular espasmos o fibrilaciones
ruido = 0.2; % Mayor ruido para reflejar actividad irregular

% Señal base con actividad rápida y más ruido
EMG = A * sin(2 * pi * f_base * t) + ruido * randn(1, length(t));

% Introducir picos aleatorios que simulan descargas musculares
ev = 5; % Número de eventos bruscos
sd = 0.05; % Eventos más cortos

for i = 1:ev
    inxI = randi([1, length(t) - 200]); % Inicio aleatorio sin salir del rango
    inxF = inxI + 200; % Duración de evento
    act = t(inxI:inxF);
    
    env = exp(-((act - act(1)).^2) / (2 * sd^2)); % Envolvente más aguda
    spikes = 5 * randn(1, length(act)); % Descargas más fuertes
    EMG(inxI:inxF) = EMG(inxI:inxF) + A * env + spikes;
end

% Filtrar señal, pero permitiendo más actividad de alta frecuencia
fc = 100; % Aumentamos frecuencia de corte para preservar detalles patológicos
[b, a] = butter(4, fc / (fs / 2), 'low'); 
EMG_filtrada = filtfilt(b, a, EMG);

% Visualización de la señal
figure, plot(t, EMG_filtrada, 'r', 'LineWidth', 1.5)
title('Señal EMG Patológica')
xlabel('Tiempo (s)')
ylabel('Amplitud')
grid on

