%%  Multi-Fast Triggering Time Algorithm 
% Author: Nail TOSUN
% Version: 2.0.0

% Used functions
% fea_load(x,Iref,Vc,modelName) makes 1-D/3-D FEM simulations and return time 
% where rail current intersect with desired Iref
% x: the set of triggering times
% Iref: Reference rail current 
% Vc: The capacitor voltage
% modelName: The name of the 1-D/3-D FEM model

% NOTE: Other parameters such as the payload mass can be adjust from FEM
% model. However, it can be also adjust from .m script via
% model.param.set() function. 

%% STEP 0: PARAMETERS
MODULE_NUMBER = 16; 
modelName = 'cost';
Iref = 1.2E6;
Vc = 6500*0.9;
%% STEP 1: DETERMINE THE VARIABLES
shouldWeObtainIlookUp = 0; %The parameter which determine whether a 
% initial firing is determined  

if shouldWeObtainIlookUp
    % If the initial firing is not detected do followings...
else
    % Initial firing is determined. 
    startSelection = 10; % The amount of initial firing
end

freeVariables = MODULE_NUMBER - startSelection;% The amount of triggering 
% time which is optimized.

timings = f(Iref,freeVariables,startSelection,Vc,modelName);