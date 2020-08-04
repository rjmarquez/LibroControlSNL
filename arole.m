function xdot=arole(t,x)
% Sistema aro-anillo
% Programa de simulacion: sarole.m
%
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
a = 0.2;
g = 9.8;

% punto de equilibrio
X1e = 0.7854;

% parametros del controlador
wn = 12.83;
xi = 0.707;

uc = (-2*xi*wn*x(2)-wn^2*(x(1)-X1e)+g/a*sin(x(1)))/...
    (sin(x(1))*cos(x(1)));

% solo se toman valores positivos de uc
if uc<0
    u = 0;
else
    u = uc;
end

% sistema dinamico
xdot = [x(2);
    -g/a*sin(x(1))+0.5*u*sin(2*x(1))];
% fin de arole.m
# GNU Affero General Public License v3.0
