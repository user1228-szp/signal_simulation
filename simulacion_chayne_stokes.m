clc;
clear;
close all;


fs = 100;              % Frec
T = 10;               
t = 0:1/fs:T;         % time

% Respiratory parameters
BPM = 15;             % Respiratory rate in cycles per minute   
f_resp = BPM / 60; 
ciclo = 10;       
apnea_dur = 5;    

sigma = ciclo / 6;  
mu = ciclo / 2;     
envolvente = exp(-((mod(t, ciclo) - mu).^2) / (2 * sigma^2));

respiracion = zeros(size(t));

for inicio = 0:(ciclo):T
    idx = (t >= inicio) & (t < inicio + ciclo);
    respiracion(idx) = envolvente(idx) .* sin(2 * pi * f_resp * (t(idx) - inicio));
end

apnea_mask = mod(t, ciclo) > (ciclo - apnea_dur);
respiracion(apnea_mask) = 0;

figure;
plot(t, respiracion, 'r', 'LineWidth', 2);
xlabel('Tiempo (s)');
ylabel('Amplitud');
title('Simulación del Ritmo de Cheyne-Stokes');
grid on;
xlim([0, T]);
ylim([-1.2, 1.2]);

figure;
for k = 1:length(t)
    plot(t(1:k), respiracion(1:k), 'r', 'LineWidth', 2);
    xlabel('Tiempo (s)');
    ylabel('Amplitud');
    title('Simulación del Ritmo de Cheyne-Stokes');
    grid on;
    xlim([0, T]);
    ylim([-1.2, 1.2]);
    pause(0.01);
end
