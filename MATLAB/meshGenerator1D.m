%% 1D Mesh Generation
function connectivityMatrix = meshGenerator1D(xL,xU,numberOfElements,type)
    % Depend on the mesh type generate nodes and the connectivity matrix
    % N: the number of nodes
    if strcmp(type,'linear')
        N = numberOfElements + 1;
        x = linspace(xL,xU,N);
        connectivityMatrix = [(1:N-1)' (2:N)'];
        
    elseif strcmp(type,'quadratic')
        N = 2*numberOfElements+1;
        x = linspace(xL,xU,N);
        connectivityMatrix = [(1:2:N-2)' (2:2:N-1)' (3:2:N)'];
    elseif strcmp(type,'cubic')
        N = 3*numberOfElements+1;
        x = linspace(xL,xU,N);
        connectivityMatrix = [(1:3:N-3)' (2:3:N-2)' (3:3:N-1)' (4:3:N)'];
    else
    end
end