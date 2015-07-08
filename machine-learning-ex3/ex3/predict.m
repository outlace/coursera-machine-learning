function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%
X = [ones(size(X,1),1) X]; %add 1s to X
%X should be 5000x401; Thet1 25x401; Theta2 10x26
for n = 1:size(X,1) %for each row, a single image
z2 = Theta1 * X(n,:)'; %25x1
a2 = sigmoid(z2);
a2 = [ones(1);a2]; %26x1
z3 = Theta2 * a2; %10x26 . 26x1 = 10x1
a3 = sigmoid(z3); %h[theta]_x
[h_x, I] = max(a3, [], 1); %single value for each
p(n) = I;
end






% =========================================================================


end
