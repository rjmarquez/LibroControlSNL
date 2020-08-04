function xdot=artexac(t,x)
% artexac.m
%
% Control de orientacion de un artefacto espacial por medio
% de linealizacion exacta
%
% simulacion mediante sartexac.m
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


% parametros del sistema
F = 200; L=3; R=20; J =50;

%% parametros del controlador
a1 = 3; a2 = 5; a3 = 4; X = 2.5;

%% Ley de control
b1 = a1*a2*a3; b2 = a1*a2+a1*a3+a2*a3; b3 = a1+a2+a3;

u = J/(F*L*R*cos(x(3)))*( -b1*(x(1)-X)-b2*x(2)-b3*F*L/J*sin(x(3))
);

%% Ecuaciones de estado
xdot = [x(2) ; F*L/J*sin(x(3)) ; R*u];

%% Fin de artexac.m
