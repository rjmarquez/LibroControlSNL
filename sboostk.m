% sboostk.m
%
% Programa que simula la respuesta en lazo cerrado de un convertidor
% de corriente continua del tipo Boost, controlado a un punto
% de equilibrio deseado mediante una ganancia K.
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


clear all
close all
% parametros de simulacion
t0 = 0;
tf = 0.02;
x0 = [0.0 0.0];

% simulacion
[t,x] = ode23('boostk',[t0 tf],x0);

subplot(223),plot(t,x(:,1),'k')
title('Corriente normalizada promedio')
xlabel('t [seg]')
ylabel('x1')

subplot(224),plot(t,x(:,2),'k')
title('Tensión normalizada promedio')
xlabel('t [seg]')
ylabel('x2')

% parametros
w0 = 1.881e3;
w1 = 1.6667e3;
b = 106.06;

% punto de equilibrio
Ue = 0.8;
X2e = b/w0/(1-Ue);

K = 0.316353;

yy = x(:,2);

uusl = Ue+K*(X2e-yy);

for i = 1:length(t),
if uusl(i) >= 1
    uu(i) = 1;
elseif uusl(i) <= 0
    uu(i) = 0;
else
    uu(i) = uusl(i);
end
end


subplot(222),plot(t,uu,'k')
title('Relación de trabajo')
xlabel('t [seg]')
ylabel('u')
axis([0 tf -0.1 1.1])

subplot(221),plot(t,yy,'k',t,X2e*ones(size(t)),'--r')
title('Tensión de salida')
xlabel('t [seg]')
ylabel('y')

% fin de sboostk.m
