classdef AircraftSimData
    %structure containing all the aircraft configuration parameters
    %required to simulate an aircraft using the Aerospace Blockset
    %Aerosonde Model as a base
   properties
        %%% AERODYNAMICS %%%
        % Aerodynamic force application point (usually the aerodynamic center)[x y z]
        rAC; % m

        %%% Aerodynamic parameter bounds %%%
        % Airspeed bounds
        VaBnd; % m/s
        % Sideslip angle bounds
        BetaBnd; % rad
        % Angle of attack bounds
        AlphaBnd; % rad

        %%% Aerodynamic reference parameters %%%
        % Mean aerodynamic chord (Reference length)
        MAC; % m
        c;% 
        % Wind span (Reference span)
        b; % m
        % Wing area (Reference area)
        S; % m^2

        % ALL aerodynamics derivatives are per radian:
        %%% Lift coefficient %%%
        % Zero-alpha lift
        CL0;
        % alpha derivative (CLa)
        CLalpha;
        %CLa=CLalpha
        % Lift control (flap) derivative
        CLdf;
        % Pitch control (elevator) derivative
        CLde;
        % alpha-dot derivative
        CLalphadot;
        % Pitch rate derivative
        CLq;
        % Mach number derivative
        CLM;

        %%% Drag coefficient %%%
        % Lift at minimum drag
        CLmind;
        % Minimum drag (CDmin)
        CD0;
        %CDmin=CD0
        % Lift control (flap) derivative
        CDdf;
        % Pitch control (elevator) derivative
        CDde;
        % Roll control (aileron) derivative
        CDda;
        % Yaw control (rudder) derivative
        CDdr;
        % Mach number derivative
        pCDM;
        % Oswald's coefficient, e
        osw;
        % pieaR, constant = \pi *e *AR where the wing aspect ratio AR=b^2/S
        AR;
        pieaR;

        %%% Side force coefficient %%%
        % Sideslip derivative
        CYbeta;
        % Roll control derivative
        CYda;
        % Yaw control derivative
        CYdr;
        % Roll rate derivative
        CYp;
        % Yaw rate derivative
        CYr;

        %%% Pitch moment coefficient %%%
        % Zero-alpha pitch
        Cm0;
        % alpha derivative
        Cmalpha;
        %Cma = Cmalpha;
        % Lift control derivative
        Cmdf;
        % Pitch control derivative
        Cmde;
        % alpha_dot derivative
        Cmalphadot;
        % Pitch rate derivative
        Cmq;
        % Mach number derivative
        CmM;

        %%% Roll moment coefficient %%%
        % Sideslip derivative
        Clbeta;
        % Roll control derivative
        Clda;
        % Yaw control derivative
        Cldr;
        % Roll rate derivative
        Clp;
        % Yaw rate derivative
        Clr;

        %%% Yaw moment coefficient %%%
        % Sideslip derivative
        Cnbeta;
        % Roll control derivative
        Cnda;
        % Yaw control derivative
        Cndr;
        % Roll rate derivative
        Cnp;
        % Yaw rate derivative
        Cnr;


        %%% PROPELLER %%%
        %Propulsion force application point (usually propeller hub) [x y z]
        rHub; % m
        % Advance ratio vector
        J;
        % Coefficient of thrust look-up table CT = CT(J)
        CT;
        % Coefficient of power look-up table CP = CP(J)
        CP;
        % Propeller radius
        Rprop; % m
        % Propeller moment of inertia
        Jprop; % kg*m^2


        %%% ENGINE %%%
        % Engine rpm vector
        RPM; % rot per min
        % Manifold pressure vector
        MAP; % kPa
        MAPmin; % minimum manifold pressure

        % Sea-level fuel flow look-up table fflow = fflow(RPM, MAP)
        % RPM -> rows, MAP -> columns
        pFuelFlow; % g/hr
        % Sea-level power look-up table P = P(RPM, MAP)
        % RPM -> rows, MAP -> columns
        Power; % W
        % Sea-level pressure and temperature at which the data above is given
        pSL; % Pa
        TSL; % deg K
        % Engine shaft moment of inertia
        Jeng; % kg*m^2


        %%% INERTIA %%%
        % Empty aircraft mass (zero-fuel)
        mempty; % kg
        % Gross aircraft mass (full fuel tank)
        mgross; % kg
        % Empty CG location [x y z]
        CGempty; % m
        % Gross CG location [x y z]
        CGgross; % m

        % Empty moments of inertia [Jx Jy Jz Jxz]
        Jx_empty; % kg*m^2
        Jy_empty; % kg*m^2
        Jz_empty; % kg*m^2
        Jxz_empty; % kg*m^2
        %Jempty = [Jx_empty Jy_empty Jz_empty Jxz_empty]; % kg*m^2
        Jempty;
        % Empty moments of inertia [Jx Jy Jz Jxz]
        %J_empty = [Jx_empty  0  -Jxz_empty;
        %           0     Jy_empty       0;
        %           -Jxz_empty  0  Jz_empty]; % kg*m^2
        J_empty;
        % Gross moments of inertia [Jx Jy Jz Jxz]
        Jx_gross; % kg*m^2
        Jy_gross; % kg*m^2
        Jz_gross; % kg*m^2
        Jxz_gross; % kg*m^2
        %Jgross = [Jx_gross Jy_gross Jz_gross -Jxz_gross]; % kg*m^2
        Jgross;
        % Empty moments of inertia [Jx Jy Jz Jxz]
        %J_gross = [Jx_gross  0  -Jxz_gross;
        %           0     Jy_gross       0;
        %           -Jxz_gross  0  Jz_gross]; % kg*m^2
        J_gross;
        %%% OTHER SIMULATION PARAMETERS %%%
        g; % m/s^2 gravitational constant
   end
end