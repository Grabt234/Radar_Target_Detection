%% BARTONS METHOD PARAMETERS

%probability of false alarm
pfa = 0.05;

%probability of detection
pd = 0.8:0.005:0.95;

%coherently integrated pulses
Nt = 100;

%% MIN SNR FOR SINGLE PULSE
min_snr = zeros(1, length(pd));

for i = 1:numel(pd)
    
    %Barton: pg - 42
    min_snr(1,i) = snr_min2(pfa,pd(1,i)); 

end
%% GAIN DUE TO INTEGRATION

int_gain = 10*log10(Nt);

%% LOSS DUE TO NON-COHERENT INTEGRATION

%coherently integrated therefore = 0
nc_loss = 0;

%% LOSS DUE TO FLUCTUATIONS
pfa_arr = repmat(pfa,1,length(pd));

%intentionally ln()
D1 = log(pfa_arr)./log(pd) + 1;
D0 = min_snr;


%converting to db scale
lf_1 = 10*log10(D1) - 10*log10(D0);
lf_1 = 10*log10(lf_1);
lf = lf_1*(1+0.035*log10(Nt));
 
%% COMPUTING BARTONS AND PLOTTING

%snr axis
SNR_db = 10*log10(min_snr) - int_gain + nc_loss + lf;

%plotting onto already existing graphs
hold on
plot( SNR_db, pd)
grid on





















