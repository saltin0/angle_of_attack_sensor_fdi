classdef siminitialdetails
    %structure containing all the aircraft configuration parameters
    %required to simulate an aircraft using the Aerospace Blockset
    %Aerosonde Model as a base
   properties

        simlength;
        segment_length; %time alloted for segment
        distance_travelled;
        mission_segment_distance;
        %logging decimation currently set to give a 10Hz singal logging rate
        %simulation sample step size is 20ms
        decimationlogging;

        %% Define initial state values  


        theta_trim;

        q_trim;
        

        chi_trim;% initial heading mean of 0 and a variance of 1 radian
        

        h_trim; % initial altitude (originally 500) now mean initial altitude of 500 with a variance of 50ft
        

        vinitial;

        %  position in inertial axes [Xe,Ye,Ze]: (m)
        position_0;
            %  velocity in body axes [u,v,w]: (m/s), yaw]: (rad)
        velocity_0;
           %  body rotation rates [p,q,r]: (rad/s)
        rates_0;
        %  Euler orientation [roll, pitch, yaw]: (rad)
        euler_0;
        

                        %  fuel mass: (Kg)
        fuel_0;
                %  engine speed: (rad/s); 
        Omega_0;
        %% Define controls  

        % controller initial states

        flap;

        mixture;

        ignition;
           % elevator
        eta_trim;
              % aileron
        xi_trim;
             % rudder
        zeta_trim;
           %throttle
        tau_trim;

        %for open loop case

        %control_0 = [flap; % flap
        %    eta_trim;      % elevator
        %    xi_trim;       % aileron
        %    zeta_trim;     % rudder
        %    tau_trim;      % throttle
        %    mixture;       % mixture
        %    ignition];     % ignition (1=on)
        control_0;
        %% Define controller gains for closed loop case
        % designed by Deborah Saban 
        % see D. Saban, "Wake Vortex Modelling and Simulation for Air Vehicles  
        %    in Close Formation Flight", PhD Thesis, Cranfield University, 
        %    April 2010 (Supervisor: Dr James F Whidborne)

        % SAS


        Kq_eta;
        Ktheta_eta;
        Kr_zeta;
        Tr;
        Kphi_xi;
        Kari;

        % Attitude Control

        Kp_theta;
        Ki_theta;
        Kp_phi;
        Ki_phi;

        % Autopilot

        Kp_Ze;
        Ki_Ze;
        Kd_Ze;
        Kp_psi;
        Ki_psi;
        Kp_u;
        Ki_u;

        % Trajectory Tracker

        Kp_Ye;
        Ki_Ye;
        Kd_Ye;
        Kp_Xe;


        %%   Virtual Leader (trajectory reference)
        % straight line flight heading north (X_e-direction)


        Xe0_VL;
        Ye0_VL;
        Ze0_VL;


        Ue_VL;
        Ve_VL;
        We_VL;


        %disp('Radius is');   
        %disp(n);
        %Radius of circle to be flown
        radical_radius;
        %% FlightGear Visualization

        % Cranfield Airport
        % airport_ID : EGTC
        % runway_ID : 1


        latitude;
        longitude;

        
        
   end
end