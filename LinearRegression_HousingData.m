clear all; close all;
X=dlmread('housing_price_data.dat');
F=sortrows([X(:,5) X(:,2)]); % Initial plotting of values on graph from file 'housing_price_data.dat'
figure; scatter(F(:,1), F(:,2));
title('Scatter plot of housing prices');
xlabel('Size in square Feet');
ylabel('Price');
F=F(25:600,:); % size 576x2
%seed = 100; rand('seed', seed); randn('seed', seed);
X=F(:,1);
% Normalization of x
normalize = max(X)-min(X);
X = X/normalize;
X = [repmat(1,length(F),1) X]; % = [1 X]
 % size X is 576x2
y=F(:,2);
w = rand(2,1); % size w is 2x1  % w=weight
%% 

% Parameters
% X = 576x2 [1 size_of_house]
% y = 576x1
% w = 2x1

%% 

% Initialize learning rate
nu = 0.01; % nu= learning rate
mse = [];
m = length(y);
for itr=1:2000
 %Finding where differnce between consecutive value of MSE becomes
% insignificant 
 h = X*w;
 w = w - nu *(1/m)*sum(h-y);
 % Find yhat and compute MSE
 % Size w is 2x1, X is 576x2, yhat is 576x1
 cost = 1/(2*m)*sum((h-y).^2);
 mse = [mse, cost];
end
fprintf('Learning rate :');disp(nu); % This will display provided learning rate 
fprintf('Number of iteration are required :'); 
disp(itr); % This will display required learning rate 

%% 
% Display result
% mse is a vector of size 2000x1
yhat = X*w;
figure; hold off;
scatter(X(:,2)*normalize,y, 50, '.'); hold;
plot(X(:,2)*normalize,yhat,'r');
xlabel('Size in square Feet'); ylabel('Price');
figure; plot(mse);
xlabel('Iterations'); ylabel('Error');
