% setanolrveap.m
% Programa de simulacion y generacion de los graficos del ejemplo2.m
%
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

% tiempo de simulacion
ti = 0;
tf = 15;

%% condiciones iniciales:
x0 = [0.1 0.1]';

%% simulacion
[t,x] = ode45('etanolrveap',[ti tf],x0);

% Pto de equilibrio
E = 0.7 ;  Ue = (1-E)/E;

%% Concentracion del etanol (x(1))
subplot(2,2,1), plot(t,x(:,1),t,E*ones(size(t)),'r--')
title('Concentración del etanol')
xlabel('tiempo t')
ylabel('x_1')
grid

%% Concentracion del azucar (x(2))
subplot(2,2,2), plot(t,x(:,2))
title('Concentración de azúcar')
xlabel('tiempo t')
ylabel('x_2')
grid

%% Variable de control (u)
lambda = 1 ;

u = Ue -(1/E)*(lambda-1/E)*(x(:,1)-E) ;

subplot(2,2,3), plot(t,u)
title('Sustrato')
xlabel('tiempo t')
ylabel('u')
grid

subplot(2,2,4), plot(t,x(:,1)+x(:,2))
title('Suma de las concen.')
xlabel('tiempo t')
ylabel('x_1 + x_2')
grid
% fin de setanolrveap.m

