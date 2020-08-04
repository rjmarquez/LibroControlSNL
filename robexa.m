function dx = robexa(t,x)
% modelo de un manipulador robotico regulado mediante el metodo de control calculado
% robexa.m
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

% parametros
B = 1e-2; J = 4e-2; c = .58; N = 1;

% punto de equilibrio
Xd = 0;

% polinomios deseados
xi = 0.707; wn = 8.56;
u = -J*wn*wn*(x(1)-Xd) + c*sin(x(1)/N) + (B-2*J*xi*wn)*x(2);

y = x(1);

dx = [x(2);
    -B/J*x(2)-c/J*sin(x(1)/N)+1/J*u];
% fin de robexa.m
