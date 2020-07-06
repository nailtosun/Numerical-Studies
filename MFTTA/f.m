function output = f(Iref,freeVariables,startSelection,Vc,modelName)
x = ones(freeVariables,1)*1e-2; %% Initialize free variables at 10 ms 
y = zeros(freeVariables,1);     %% Output vector initialization
for i = 1:freeVariables
   timing = [zeros(startSelection,1); x]; 
   out =  fea_load(timing,Iref,Vc,modelName);
   x(i)= out-5e-5;
   y(i) = x(i);
end
output =timing;
end