% %% case varibles
% 
% D_lower = 0.8; 
% D_upper = 0.95;
% samples = 15;
% D_step = (D_upper - D_lower)/samples;
% 
% %array of detection probabilities over 1 scan
% D = D_lower:D_step:D_upper;
% 
% %converting to number of detected pulses 
% N = 10;
% Nt = 2;
% 
% %number of sucessfully detected pulses
% Na = 45;
% 
% PFA = 10e-4;
% 
%     
% %% calcs
% %one operates with the simplification: Pfa << 1
% 
% %now one needs to solve for an individual pulses pfs
% 
% syms pfa 
% syms jj
% 
% 
% 
% assume(pfa, 'Real')
% assumeAlso(pfa>0)
% assumeAlso(pfa<0.5)
% assumptions
% 
% i = 1;
% 
% 
% 
% 
% eqn = (factorial(Nt)/(factorial(jj)*factorial(Nt-jj)))*((pfa^(jj))*(1-pfa)^(Nt-jj))  == PFA
% ss = symsum(eqn,jj,Na,Nt)
% 
% 
% % eqn = (factorial(Nt)/(factorial(Na)*factorial(Nt-Na)))*((pfa^(Na))*(1-pfa)^(Nt-Na))  == PFA
% 
% expression = vpasolve(ss,pfa,[0 0.9999])
% 
% 
% 
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


M = 100 
s = 95
syms pfal ii



f = nchoosek(M,ii);

eqn = (symsum(f*(pfal)^(ii)*(1-pfal)^(M-ii),ii,s,M) == 10^(-6) ) 

vpasolve(eqn,pfal, [0,1])






