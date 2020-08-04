function xdot = ejext1b(t,x)
% ejext1b.m
%
% Modificacion al programa ejext1.m
%
% Ley de control realimentada usando una saturacion del
% valor maximo y minimo posibles.
%
% El programa requerido para realizar las simulaciones
% y obtener las graficas es:
%
% sejext1b.m
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
J=90;al=0.5;a2=0.5; X=1.5;

% valor de saturacion del control
umax=5;

% ley de control
uu = -J*al*a2*(atan(x(1)) - atan(X) ) - J(al+a2)*x(2) ;

if abs(uu) > umax,
u = umax;
else
u = uu;
end

% modelo no lineal (satelite monoaxial)
xdot = [0.5*(1+x(1)*x(1))*x(2) ;
    1/J*u];

% fin ejext1b.m
