% sejem4.m
% Programa de generacion de los graficos del ejemplo4.m
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
ti = 0;
tf = 1;

%% condiciones iniciales:
x0 = [0.2 0]';

%% simulacion
[t,x] = ode23('ejemplo4',[ti tf],x0);

%% parametros del sistema
a = 0.2; g = 9.8;
X1e = pi/4; Ue = g/(a*cos(X1e));

%% Angulo theta (x(1))
subplot(2,2,1), plot(t,x(:,1),t,X1e*ones(size(t)),'r--')
title('Posición angular anillo')
xlabel('tiempo t')
ylabel('\theta [rad]')

%% Velocidad angular (x(2))
subplot(2,2,2), plot(t,x(:,2))
title('Velocidad angular anillo')
xlabel('tiempo t')
ylabel('d\theta/dt [rad/s]')

%% Variable de control (u)

%% parametros del controlador
wn = 12.83; xi = 0.707;
K1 = 2*(wn^2-g/a*tan(X1e)*sin(X1e))/sin(2*X1e);
K2 = 4*xi*wn/sin(2*X1e);

%% Ley de control
u = -K1*(x(:,1)-X1e)-K2*x(:,2)+Ue;
w = sqrt(u);

subplot(2,1,2), plot(t,w)
title('Velocidad angular del aro')
xlabel('tiempo t')
ylabel('\omega = sqrt(u)')

% fin de sejem4.m
