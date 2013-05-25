% Perform a simplified version of Chan-Vese segmentation algorithm, as
% described in "Solving Chan-Vese..." paper by He & Osher

function phi = SimpleCVsegment(I,phi0,dt,numIts,epsilon)

function f = myFunc(t,y)
f = PhiT(y,reshape(I,numel(I),1),epsilon);
end

% Set up coefficients for 4th order Runge-Kutta method
A = [0 0 0 0; 1/2 0 0 0; 0 1/2 0 0; 0 0 1 0];
b = [1/6 1/3 1/3 1/6]';
c = [0 1/2 1/2 1]';

% Solve segmentation problem using a fixed number of steps of
[m,n] = size(phi0);
phi = reshape(phi0,m*n,1);
for i = 1:numIts
phi = RKstep(0,phi,dt,@myFunc,A,b,c);
end

phi = reshape(phi,m,n);
end