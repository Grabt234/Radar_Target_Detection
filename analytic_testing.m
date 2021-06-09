%% case varibles

D_lower = 0.8; 
D_upper = 0.95;
samples = 15;
D_step = (D_upper - D_lower)/samples;

%array of detection probabilities over 1 scan
D = D_lower:D_step:D_upper;

%converting to number of detected pulses 
N = 100;
Nt = repmat(N,1,samples+1);

%number of sucessfully detected pulses
Na = D*N;

PFA = 10e-4;

    
%% calcs
%one operates with the simplification: Pfa << 1

%now one needs to solve for an individual pulses pfs

syms pfa 

assume(pfa, 'real')
assumeAlso(pfa>0)
assumeAlso(pfa<0.5)
assumptions

i = 1;
eqn = (factorial(Nt(i))/(factorial(i)*factorial(Nt(i)-Na(i))))*pfa^(Na(i))*(1-pfa)^(Nt(i)-Na(i)) == PFA


pfa = vpasolve(eqn,pfa,[0 0.5])
















