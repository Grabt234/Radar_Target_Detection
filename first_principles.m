close all

%% SETUP PARAMETERS
Pfa = 10^-4;
Pd = 0.8:0.005:0.95;
Nt = 100;

%% NOISE VOLTAGE DISTRIBUTION

x = -2:.01:4;   
%standard deviation of noise
var = 1;
std_dev = sqrt(var);
pd = makedist('Normal','Sigma',std_dev);
H0 =  pdf(pd,x);

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

%creating symbolic variable
syms snr

%preallocating memory
SNR = zeros(1, length(Pd));

for i = 1:numel(Pd)
    
    pd = Pd(i);
   
    %solving snr
    eqn = ( pd == exp(log(Pfa)/(1+Nt*snr)));  % Barton 2.46
    
    %saving SNR
    SNR(1,i) = vpasolve(eqn,snr);


end
    
figure
plot(10*log10(SNR),Pd);
title({'ROC GENRATED VIA FIRST PRINCIPLES AND BARTONS METHOD FOR A ';...
    'COHERENTLY INTEGRATED PULSE TRAIN AND SWERLING I TARGET'})
xlabel("SNR (dB)")
ylabel("Pd")















