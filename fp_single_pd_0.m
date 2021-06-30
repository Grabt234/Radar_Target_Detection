close all




%% NOISE VOLTAGE DISTRIBUTION AND VT CALCULATION

%probability of false alarm
Pfa = 0.5e-1;

%possible voltages
x = -7:.01:7;
%standard deviation of noise
std_dev = 1/sqrt(1);
%defining PDF of noise voltage
pd = makedist('Normal','Sigma',std_dev);
H0 =  pdf(pd,x);

%determining voltage threshold
Vt =  norminv(1- Pfa,0, std_dev);

%plotting
subplot(1,2,1)
plot(x,H0)
hold on
xline(Vt)
hold off
xlabel("Voltage")
ylabel("Probability")
title("VOLTAGE PDF WITH THRESHOLD VOLTAGE PLOTTED")

%% CUMULATIVE VOLTAGE DISTRIBUTION OF NOISE

right_pfa = 1 - cdf('Normal',Vt,0,std_dev);

subplot(1,2,2)
plot(x,cdf('Normal',x,0,std_dev))
hold on
xline(right_pfa)
xlabel("Voltage")
ylabel("Cumulative Probability")
title("CDF OF NOISE VOLTAGE WITH PROBABILITY OF FALSE ALARM")

%% DISTRIBUTION PARAMETERS

%probability of detection
Pd = 0.8;

%lower bound to include 80% of H1 above threshold
Pd_not = 1- Pd;

%converting area of norm to threshold value
Vt_unshifted = norminv(Pd_not,0,std_dev);

%% PLOTTING H1 CDF

%plotting cdf of H1
figure

plot(x,cdf('Normal',x,0,std_dev));
xline(Vt_unshifted)
title("plot showing CDF H1 with pd")

%plotting pdf of H1
pd_pd = makedist('Normal','Sigma',std_dev, 'mu', 0);

%% PLOTTING H1 PDF

%ploting pdf of H1 with threshold
figure
subplot(1,2,1)
plot(x,pdf(pd_pd,x))
title({'UNSHIFTED SIGNAL AND NOISE PDF WITH' ; 'THRESHOLD VOLTAGE PLOTTED'})
xlabel("Voltage")
ylabel("Probability")
hold on
xline(Vt_unshifted)

%% PLOTTING BOTH
H1 = pdf(pd_pd,x);

subplot(1,2,2)
plot(x, H0)
hold on
plot(x+Vt-Vt_unshifted, H1)
title({'UNSHIFTED SIGNAL AND NOISE PDF WITH' ; 'THRESHOLD VOLTAGE PLOTTED'})
xlabel("Voltage")
ylabel("Probability")
hold on
xline(Vt)


%% ADDITIONAL CALCULATIONS


m = Vt - Vt_unshifted
m2 = m^2
snr = m2/(std_dev^2)
snr_db = 10*log10(snr)
























