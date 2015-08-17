function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 2;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
%{
results = zeros(100,3);
winner = zeros(2);
error = 9999999;
c = 0.01;
while c <= 30
    sigma = 0.01;
    while sigma <= 30
        model = svmTrain(X, y, c, @(x1, x2) gaussianKernel(x1, x2, sigma));
        pred_vec = svmPredict(model, Xval);
        predict_err = mean(double(pred_vec ~= yval));
        if error > predict_err
            error = predict_err;
            winner = [c sigma];
        end
        sigma = 3*sigma;
    end
    c = 3*c;
end
C = winner(1);
sigma = winner(2);
fprintf('C %d\n', C);
fprintf('sigma %d\n', sigma);
%}
C = 2.700000e-01;
sigma = 9.000000e-02;
% =========================================================================

end
