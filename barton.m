%% BARTONS METHOD PARAMETERS

%probability of false alarm
pfa = 1e-4;

%probability of detection
pd = 0.1:0.01:0.99;


%coherently integrated pulses
Nt = 100;

%% MIN SNR FOR SINGLE PULSE
min_snr = zeros(1, length(pd));

for i = 1:numel(pd)
    
    min_snr(1,i) = snr_min(pfa,pd(1,i));

end
%% GAIN DUE TO INTEGRATION

int_gain = 10*log10(Nt);

%% LOSS DUE TO NON-COHERENT INTEGRATION

nc_loss = 0;

%% LOSS DUE TO FLUCTUATIONS
pfa2 = repmat(pfa,1,length(pd))

D1 = log(pfa2)/log(pd) + 1;
D0 = zeros(1,length(pd));

for i = 1:numel(pd)
    
    D0(1,i) = snr_min(pfa,pd(1,i));

end

lf1 = D1./D0;

lf = 10*log(lf1);
lf = lf*(1+0.035*log10(Nt))

temp = 10*log10(min_snr) -int_gain + lf;

plot(10*log(temp), pd)





















