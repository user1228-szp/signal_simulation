%%% Señal Sintética Patológica

clear all;
close all;
clc

fs = 1000; 
d = 2;
t = 0:1/fs:d; 

% Parámetros de la señal patológica
A = 10; 
f_base = 40;
ruido = 0.2; 

% Señal base con actividad rápida y más ruido
EMG = A * sin(2 * pi * f_base * t) + ruido * randn(1, length(t));

% Introducir picos aleatorios que simulan descargas musculares
ev = 5; 
sd = 0.05;

for i = 1:ev
    inxI = randi([1, length(t) - 200]); % Inicio aleatorio 
    inxF = inxI + 200; % Duración de evento
    act = t(inxI:inxF);
    
    env = exp(-((act - act(1)).^2) / (2 * sd^2)); % Envolvente más aguda
    spikes = 5 * randn(1, length(act)); 
    EMG(inxI:inxF) = EMG(inxI:inxF) + A * env + spikes;
end

% Filtrar señal, pero permitiendo más actividad de alta frecuencia
fc = 100;
[b, a] = butter(4, fc / (fs / 2), 'low'); 
EMG_filtrada = filtfilt(b, a, EMG);

% Visualización de la señal
figure, plot(t, EMG_filtrada, 'r', 'LineWidth', 1.5)
title('Señal EMG Patológica')
xlabel('Tiempo (s)')
ylabel('Amplitud')
grid on

