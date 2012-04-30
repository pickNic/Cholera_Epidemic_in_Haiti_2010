%
%
%
%
%Load the data for comparison an phip plus phiw

% Loading the Infectious data
infect0 = fopen('Infectious_data_semikolon.csv','r');
infect1 = fopen('Infectious_data.csv','w');
fwrite(infect1,strrep(char(fread(infect0))',';',','));
fclose(infect0);
fclose(infect1);

infectious_data = csvread('Infectious_data.csv');



% Loading the removed data
removed0 = fopen('Removed_data_semikolon.csv','r');
removed1 = fopen('Removed_data.csv','w');
fwrite(removed1,strrep(char(fread(removed0))',';',','));
fclose(removed0);
fclose(removed1);

removed_data = csvread('Removed_data.csv');




% Loading the visible data
susceptible0 = fopen('Susceptible_data_semikolon.csv','r');
susceptible1 = fopen('Susceptible_data.csv','w');
fwrite(susceptible1,strrep(char(fread(susceptible0))',';',','));
fclose(susceptible0);
fclose(susceptible1);

susceptible_data = csvread('Susceptible_data.csv');

plot(infectious_data(3,:))



% Loading the PHIp values
phip0 = fopen('Phip_data_semikolon.csv','r');
phip1 = fopen('Phip_data.csv','w');
fwrite(phip1,strrep(char(fread(phip0))',';',','));
fclose(phip0);
fclose(phip1);

phip = csvread('Phip_data.csv');





%Initialise all coefficients and parameters

%Amount of days calculated
t=31;

%Amount of districts Haiti is divided into
d=10;



%Parameters for the differential equations

mu=ones(10,1)*0.0278;

gamma=ones(10,1)*0.345;

epsilon=ones(10,1)*0.16;

betax=ones(10,1)*0.010;

betaw=ones(10,1)*0.944;

%Prepare all the needed matrices

s=ones(d,t);

x=ones(d,t);

r=ones(d,t);

w=ones(d,t);

%put the corresponding data into the first colum
%-----------------------------------------------
%THIS IS THE INITIAL CONTIDIONS FOR THE MODEL




s(:,1)=susceptible_data(:,1);

x(:,1)=infectious_data(:,1);

r(:,1)=zeros(10,1);

w(:,1)=zeros(10,1);

%Set the phip and phiw (force of infection)
   
phiw= [1 1 1 1 1 1 1 1 1 1; 
       2 2 2 2 2 2 2 2 2 2; 
       3 3 3 3 3 3 3 3 3 3; 
       4 4 4 4 4 4 4 4 4 4; 
       5 5 5 5 5 5 5 5 5 5;
       6 6 6 6 6 6 6 6 6 6;
       7 7 7 7 7 7 7 7 7 7;
       8 8 8 8 8 8 8 8 8 8;
       9 9 9 9 9 9 9 9 9 9;
       10 10 10 10 10 10 10 10 10 10];

phip * x(:,2);





%Start the loop for time iteration calculation

for p=2:t
    
    
    lambda = betax .* x(:,p) + betaw .* w(:,p) + phip * x(:,p);
    
    
    
    
    
   
    [s(:,p),x(:,p), r(:,p),w(:,p)]=euler(s(:,p-1),x(:,p-1),r(:,p-1),w(:,p-1), mu, lambda, gamma, epsilon);
    
   
end




plot(x(3,:))







