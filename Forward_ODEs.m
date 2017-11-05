
clear all
clf

% Write a script to solve ODEs for X and then plot x vs t
% array for time points
tRange=[0,200];
X_zero = 2.46*10^6;
S_zero = 122.6;

% Initial conditions are stored in a % 2 by 1 array or vector 
% where Y_timeZero(1)=X(0) and Y_timeZero(2)= S(0)
Y_timeZero = [X_zero, S_zero];

% Starting model parameters 
% mu=0.025; Ks=17;
mu=0.019;
Ks=17;
Kd=0.0005;
M=0.0005;
Yxs =5.068 *10^4;

% Solve for X and S by calling ode45
% ode45 returns the time point and the 2x1 vector where 
% Y(1) = X_updated and Y(2) = S_updated
[myT, Y]  = ode45(@cellgrowth, tRange, Y_timeZero, [], mu, Ks, Kd, M, Yxs);

%Testing with Experimental Data:
x_exp = [2460776, 3142661, 5325602, 5905037, 8422509, 8674884, 8304829, 7022150];
s_exp = [122.59, 83.90, 36.72, 24.77, 12.45, 8.54, 4.23, 2.12];
time_exp = [0, 24, 48, 54, 72, 80, 168, 192];


subplot(2,1,1);
plot(myT, Y(:,1), 'c');
hold on 
plot(time_exp, x_exp, 'r');
title('Model for Cell Growth');
legend('Model Generated','Expeimental Data','Location','southeast');
% legend('Cell Growth','Location','southwest');
xlabel('time (min)');
ylabel('cell density (cells/ml)');

% Box to Contain text showing Model Parameters

plot(1:200)
dim = [.36 .33 .3 .08];
str = 'Model Parameters: mu=0.019, Ks=17, Kd=0.0005, M=0.0005, Yxs =5.068 *10^4';
annotation('textbox',dim,'String',str,'fontsize',9,'BackgroundColor','y');
%annotation('textbox',dim,'String',str,'FitBoxToText','on','fontsize',8,'BackgroundColor',[1 1 0]);

subplot(2,1,2);
plot(myT, Y(:,2), 'b');
hold on
plot(time_exp, s_exp,'r');
title('Model for Glucose Consumption');
legend('Model Generated','Expeimental Data','Location','southeast');
% legend('Glucose Consumption','Location','southwest');
xlabel('time (min)');
ylabel('Glucose Concentration (mg/dl)');



