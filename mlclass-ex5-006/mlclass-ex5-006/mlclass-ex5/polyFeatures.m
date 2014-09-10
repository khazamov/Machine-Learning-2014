function [X_poly] = polyFeatures(X, p)
%POLYFEATURES Maps X (1D vector) into the p-th power
%   [X_poly] = POLYFEATURES(X, p) takes a data matrix X (size m x 1) and
%   maps each example into its polynomial features where
%   X_poly(i, :) = [X(i) X(i).^2 X(i).^3 ...  X(i).^p];
%


% You need to return the following variables correctly.
m=size(X,1);
X_poly = zeros(numel(X), p);

% ====================== YOUR CODE HERE ======================
% Instructions: Given a vector X, return a matrix X_poly where the p-th 
%               column of X contains the values of X to the p-th power.
%
% 
for j=1:m
    for i=1:p
        %X_poly(j,:) = [X_poly(j,1:i-1) X(j).^i zeros(1,p-i)]
        X_poly(j,i) = X(j).^i
    end;
end;

 



% =========================================================================

end