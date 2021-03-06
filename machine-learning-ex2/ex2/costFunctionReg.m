function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

[n1, n2] = size(grad);

for i=1:m
  h = sigmoid(X(i,:)*theta);
  J = J + (-y(i)*log(h) - (1-y(i))*log(1-h))/m;
  
  grad = grad + (h-y(i))*X(i,:)'/m;
end

for j=2:n1
  J = J + lambda * theta(j)^2 /(2*m);
  grad(j) = grad(j) + lambda * theta(j) / m;
end




% =============================================================

end
