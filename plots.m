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
close all

pfa = 10e-8;

%% NOISE VOLTAGE DISTRIBUTION

x = -5:.01:5;
sigma = 1;
pd = makedist('Normal','Sigma',sigma);

figure
plot(x, pdf(pd,x))

xlabel("Voltage")
ylabel("Probability")
title("Plot showing voltage PDF with threshold voltage plotted")

%% THRESHOLD VOLTAGE

%inverse of the cumulative normal distribution give threshold voltage
x_th_pfa = 1 - norminv(pfa, sigma);
hold on
xline(x_th_pfa)


%% CUMULATIVE VOLTAGE DISTRIBUTION OF NOISE

figure

norm_area_right_pfa = 1 - cdf('Normal',x_th_pfa,0,sigma);

plot(x,cdf('Normal',x,0,sigma))
hold on
xline(norminv(norm_area_right_pfa,0,sigma))

xlabel("voltage")
ylabel("cumulative probability")
title("CDF of noise voltage")

%% SIGNAL DISTRIBUTION

pd = 0.1;

sigma_pd = 1;
x_th_pd = norminv(1-pd,0,sigma_pd)

figure
plot(x,cdf('Normal',x,0,sigma_pd));
xline(x_th_pd)


pd_pd = makedist('Normal','Sigma',sigma, 'mu', 0);

figure
plot(x,pdf(pd_pd,x))
hold on
xline(x_th_pd)

%% HOPEFUL CALCULATIONS

x_th_pfa
x_th_pd
t = -(x_th_pd-x_th_pfa)/x_th_pfa


























