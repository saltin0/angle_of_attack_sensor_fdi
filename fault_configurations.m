TRUE  = 1;
FALSE = 0;
%% Angle of attack sensor fault configurations
bias_fault_active           = TRUE;
drift_fault_active          = FALSE;
stuck_fault_active          = FALSE;
gain_fault_active           = FALSE;
additive_noise_fault_active = FALSE;
intermittent_fault_active   = FALSE;

bias_fault_time             = 150;
drift_fault_time            = 150;
stuck_fault_time            = 0;
gain_fault_time             = 0;
additive_noise_fault_time   = 0;
intermittent_fault_time     = 0;

bias_rad                    = deg2rad(3)  ; % rad
drift_ratio_rad_s           = deg2rad(0.2); % rad/s
drift_limit_rad             = deg2rad(20) ; % rad
gain                        = 1.5;
additive_noise_gain         = 1.2;
