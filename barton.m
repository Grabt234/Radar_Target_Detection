%% BARTONS METHOD PARAMETERS

%probability of false alarm
pfa = 0.05;

%probability of detection
pd = 0.1:0.005:0.95;

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

%coherently integrated therefore = 0
nc_loss = 0;

%% LOSS DUE TO FLUCTUATIONS
pfa2 = repmat(pfa,1,length(pd));

%intentionally ln()
D1 = log(pfa2)./log(pd) + 1;
D0 = zeros(1,length(pd));

for i = 1:numel(pd)
    
    D0(1,i) = snr_min(pfa,pd(1,i));

end

%converting to db scale
lf1 = 10*log10(D1) - 10*log10(D0);
lf = lf1*(1+0.035*log10(Nt));
 
%% COMPUTING BARTONS AND PLOTTING

%snr axis
SNR_db = 10*log10(min_snr) - int_gain + lf1;

%plotting onto already existing graphs
hold on
plot( SNR_db, pd)





















