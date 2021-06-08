D_lower = 0.8; 
D_upper = 0.95;
samples = 15;
D_step = (D_upper - D_lower)/samples;

%array of detection probabilities over 1 scan
D = D_lower:D_step:D_upper;

%converting to number of detected pulses 
N_transmitted = 100

%number of sucessfully detected pulses
N_alarmed = D*N_transmitted;

