%%%Señal sintetica sana

clear all;
close all;
clc

fs = 1000; % Frecuencia de muestreo (Hz)
d = 2; % Duración en segundos
t = 0:1/fs:d; % Vector de tiempo

% Parámetros de la señal sana
A = 5; % Amplitud reducida para señal en reposo
f_base = 10; % Frecuencia base más baja (actividad de fondo)
ruido = 0.03; % Ruido blanco reducido para mejor claridad

% Señal de fondo suave con oscilaciones de baja amplitud
EMG = A * sin(2 * pi * f_base * t) + ruido * randn(1, length(t));

% Filtrar señal para suavizarla
fc = 30; % Frecuencia de corte (Hz)
[b, a] = butter(4, fc / (fs / 2), 'low'); % Filtro pasa bajas
EMG_filtrada = filtfilt(b, a, EMG);

% Visualización de la señal
figure, plot(t, EMG_filtrada, 'b', 'LineWidth', 1.5)
title('Señal EMG Sana y Clara')
xlabel('Tiempo (s)')
ylabel('Amplitud')
grid on
