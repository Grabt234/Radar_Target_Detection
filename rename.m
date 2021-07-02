close all

%% SETUP PARAMETERS
Pfa = 10^-4;
Pd = 0.8:0.005:0.95
Nt = 100

%% NOISE VOLTAGE DISTRIBUTION

x = -2:.01:4;   
%standard deviation of noise
var = 1;
std_dev = sqrt(var)
pd = makedist('Normal','Sigma',std_dev);
H0 =  pdf(pd,x);


%% THRESHOLD VOLTAGE

%inverse of the cumulative normal distribution give threshold voltage
%finding P(v|H0) > Vtrice
% Vt =  norminv(1- Pfa,0, std_dev)


%% CUMULATIVE VOLTAGE DISTRIBUTION OF NOISE

% norm_area_right_pfa = 1 - cdf('Normal',Vt,0,std_dev);
% a = norminv(norm_area_right_pfa,0,std_dev)

%% SIGNAL DISTRIBUTION

% %lower bound to include 80% of H1 above threshold
% norm_area_right_pd = 1- Pd;
% 
% %converting area of norm to threshold value
% 
% d_thresh = norminv(norm_area_right_pd,0,std_dev);
% 
% %plotting pdf of H1
% pd_pd = makedist('Normal','Sigma',std_dev, 'mu', 0);
% 
% %ploting pdf of H1 with threshold


%% PLOTTING BOTH
% H1 = pdf(pd_pd,x);
% 
% m = Vt - d_thresh;
% m2 = m.^2;
% snr = m2./(std_dev.^2);
% snr_db = 10.*log10(snr);

%% ROC plot

% plot(snr_db,Pd);

%% PLOTTING SQUARE LAW DETECTOR RAYLEIGH (RAY PDF, H0)

v2 = raylpdf(x,std_dev); %Richards 3.11 (second referece: 15.19)

figure
plot(x,v2)
xlabel("Voltage")
ylabel("Pv")
title({'RAYLEIGH PDF OF THE OUTPUT VOLTAGE OF A';' LINEAR LAW DETECTOR UNDER ONLY NOISE'})

% threshhold value for rayleigh
T = sqrt(-log(Pfa)*2*var); %Richards 15.47

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
    %eqn = ( Nt*snr == -(T+log(pd))/log(pd) );
    %eqn = ( pd == exp(-T/(1+Nt*snr)));  % 3.22 THIS WORKS
    eqn = ( pd == exp(log(Pfa)/(1+Nt*snr)));  % Barton 2.46
    %eqn = ( pd == 1 - gammainc(T,Nt-1) + ((1 + 1/(Nt*snr))^(Nt-1))*gammainc(T/(1+(1/Nt*snr)), Nt-1)*exp(-T/(1+Nt*snr))  )
      
    SNR(1,i) = vpasolve(eqn,snr);


end
    
figure
plot(10*log10(SNR),Pd)
title("")
xlabel("SNR (dB)")
ylabel("Pd")















