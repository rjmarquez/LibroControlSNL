function xdot=ejemplo1(t,x)
%% ejemplo1.m
%%
%% Control de orientacion de un artefacto espacial por medio
%% de linealizacion aproximada
%%
%% Este programa simula la respuesta de un modelo de tercer orden, que representa un artefacto espacial del
%% cual se requiere una reorientacion angular mediante control de las variables
%% de estado: posicion, velocidad y orientacion de la tobera. El controlador disen~ado esta basado en
%% linealizacion aproximada alrededor del punto de equilibrio deseado.
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


%% parametros del sistema
F = 200; L=3; R=20; J =50;

%% parametros del controlador
a =2.0; b=3.5; c = 12.75; Theta = 2.5;

%% ley de control
u = -J*a*(b^2+c^2)/(F*L*R)*(x(1)-Theta)-J*(b^2+c^2+2*a*b)/F/L/R*x(2)-...
(2*b+a)/R*x(3);

%% ecuaciones de estado
xdot = [x(2) ; F*L/J*sin(x(3)) ; R*u];

%% fin de ejemplo1.m

