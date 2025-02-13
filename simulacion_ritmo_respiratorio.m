clc;
clear;
close all;


fs = 100;              % Frec
T = 10;               
t = 0:1/fs:T;         % time

% Respiratory parameters
BPM = 12;             % Respiratory rate in cycles per minute
f_resp = BPM / 60;    
amplitud = 1;          
modulacion = 0.3;     
f_mod = 0.2;          

respiration = (amplitud + modulacion * sin(2 * pi * f_mod * t)) .* sin(2 * pi * f_resp * t);

figure;
plot(t, respiration, 'b', 'LineWidth', 2);
xlabel('Tiempo (s)');
ylabel('Amplitud');
title('Simulación del Ritmo Respiratorio');
grid on;
xlim([0, T]);


figure;
for k = 1:length(t)
    plot(t(1:k), respiration(1:k), 'b', 'LineWidth', 2);
    xlabel('Tiempo (s)');
    ylabel('Amplitud');
    title('Simulación del Ritmo Respiratorio');
    grid on;
    xlim([0, T]);
    ylim([-1.5, 1.5]);
    pause(0.01);
end
