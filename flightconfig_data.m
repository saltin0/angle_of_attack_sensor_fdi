%flightconfig_data.m
%   aerosonde UAV Initialization Routine
%   
%   Copyright 2002 Unmanned Dynamics, LLC 
%   Modified JFW using Mathworks Aerospace Blockset 2 March 2011
%   Modified by JGP 2014
%   For internal use only

% add ell4 path
%path(path,'C:\Documents and Settings\eh3081\My Documents\MATLAB\ATRAEAII\ell4')
%%  obtain aircraft data 
function flightconfig = flightconfig_data
%simlength is in seconds.  1 hour = 3600 seconds
%The randn function returns a sample of random numbers from a normal distribution with mean 0 and variance 1
%This then gives a simlength with a mean time of 5hrs & a variance of 2
%hours

flightconfig=siminitialdetails;
% rng('shuffle');
% flightconfig.simlength = ((7200*randn) + 25200);
flightconfig.segment_length = 50000;
%logging decimation currently set to give a 10Hz singal logging rate
%simulation sample step size is 20ms
flightconfig.decimationlogging = 5;
flightconfig.distance_travelled = 0;
flightconfig.mission_segment_distance = 800000;
%% Define initial state values  


flightconfig.theta_trim = 0;

flightconfig.q_trim =0;

rng('shuffle')
bearing = (0.01*randn);
if (bearing<-1.2)
    bearing = -1.19;
elseif (bearing>1.2)
    bearing = 1.19;
end
flightconfig.chi_trim = bearing;% initial heading mean of 0 and a variance of 1 radian with limits of +&- 1.2

rng('shuffle');
init_alt = ((5*randn) + 500); % initial altitude (originally 500) now mean initial altitude of 500 with a variance of 50ft
if (init_alt<0)
    init_alt = init_alt*-1;
end
flightconfig.h_trim=init_alt; 

rng('shuffle');
vinitial=((1*randn) + 23);

%  position in inertial axes [Xe,Ye,Ze]: (m)
flightconfig.position_0 = [0; 0; -flightconfig.h_trim];
    %  velocity in body axes [u,v,w]: (m/s), yaw]: (rad)
flightconfig.velocity_0 = [vinitial; 0; 0];
   %  body rotation rates [p,q,r]: (rad/s)
flightconfig.rates_0 = [0; flightconfig.q_trim ; 0];
%  Euler orientation [roll, pitch, yaw]: (rad)
flightconfig.euler_0 = [flightconfig.theta_trim; 0; 0];


                %  fuel mass: (Kg)
rng('shuffle');
starting_fuel=((0.1*randn) + 2);
if (starting_fuel<0)
    starting_fuel = starting_fuel*-1;
end
flightconfig.fuel_0 = starting_fuel;
        %  engine speed: (rad/s); 
flightconfig.Omega_0 = 5000*pi/30;
%% Define controls  

% controller initial states

flightconfig.flap= 0;

flightconfig.mixture = 13;

flightconfig.ignition = 1;
   % elevator
flightconfig.eta_trim=-0.1;
      % aileron
flightconfig.xi_trim=0;
     % rudder
flightconfig.zeta_trim=0;
   %throttle
flightconfig.tau_trim=0.4;
 
%for open loop case

flightconfig.control_0 = [flightconfig.flap; % flap
    flightconfig.eta_trim;      % elevator
    flightconfig.xi_trim;       % aileron
    flightconfig.zeta_trim;     % rudder
    flightconfig.tau_trim;      % throttle
    flightconfig.mixture;       % mixture
    flightconfig.ignition];     % ignition (1=on)

%% Define controller gains for closed loop case
% designed by Deborah Saban 
% see D. Saban, "Wake Vortex Modelling and Simulation for Air Vehicles  
%    in Close Formation Flight", PhD Thesis, Cranfield University, 
%    April 2010 (Supervisor: Dr James F Whidborne)

% SAS


flightconfig.Kq_eta = -0.28;
flightconfig.Ktheta_eta = -1;
flightconfig.Kr_zeta = -0.25;
flightconfig.Tr = 0.75;
flightconfig.Kphi_xi = -0.2;
flightconfig.Kari = 0.5;

% Attitude Control

flightconfig.Kp_theta = -0.8;
flightconfig.Ki_theta = -0.8;
flightconfig.Kp_phi = -0.2;
flightconfig.Ki_phi = -0.1;

% Autopilot

flightconfig.Kp_Ze = -0.03;
flightconfig.Ki_Ze = -0.0001;
flightconfig.Kd_Ze = -0.05;
flightconfig.Kp_psi = 0.7;
flightconfig.Ki_psi = 0.001;
flightconfig.Kp_u = 0.5;
flightconfig.Ki_u = 0.15;

% Trajectory Tracker

flightconfig.Kp_Ye = 0.18;
flightconfig.Ki_Ye = 0.0025;
flightconfig.Kd_Ye = 0.6;
flightconfig.Kp_Xe = 0.125;


%%   Virtual Leader (trajectory reference)
% straight line flight heading north (X_e-direction)


flightconfig.Xe0_VL=flightconfig.position_0(1);
flightconfig.Ye0_VL=flightconfig.position_0(2);
flightconfig.Ze0_VL=flightconfig.position_0(3);


flightconfig.Ue_VL=25;
flightconfig.Ve_VL=0;
flightconfig.We_VL=0;


%disp('Radius is');   
%disp(n);
%Radius of circle to be flown
flightconfig.radical_radius = 500;
%% FlightGear Visualization

% Cranfield Airport
% airport_ID : EGTC
% runway_ID : 1


flightconfig.latitude  = 52.073105 ;
flightconfig.longitude = -000.616697;

% San Fransisco Airport
% airport_ID : KSFO
% runway_ID : 10L
% latitude  = 37.76   
% longitude = -122.4

% get machine that Flightgear will run on
% host machine is 127.0.0.1
% 
%java.net.InetAddress.getByName('SOXP13426C')% 


