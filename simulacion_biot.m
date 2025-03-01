clc; 
clear; 
close all;

fs = 100;          
T = 60;           
t = 0:1/fs:T;     

BPM = 20;         
f_resp = BPM / 60; 
dur_respiracion = 3;  
dur_apnea = 5;    

respiracion = zeros(size(t));

for inicio = 0:(dur_respiracion+dur_apnea):T
    idx = (t >= inicio) & (t < inicio + dur_respiracion);
    respiracion(idx) = sin(2 * pi * f_resp * (t(idx) - inicio));
end

figure;
plot(t, respiracion, 'b', 'LineWidth', 2);
xlabel('Tiempo (s)');
ylabel('Amplitud');
title('Simulación del Ritmo de Biot');
grid on;
xlim([0, T]);
ylim([-1.2, 1.2]);

figure;
for k = 1:length(t)
    plot(t(1:k), respiracion(1:k), 'b', 'LineWidth', 2);
    xlabel('Tiempo (s)');
    ylabel('Amplitud');
    title('Simulación del Ritmo de Biot');
    grid on;
    xlim([0, T]);
    ylim([-1.2, 1.2]);
    pause(0.01);
end

