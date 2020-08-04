function xdot=ejemplo5(t,x)
%% ejemplo5.m
%%
%% Sistemas No Lineales
%%
%% Sistema Controlado por linealizacion aproximada para
%% regular la posicion de un anillo que desliza sobre
%% un aro que gira alrededor
%% de su eje vertical. El cuadrado de su velocidad angular
%% sirve de se~nal de control al sistema.
%% La ley de control esta basada en la reconstruccion
%% del vector de estado mediante un observador de Luenberger
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
a = 0.2; g = 9.8;

%% parametros del controlador
X1e = 0.7854; Ue = g/(a*cos(X1e));
wn = 12.83; xi = 0.707;
K1 = 2*(wn^2-g/a*tan(X1e)*sin(X1e))/sin(2*X1e);
K2 = 4*xi*wn/sin(2*X1e);

%% parametros del observador
wn1 = 15.5; xi1 = 0.707;
L1 = 2*xi1*wn1;
L2 = wn1^2-g/a*tan(X1e)*sin(X1e);

%% Ley de control
u = -K1*x(3)-K2*x(4)+Ue;

%% Ecuaciones de estado del sistema y del observador
xdot = [x(2);
    -g/a*sin(x(1))+u*sin(x(1))*cos(x(1));
    x(4)+L1*(x(1)-X1e-x(3));
    -g/a*sin(X1e)*tan(X1e)*x(3)+1/2*sin(2*X1e)*(u-Ue)+L2*(x(1)-X1e-x(3))];

%% Fin de ejemplo5.m
