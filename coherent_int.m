%% DETERMINE NUMBER OF SUCESSFULLY RECEIVED PULSES

%array of detection probabilities
D_lower = 0.8; 
D_upper = 0.95;
samples = 15;
D_step = (D_upper - D_lower)/samples;
%array of detection probabilities over 1 scan
D = D_lower:D_step:D_upper;

%number of transmitted pulses
Nt = 100;

%probability of false alarm over one dwell (across all pulses)
PFA = 1e-4;

%% CALCULATING INDIVIDUAL PULSE DETECTABILIT FACTOR
%           --   BARTON PG:49-50    --

%detection probability of scan divided by pulses in scan
d = D/Nt;

%loss due to specteral envelope mismatch (not implemented)
Lm = 1;

%loss due to passband mismatch (not implemented)
Lmf = 1;

%accoutning for losses
d = d*Lm*Lmf;


%% CALCULATING INDIVIDUAL PULSE FALSE ALARM PROBABILITY
%          --   SLIDES 1-8 PG:88    --

%false alarm probability of scan divided by pulses in scan
pfa = PFA/Nt;
pfa = repmat(pfa, 1, samples+1)

%% SOLVING FOR SNR USING PULSE DETECTIBILITY FACTOR

snr = zeros(1, samples);

for i = 1:samples+1
    
      snr(i)  = snr_min(pfa(i), d(i));  
      
end



plot(snr,d)


















































