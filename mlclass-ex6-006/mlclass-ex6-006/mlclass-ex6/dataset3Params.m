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
sigma = 0.3;

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

C = 0.01;
sigma = 0.3;
mult = 10;

vec_C= ones(8,1);
vec_sigma= ones(8,1);
error_val = ones(8,8);
mult = 0.01; i=1;
while mult <= 100

    vec_C(i)=1*mult;
    vec_sigma(i)  = 1*mult;
    i = i+1;
     
    vec_C(i)=3*mult;
    vec_sigma(i)  = 3*mult;
    i = i+1;
    
mult = mult*10;
end;
    
m = size(vec_C, 1);
 for i = 1:m
     for j = 1:m
   model= svmTrain(X, y, vec_C(i), @(x1, x2) gaussianKernel(x1, x2, vec_sigma(j)));
   y_est=svmPredict(model, Xval);
   error_val(i,j) = mean(double(y_est~=yval));
     end;
 end;
 
[value , index] = min(reshape(error_val,numel(error_val),1));
[i,j] = ind2sub(size(error_val),index);

 C = vec_C(i);
 sigma = vec_sigma(j);
 








% =========================================================================

end
