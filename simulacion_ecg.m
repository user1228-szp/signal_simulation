%%%% code para ECG 

clear all
close all
clc


frecuency = 500;
duration= 1;

t = 0:1/frecuency:duration; %generar un vector con frecuencia de muestreo
ta = linspace(0,1,500);

matriz = [0.3  , 0.2 , 0.02
          -0.2 , 0.4  , 0.02
          1    , 0.5  , 0.01
          -0.3 , 0.7  , 0.01 
          0.4  , 0.8 , 0.02  
          ]; 

onda_p = matriz(1,1)*exp(-((t-matriz(1,2))/matriz(1,3)).^2);
% el "." es para que se haga paso a paso la operación (cada elemento
% de la ecuación) 
onda_q = matriz(2,1)*exp(-((t-matriz(2,2))/matriz(2,3)).^2);
onda_r = matriz(3,1)*exp(-((t-matriz(3,2))/matriz(2,3)).^2);
onda_s = matriz(4,1)*exp(-((t-matriz(4,2))/matriz(4,3)).^2);
onda_t = matriz(5,1)*exp(-((t-matriz(5,2))/matriz(5,3)).^2);

signal = onda_p + onda_q + onda_r + onda_s + onda_t;

x = ecg(frecuency);

signal_complete = repmat(signal, 1, 10);
time = linspace(0, 10 * duration, length(signal_complete));


subplot(3,1,1)
        plot(t,signal)
        xlabel('Time s')
        ylabel('Amplitude (mV)')
        title('Signal ECG')
        legend('SEÑAL ORIGINAL','FontSize',12,'FontWeight','Bold','location','best')
        grid on
    
subplot(3,1,2)    
        plot(ta,x)
        xlabel('Time s')
        ylabel('Amplitude (mV)')
        title('Signal ECG')
        legend('SEÑAL FUNCION','FontSize',12,'FontWeight','Bold','location','best')
        grid on


subplot(3,1,3)
        plot(time, signal_complete);
        xlabel('Time s')
        ylabel('Amplitude (mV)')
        title('Signal ECG')
        legend('SEÑAL repetida','FontSize',12,'FontWeight','Bold','location','best')
        grid on