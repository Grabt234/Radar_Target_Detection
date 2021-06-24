close all

Pfa = 10e-4;
Pd = 0.8;

%% NOISE VOLTAGE DISTRIBUTION

x = -7:.01:7;
sigma = 1;
pd = makedist('Normal','Sigma',sigma);
H0 =  pdf(pd,x)

figure
plot(x,H0)

xlabel("Voltage")
ylabel("Probability")
title("Plot showing voltage PDF with threshold voltage plotted")

%% THRESHOLD VOLTAGE

%inverse of the cumulative normal distribution give threshold voltage
Vt = 1 - norminv(Pfa, sigma);
hold on
xline(Vt)


%% CUMULATIVE VOLTAGE DISTRIBUTION OF NOISE

figure

norm_area_right_pfa = 1 - cdf('Normal',Vt,0,sigma);
a = norminv(norm_area_right_pfa,0,sigma)

plot(x,cdf('Normal',x,0,sigma))
hold on
xline(a)

xlabel("voltage")
ylabel("cumulative probability")
title("CDF of noise voltage")

%% SIGNAL DISTRIBUTION

%lower bound to include 80% of H1 above threshold
norm_area_right_pd = 1- Pd;

%converting area of norm to threshold value
d_thresh = norminv(norm_area_right_pd,0,sigma);

%plotting cdf of H1
figure
plot(x,cdf('Normal',x,0,sigma));
xline(d_thresh)
title("plot showing CDF H1 with pd")

%plotting pdf of H1
pd_pd = makedist('Normal','Sigma',sigma, 'mu', 0);

%ploting pdf of H1 with threshold
figure
plot(x,pdf(pd_pd,x))
title("plot showing PDF H1 with pd")
hold on
xline(d_thresh)

%% PLOTTING BOTH
H1 = pdf(pd_pd,x);

figure
plot(x, H0)
hold on
plot(x-d_thresh+Vt, H1)
hold on
xline(Vt)


























