function xdot=etanolrvelin(t,x)
%% etanolrvelin.m
%%
%% Control de un proceso incontrolable de produccion
%% de etanol por medio del metodo de linealizacion aproximada
%%
%% Ejemplo con simulaciones numericas del libro:
%% Control de Sistemas No Lineales y Linealización
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
global E lambda
Ue = (1-E)/E;

%% Ley de control
u = (1/E)*(lambda-1/E)*x(1) ;

%% Ecuaciones de estado
xdot = [ -(1-E)/E*x(1)+x(2)-E*u ; -x(2)/E+E*u ];

%% Fin de etanolrvelin.m

