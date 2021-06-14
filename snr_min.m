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

    snr = 0.5*(norminv(F) - norminv(D)).^2;
    
end