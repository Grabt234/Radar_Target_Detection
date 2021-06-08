%% CASE VARIABLES

%detection probability bounds
D_lower = 0.8; 
D_upper = 0.95;
samples = 20000;
D_step = (D_upper - D_lower)/samples;

D = D_lower:D_step:D_upper;

%false alarm probability
F_1 = 10e-4;

F = F_1*ones(1, samples+1);

%number of coherently integrated pulses
N = 100;

%% SNR Calculations

%Array of minimum SNR's
snr = snr_min(D,F);

plot(snr, D)
xlabel("SNR")
ylabel("Probability of Detection");
title("SNR required to detected a single pulse");

%coherent gain
snr_N = coherent_gain(N);

%accounting for coherent gain
snr = snr - snr_N;

hold on
plot(snr, D)
xlabel("SNR")
ylabel("Probability of Detection");
title("SNR required to detected a N coherently integrated pulses");