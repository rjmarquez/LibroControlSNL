% ssatelitext.m
%
% Programa de simulacion de la respuesta controlada
% de un satelite monoaxial (modelo no lineal obtenido
% usando la representacion Cayley-Rodrigues).
% Este programa permite simular la respuesta del sistema no lineal
% presentado en el programa ejext1.m
%
% El sistema es controlado mediante una realimentacion no lineal de estado
% obtenida por linealizacion extendida.
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
t0=0; tf=30;

% condiciones iniciales
x0=[0 0]';

% simulacion numerica
[t,x] = ode23('ejext1',[t0 tf],x0);

% parametros
J=90;a1=0.5;a2=0.5; X=1.5;

% obtencion de la ley de control en forma vectorial
u = -J*a1*a2*(atan(x(:,1))-atan(X))-J*(a1+a2)*x(:,2);

subplot(221), plot(t,x(:,1))
title('posicion angular de orientacion')
ylabel('x1')
xlabel('t [seg]')

subplot(222), plot(t,x(:,2))
title('velocidad angular respecto al eje principal')
ylabel('x2')
xlabel('t [seg]')

subplot(223), plot(t,u)
title('torque externo - ley de control')
ylabel('u')
xlabel('t [seg]')
% ssatelitext.m
