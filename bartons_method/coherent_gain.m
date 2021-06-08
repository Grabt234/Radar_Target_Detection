function gain = coherent_gain(N)
    % ---------------------------------------------------------------------    
    % coherent_gain: Returns the gain associated with coherently
    %                   integrating N pulses
    % ---------------------------------------------------------------------
    % Usage:
    %  Inputs
    %   > N:    Number of pulses over a given dwell time
    %
    %  Outputs
    %   > gain: decibel gain due to N coherently integrated pulses
    %
    % ---------------------------------------------------------------------
    
    gain = 10*log(N);
    
end