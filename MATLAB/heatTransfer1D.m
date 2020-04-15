clear all;
% 1D HEAT TRANSFER FINITE ELEMENT CODE
% Part 1: Meshing
n = 200; % number of sub-intervals
da = 0; % lower limit of domain
db = 1; % upper limit of domain
xa = 0.6; % rising edge of pulse function
xb = 0.8; % falling edge of pulse function
delta = (db-da)/n; % length of sub-interval
x = linspace(da,db, n+1); % x coordinates
xm = linspace(da+delta/2, db-delta/2, n);

% Part 2: Define excitation, or b
f = @(x,xa,xb) ((xa<=x) & (x<=xb)).*1;

% Global Matrix definition
A = zeros(n,n); b = zeros(n,1);

for i = 1:n
    b(i) = f(xm(i),xa,xb);
    for j = 1:n
        A(i,j) = (j*pi)^2*sin(j*pi*xm(i));
    end
end
alpha = (A\b).'; % Solve the matrix equation for coefficients
disp(alpha);
% compute the unknown function u(x)
u = zeros(1,n+1);
for i = 1:n+1
u(i) = sum(alpha .* sin((1:n)*pi*x(i)));
end
% plot the result
figure, clf, whitebg('white'), set(gcf, 'Color', [1 1 1]);
plot(x,u, 'k-o', 'Linewidth', 2)
xlabel('x'); ylabel('u(x)'); title('Point Matching Method');
axis tight; grid on
