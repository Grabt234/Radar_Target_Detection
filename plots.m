close all

Pfa = 1e-4;
Pd = 0.1:0.005:0.9

Nt = 100

%% NOISE VOLTAGE DISTRIBUTION

x = -7:.01:7;
%standard deviation of noise
std_dev = (1/1)^-0.5;
var = (std_dev)^2
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

%% PLOTTING SQUARE LAW DETECTOR RAYLEIGH (expo PDF, H0)

v2 = raylpdf(x,var); %Richards 15.19

figure
plot(x,v2)
xlabel("voltage at output of square law detector")
ylabel("Pv")
title("Exponential distribution (PDF) of the output voltage of the square law detector")

% threshhold value for rayleigh
T = sqrt(2)*std_dev*sqrt(-log(Pfa)); %Richards 15.47

hold on
xline(T)

%% Rayleigh CDF

v2_cdf = raylcdf(x,var);

figure
plot(x,v2_cdf)
xlabel("voltage at output of square law detector")
ylabel("Pv")
title("rayleigh distribution (cdf) of the output voltage of the square law detector")
hold on
xline(T)

%% APPLYING SWERLING 1

syms snr

SNR = zeros(1, length(Pd));

for i = 1:numel(Pd)
    
    pd = Pd(i);
    
    %eqn = ( pd == (1 + 1/(Nt*snr))^(Nt-1)*exp(-T/(1+Nt*snr)) );
    eqn = ( Nt*snr == -(T+log(pd))/log(pd) )
    %eqn = ( pd == 1 - gammainc(T,Nt-1) + ((1 + 1/(Nt*snr))^(Nt-1))  )
    
    if i == 1
        
        SNR(1,i) = solve(eqn,snr)
        
    else
        
        
        SNR(1,i) = solve(eqn,snr)
        
    end 

end
    
figure
plot(10*log(SNR),Pd)
xlabel("SNR (dB)")
ylabel("Pd")















