%% DETERMINE NUMBER OF SUCESSFULLY RECEIVED PULSES

%array of detection probabilities
D_lower = 0.01; 
D_upper = 0.999;
samples = 100;
D_step = (D_upper - D_lower)/samples;
%array of detection probabilities over 1 scan
D = linspace(D_lower,D_upper,samples);

%number of transmitted pulses
Nt = 1;

%probability of false alarm over one dwell (across all pulses)
PFA = 1e-4;

%% CALCULATING INDIVIDUAL PULSE DETECTABILIT FACTOR
%           --   BARTON PG:49-50    --

%detection probability of scan divided by pulses in scan
d = D;

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
pfa = repmat(pfa, 1, samples)

%% SOLVING FOR SNR USING PULSE DETECTIBILITY FACTOR

snr = zeros(1, samples);

for i = 1:samples
      
      snr(i)  = snr_min(pfa(i), d(i));  
      
end

%% PLOTTING
plot((snr),d)
xlabel("snr")
ylabel("pd")
grid on


















































