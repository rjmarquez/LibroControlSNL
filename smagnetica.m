% smagnetica.m
% Programa de simulacion para el sistema de levitacion
% magnetica controlado mediante linealizacion exacta
%
%% Ejemplo con simulaciones numericas del libro:
%% Control de Sistemas No Lineales: Linealización aproximada, extendida, exacta, 2005
#    Copyright 2005-2020 Richard Marquez
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.#
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.


% tiempo de simulacion
ti = 0; tf = 0.5;

%% condiciones iniciales:
x0 = [0.1 0 0.0]';

%% simulacion
[t,x] = ode45('lmagnetica', [ti tf], x0);

%% Desplazamiento de la esfera (x(1))
subplot(2,2,1), plot(t,x(:,1), 'k', 'linewidth', 1)
title('Desplazamiento de la esfera', 'fontsize', 12)
xlabel('tiempo t', 'fontsize', 12)
ylabel('x1', 'fontsize', 12)
grid

%% Velocidad de la esfera (x(2))
subplot(2,2,2), plot(t,x(:,2), 'k', 'linewidth', 1)
title('Velocidad de la esfera', 'fontsize', 12)
xlabel('tiempo t', 'fontsize', 12)
ylabel('x2', 'fontsize', 12)
grid

%% Corriente del circuito (x(3))
subplot(2,2,3), plot(t,x(:,3), 'k', 'linewidth', 1)
title('Corriente del circuito', 'fontsize', 12)
xlabel('tiempo t', 'fontsize', 12)
ylabel('x3', 'fontsize', 12)
grid

%% Variable de control (u)
c = 1; m = 0.1; L = 0.01; R = 1; g = 9.8;
a = 40; xi = 0.5; wn = 25; Xd = 0.05;

u = m*L*x(:,1)./(2*c*x(:,3)).*((c/m)*(x(:,3).^2./x(:,1)).*...
(2*R/L + x(:,2)./x(:,1)) + (a + 2*xi*wn)*(g - c/m*x(:,3).^2./x(:,1)) +...
(wn^2 + 2*xi*wn*a)*x(:,2) + a*wn^2*(x(:,1) - Xd));

subplot(2,2,4), plot(t,u, 'k', 'linewidth', 1)
title('Tension aplicada al circuito', 'fontsize', 12)
xlabel('tiempo t', 'fontsize', 12)
ylabel('u', 'fontsize', 12)
grid
% fin de smagnetica.m
