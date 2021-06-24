close all

Pfa = 1e-3;
Pd = 0.1;

%% NOISE VOLTAGE DISTRIBUTION

x = -7:.01:7;
%standard deviation of noise
std_dev = (1)^-0.5;
pd = makedist('Normal','Sigma',std_dev);
H0 =  pdf(pd,x);

figure
plot(x,H0)

xlabel("Voltage")
ylabel("Probability")
title("Plot showing voltage PDF with threshold voltage plotted")

%% THRESHOLD VOLTAGE

%inverse of the cumulative normal distribution give threshold voltage
%finding P(v|H0) > Vtrice
Vt =  norminv(1- Pfa,0, std_dev)
hold on
xline(Vt)


%% CUMULATIVE VOLTAGE DISTRIBUTION OF NOISE

figure

norm_area_right_pfa = 1 - cdf('Normal',Vt,0,std_dev);
a = norminv(norm_area_right_pfa,0,std_dev)

plot(x,cdf('Normal',x,0,std_dev))
hold on
xline(a)

xlabel("voltage")
ylabel("cumulative probability")
title("CDF of noise voltage")

%% SIGNAL DISTRIBUTION

%lower bound to include 80% of H1 above threshold
norm_area_right_pd = 1- Pd;

%converting area of norm to threshold value

d_thresh = norminv(norm_area_right_pd,0,std_dev);

%plotting cdf of H1
figure
plot(x,cdf('Normal',x,0,std_dev));
xline(d_thresh)
title("plot showing CDF H1 with pd")

%plotting pdf of H1
pd_pd = makedist('Normal','Sigma',std_dev, 'mu', 0);

%ploting pdf of H1 with threshold
figure
plot(x,pdf(pd_pd,x))
title("plot showing PDF H1 with pd")
hold on
xline(d_thresh)

%% PLOTTING BOTH
H1 = pdf(pd_pd,x);

m = Vt - d_thresh
m2 = m^2
snr = m2/(std_dev^2)
snr_db = 10*log10(snr)

figure
plot(x, H0)
hold on
plot(x+Vt-d_thresh, H1)
hold on
xline(Vt)


























