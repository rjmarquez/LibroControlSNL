%% mpend.m
%% modelo del pendulo invertido sobre una plataforma movil
%% para utilizarlo hay que ejecutar el programa spend.m
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


function xdot = mpend(t,x)
%% Parametros
global M F r0 u0 m L J C g

u = 0;

D1 = -C*x(4)+m*L*g*sin(x(3)); 
D2 = -F*x(2)+m*L*sin(x(3))*x(4)^2+u;
D = J*(M+m)+m*L^2*(M+m*sin(x(3))^2);

xdot = [x(2);
    (-m*L*cos(x(3))*D1+(J+m*L^2)*D2)/D;
    x(4);
    ((M+m)*D1-m*L*cos(x(3))*D2)/D];

%% fin de mpend.m
