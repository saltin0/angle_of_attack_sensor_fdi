%aerosonde_initialize.m
%   aerosonde UAV Initialization Routine
%   
%   Copyright 2002 Unmanned Dynamics, LLC 
%   Modified JFW using Mathworks Aerospace Blockset 2 March 2011
%   Modified by JGP 2014
%   For internal use only

% add ell4 path
%path(path,'C:\Documents and Settings\eh3081\My Documents\MATLAB\ATRAEAII\ell4')
%%  obtain aircraft data 

aerosonde=aerosonde_data;
flightconfig=flightconfig_data;
flightconfig.We_VL = -1;
flightconfig.radical_radius = 6*pi/180;
g = -9.81;
s_to_ms = 1000;

gps_samp   = 1/5;
baro_samp  = 1/20;
bias_a_z   = 0.1;

fault_aktif = 1;

%%
n_states  = 3;
P0        = diag([1; 0.1; 0.01]);
w_a_z     = 0.0001;
w_b_z     = (1e-3);
w_baro    = 10;
w_gps_v   = 0.3;
w_gps_alt = 3;

Q = diag([w_a_z^2 ; w_b_z^2]);
G = [  0, 0; ...
      -1, 0; ...
       0, 1];

H_gps = [1 0 0; 
         0 1 0];
R_gps = diag([ w_gps_alt^2, w_gps_v^2]);

H_baro = [1 0 0];
R_baro = w_baro^2;      

dt = 1/50;
x_init = [510.0; -flightconfig.We_VL  ; 0.0];
F = [0 1 0;
     0 0 -1;
     0 0 0];