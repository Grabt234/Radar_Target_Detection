% pfa = 10e-4;
% pd = 0.999;
% 
% loc_pfa = norminv(pfa)
% loc_pd  = norminv(1-0.999);
% 
% %Noise only distribution
% x_H0 = -3:.1:3;
% pd_H0 = makedist('Normal')
% pdf_normal_H0 = pdf(pd_H0,x_H0);
% plot(x_H0,pdf_normal)
% hold on
% 
% %Noise and signal distribution
% x_H1 = -3:.1:3;
% pd_H1 = makedist('Normal')
% pdf_normal_H1 = pdf(pd_H1,x_H1);

% 
% xline(loc_pd)
% 
% 

pfa = 10e-4;

%% Voltage Distribution 

x = -5:.01:5;
sigma = (2^(-.5));
pd = makedist('Normal','Sigma',sigma);

figure
plot(x, pdf(pd,x))
xlabel("Voltage")
ylabel("Probability")
title("Plot showing voltage PDF")


%% CUMULATIVE VOLTAGE DISTRIBUTION

figure
plot(x,erf(x))