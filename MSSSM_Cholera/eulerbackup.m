function [s,x, r,w]=euler(s,x,r,w, mu, lambda, gamma, epsilon);
%WATERQUAL Summary of this function goes here
%   Detailed explanation goes here
















%Calculations for the variable susceptible
ds=mu-mu.*s-lambda.*s;

s=s+ds;


%Calculations for the variable infectious
dx=-gamma.*x+lambda.*s-mu.*x;

x=x+dx;


%Calculations for the variable recovered


dr=gamma.*x-mu.*r;

r=r+dr;

%r=1-s-x;



%Calculations for the variable waterquality


dw=epsilon.*(x-w);

w=w+dw;




end

