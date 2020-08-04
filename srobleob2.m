% srobleob2.m
% Programa que simula la respuesta en lazo cerrado de un brazo manipulador robotico controlado por una ley de
% realimentacion no lineal con un observador no lineal, basados en el metodo de la linealizacion extendida.
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

%
% parametros de simulacion
t0 = 0;
tf = 2;
x0 = [pi/2 0.0 0.0 0.0];

% simulacion
[t,x] = ode23('robleob2',[t0 tf],x0);

subplot(223),plot(t,x(:,1),'k',t,x(:,3),'k--')
title('Posición angular'),xlabel('t [seg]'),ylabel('y = x_1 [rad]')
legend('y = x_1 (medida)','x_1 (estimada)')

subplot(211),plot(t,x(:,2),'k',t,x(:,4),'k--')
title('Velocidad angular'),xlabel('t [seg]'),ylabel('x_2 [rad/seg]')
legend('x_2 (real)','x_2 (estimada)')
% parametros
B = 1e-2;J = 4e-2; c = .58; N = 1;

% punto de equilibrio
X = 0;

% polinomios deseados
xi = 0.707; wn = 8.56; % control

uu = -J*wn*wn*(x(:,3)-X) + c*sin(x(:,3)/N) + (B-2*J*xi*wn)*x(:,4);

subplot(224),plot(t,uu,'k')
title('Torque'),xlabel('t [seg]'),ylabel('u [N-m]')
% fin de srobleob2.m
