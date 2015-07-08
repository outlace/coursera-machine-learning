function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

%this is the summation function of (1/2m)*(h(x)-y)^2
sum = 0;
for n = 0:(m-1)
    sample = X(n+1,:);%this is one sample row of data
    h = theta'*sample';%h is our hypothesis; h[theta] = [theta]' * X
    set = (h-y(n+1))^2;
    sum = sum + set;
end

J = (1/(2*m))*sum;

% =========================================================================

end
