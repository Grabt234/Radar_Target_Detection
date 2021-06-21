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
PFA = 1e-8;

%symbolic variables for binomial solver
syms pfal ii na

%array of the number of alarmed pulses
Na_all = Nt*D;

%defining symbolic varibales for the analytic solver
syms pfal na

















































