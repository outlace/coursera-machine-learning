function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
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
    %       of the cost function (computeCost) and gradient here.
    %
    theta0_sum = 0;
    for n = 1:m
        theta0_sum = theta0_sum + (theta(1)+theta(2)*X(n,2)-y(n));
    end
    theta0_temp = theta(1) - alpha*(1/m)*theta0_sum;
    
    theta1_sum = 0;
    for n = 1:m
        theta1_sum = theta1_sum + X(n,2)*(theta(1)+theta(2)*X(n,2)-y(n));
    end
    theta1_temp = theta(2) - alpha*(1/m)*theta1_sum;
    
    theta(1) = theta0_temp;
    theta(2) = theta1_temp;
    fprintf('Theta1: %s\n', theta(1))
    fprintf('Theta2: %s\n', theta(2))
    

    % ============================================================

    % Save the cost J in every iteration    
    cost = computeCost(X, y, theta);
    J_history(iter) = cost;
    fprintf('Cost (J(theta)): %s \n------------\n', cost)

end

end
