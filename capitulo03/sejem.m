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
#

% tiempo de simulacion
ti = 0;
tf = 4;

%% condiciones iniciales:
x0 = [0.1 0.9]';

%% simulacion
[t,x] = ode45('etanolrveap',[ti tf],x0);

%% Concentracion del etanol (x(1))
subplot(2,2,1), plot(t,x(:,1))
title('Concentración del etanol')
xlabel('tiempo t')
ylabel('x1')

%% Concentracion del azucar (x(2))
subplot(2,2,2), plot(t,x(:,2))
title('Concentración de azúcar')
xlabel('tiempo t')
ylabel('x2')

%% Variable de control (u)

E = 0.7 ;  Ue = (1-E)/E;
lambda = 1 ;

u = Ue -(1/E)*(lambda-1/E)*(x(:,1)-E) ;

subplot(2,2,3), plot(t,u)
title('Rata de alimentación del sustrato')
xlabel('tiempo t')
ylabel('u')

% fin de setanolrveap.m

