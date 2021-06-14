function snr = snr_min(F,D)
    % ---------------------------------------------------------------------    
    % snr_min: calculates the minimum required snr to detect a single pulse
    %              given the probability of detection and false alarm rate
    %
    % ---------------------------------------------------------------------
    % Usage:
    %  Inputs
    %   > D:    The required probability of detection
    %   > F:    The selected false alarm rate
    %
    %  Outputs
    %   > snr:  The minimum snr given D and F
    %
    % ---------------------------------------------------------------------
    
    %condition allows for snr that ^2 removes
    if (F <= D)
        
        snr = 0.5*(norminv(F) - norminv(D))^2;
        
    else
        
        snr = -0.5*(norminv(F) - norminv(D))^2;
    
    end
    
end