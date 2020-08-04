%% spend.m
%% Programa de simulacion del modelo
%% del pendulo invertido sobre una plataforma movil.
%%
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

%% Parametros
global M F r0 u0 m L J C g

%% Movil
M = 0.48; % masa
F = 3.83; % constante de friccion

%% Pendulo
m = 0.16; % masa
L = 0.25; % longitud del pendulo (distancia entre 
		 %el eje y el centro de gravedad)
J = 0.0043; % momento de inercia alrededor 
			%del centro de gravedad
C = 0.00218; % constante de friccion
g = 9.8; % aceleracion de gravedad

%% condiciones iniciales
x0 = [0.4 0 pi/40 0]';

%% tiempo de simulacion
ti = 0; tf = 1;

[t,x] = ode45('mpend',[ti tf],x0);

% la simulacion del sistema lineal es el siguiente script
lpend

% Comparacion de las simulaciones de ambos modelos
subplot(221),plot(t,x(:,1),'y--',T,X(:,1),'r')
title('Posicion del movil'),grid
subplot(222),plot(t,x(:,3)*180/pi,'y--',T,X(:,3)*180/pi,'r')
title('Angulo de rotacion del pendulo'),grid
subplot(223),plot(t,x(:,1)+L*sin(x(:,3)),'y--',T,Y,'r')
title('Posicion del cg'),grid

% fin de spend.m
