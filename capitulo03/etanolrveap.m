function xdot=etanolrveap(t,x)
%% etanolrveap.m
%%
%% Ejemplo con simulaciones numericas del libro:
%% Control de Sistemas No Lineales y Linealización
%%
%% Control de un proceso incontrolable de produccion
%% de etanol por medio del metodo de linealizacion aproximada
%%
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
E = 0.7 ;  Ue = (1-E)/E;

%% parametros del controlador
lambda = 1 ;

%% Ley de control
u = Ue -(1/E)*(lambda-1/E)*(x(1)-E) ;

%% Ecuaciones de estado
xdot = [ x(2)-x(1)*u ; -x(2)+ (1-x(2))*u ];

%% Fin de etanolrveap.m

