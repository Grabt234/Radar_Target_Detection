close all

Pfa = 1e-4;
Pd = 0.01:0.0001:0.9995;

%% NOISE VOLTAGE DISTRIBUTION

x = -7:.01:7;
%standard deviation of noise
std_dev = (1)^-0.5;
pd = makedist('Normal','Sigma',std_dev);
H0 =  pdf(pd,x);


%% THRESHOLD VOLTAGE

%inverse of the cumulative normal distribution give threshold voltage
%finding P(v|H0) > Vtrice
Vt =  norminv(1- Pfa,0, std_dev)


%% CUMULATIVE VOLTAGE DISTRIBUTION OF NOISE

norm_area_right_pfa = 1 - cdf('Normal',Vt,0,std_dev);
a = norminv(norm_area_right_pfa,0,std_dev)

%% SIGNAL DISTRIBUTION

%lower bound to include 80% of H1 above threshold
norm_area_right_pd = 1- Pd;

%converting area of norm to threshold value

d_thresh = norminv(norm_area_right_pd,0,std_dev);

%plotting pdf of H1
pd_pd = makedist('Normal','Sigma',std_dev, 'mu', 0);

%ploting pdf of H1 with threshold


%% PLOTTING BOTH
H1 = pdf(pd_pd,x);

m = Vt - d_thresh
m2 = m.^2
snr = m2./(std_dev.^2)
snr_db = 10.*log10(snr)

%% ROC plot

plot(snr_db,Pd)






















