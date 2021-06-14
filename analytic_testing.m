% % %% taking pfa and solving for snr of single pulse
% % 
% % pfa_calc = 0.070899420856138395109951223210513;
% % pfa_calc = 0.0001;
% % 
% % %creating detectibility factors
% % size = 10;
% % d = 0.01:0.001:0.999;
% % f= repmat(pfa_calc,1,length(d));
% % 
% % snr_pulse = snr_min(d,f)
% % 
% % %% PLOTTING RESULTS
% % 
% % plot(snr_pulse,d)
% % ylabel("Probability of Detection")
% % xlabel("Signal-to-Noise") %linear or dB?
% 
% 

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
PFA = 10e-4;

%symbolic variables for binomial solver
syms pfal ii na

%array of the number of alarmed pulses
Na_all = Nt*D;

%defining symbolic varibales for the analytic solver
syms pfal na


%% SOLVING BINOMIAL FOR INDIVIDUAL PULSE pfa

%The number of ways one can choose ii from Nt pulses
f = nchoosek(Nt,na);

%summand of the binomial distribution
summand = f*((pfal)^(na)*(1-pfal)^(Nt-na)); 

%preallocating memory for storing individual pulse pfa's
pfa_pulse = zeros(1,samples);

%should run for every detection case
for n = 1:numel(Na_all)
    
    %number of alarmed pulses (increases every loop)
    Na = Na_all(n);
    
    %summing from Na -> Nt, with na being variable that changes
    eqn = (symsum( summand ,na ,Na,Nt) == PFA ) ;
    
    %probability of false alarm for an individual pulse 
    pfa_pulse(1,n) = vpasolve(eqn,pfal, [0,1]);

end

%% FINDING MINIMUM SNR FOR NON FLUCTUATING TARGET

%NOTE: each array position in D corresponds to array position in pfa_pulse

%how many samples to create the plot with
plot_samples = 100;

%defining detection probability for a *single* pulse (100 samples)
d = linspace(0.1,0.999);



%increasing dimension for snr calculation
f = pfa_pulse(10)*ones(1, plot_samples);

%calculating snr
snr = snr_min(f,d)

%putting all curves on plot
for i = 1:1
    plot(snr,d);
    hold on
end

xlabel("SNR requirement for swerling 0");
ylabel("Probability of detection of a single pulse")








