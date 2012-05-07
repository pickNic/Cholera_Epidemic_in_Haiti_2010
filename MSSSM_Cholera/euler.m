function [s,x, r]=euler(s,x,r, lambda, gamma, mu);
%WATERQUAL Summary of this function goes here
%   Detailed explanation goes here
















%Calculations for the variable susceptible
ds=mu-lambda.*s-mu.*s;

s=s+ds;


%Calculations for the variable infectious
dx=-gamma.*x+lambda.*s-mu.*x;

x=x+dx;


%Calculations for the variable recovered


dr=gamma.*x-mu.*r;

r=r+dr;

%r=1-s-x;





end

