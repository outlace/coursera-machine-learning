function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %

    %gradient descent: 
    % [theta]j = [theta]j - [alpha](1/m)sum((h[theta](x)i-y(i))x(i,j))
    theta_temp = theta;
    for i = 1:size(X,2)
        h = X * theta;
        theta_temp(i) = theta(i) - (alpha/m)*((h-y)'*X(:,i));
    end
    
    %fprintf('Theta_temp(n):\n %d\n', theta_temp(n));
    theta = theta_temp;

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
