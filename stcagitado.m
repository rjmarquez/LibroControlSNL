% stcagitado.m
% Programa de simulacion del reactor de agitado
% controlado mediante linealizacion exacta
%
%% Ejemplo con simulaciones numericas del libro:
%% Control de Sistemas No Lineales: Linealización aproximada, extendida, exacta, 2005
#
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
ti = 0; tf = 4;
%% condiciones iniciales:
x0 = [0.1 0.5]';
%% simulacion
[t,x] = ode45('tcagitado', [ti tf], x0);

%% Concentracion normalizada Cp/Cp0 de la especie P (x(1))
subplot(1,2,1), plot(t,x(:,1), 'k', 'linewidth', 1)
title('Concentracion normalizada Cp/Cp0 de la especie P', 'fontsize', 12)
xlabel('tiempo t', 'fontsize', 12)
ylabel('x1', 'fontsize', 12)
grid

%% Concentracion normalizada Cp/Cp0 de la especie Q (x(2))
subplot(1,2,2), plot(t,x(:,2), 'k', 'linewidth', 1)
title('Concentracion normalizada Cp/Cp0 de la especie Q', 'fontsize', 12)
xlabel('tiempo t', 'fontsize', 12)
ylabel('x2', 'fontsize', 12)
grid

%% Variable de control (u)
Da1 = 1; Da2 = 1; U = 4; x2d = (1/(2*Da2))*(-1 + sqrt(1 + 4*Da1*Da2*U/(1 + Da1)));
xi = 0.707; wn = 3.162277;

u = (1/Da1)*(Da1*(1 + Da1)*x(:,1) + (1 - 2*xi*wn + 2*Da2*x(:,2)).*(Da1*x(:,1) -...
x(:,2) - Da2*x(:,2).^2) - wn^2*(x(:,2) - x2d));

figure(2), plot(t,u, 'k', 'linewidth', 1)
title('Variable de control', 'fontsize', 12)
xlabel('tiempo t', 'fontsize', 12)
ylabel('u', 'fontsize', 12)
grid
% fin de stcagitado
