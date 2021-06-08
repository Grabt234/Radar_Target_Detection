function params = load_parameters(case_number)
    % ---------------------------------------------------------------------    
    % load_params: Returns the paramters for the specific target
    %                       detection scenario
    % ---------------------------------------------------------------------
    % Usage:
    %  Inputs
    %   > case_number:      the specific case number
    %
    %  Outputs
    %   > params:            the relevant params rrelating to specific
    %                           case
    %
    % ---------------------------------------------------------------------
    if (case_number == 1)
        params.Dmin = 0.8;
        params.Dmax = 0.95;
        params.F = 10e-4;
        params.N = 100;
        params.fluctuations = 'slow';
        params.processing_type = 'coherent';
    else
        fprintf("Case number %d is either invalid or has not yet been defined\n", ...
            case_number);
    end
    
end