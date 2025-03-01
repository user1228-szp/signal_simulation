% Ciclo respiratorio

t = linspace(0, 10, 1000); % Tiempo en segundos
volumen = 0.5 + 0.3 * sin(2 * pi * t / 5); % Volumen idealizado en litros

figure;
plot(t, volumen, 'b', 'LineWidth', 2);
hold on;
yline(0.5, '--k', 'Capacidad Residual');
xlabel('Tiempo (s)');
ylabel('Volumen Pulmonar (L)');
title('Ciclo Respiratorio');
grid on;

% Marcar inspiración y espiración
inspiracion = t(volumen >= 0.5);
espiracion = t(volumen < 0.5);

fill([inspiracion fliplr(inspiracion)], [volumen(volumen >= 0.5) 0.5*ones(size(inspiracion))], 'g', 'FaceAlpha', 0.3, 'EdgeColor', 'none');
fill([espiracion fliplr(espiracion)], [volumen(volumen < 0.5) 0.5*ones(size(espiracion))], 'r', 'FaceAlpha', 0.3, 'EdgeColor', 'none');

legend({'Volumen Pulmonar', 'Capacidad Residual', 'Inspiración', 'Espiración'});
hold off;
