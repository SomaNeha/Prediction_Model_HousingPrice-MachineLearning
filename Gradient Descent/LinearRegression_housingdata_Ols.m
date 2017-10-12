clear all;
close all;
X=dlmread('housing_price_data.dat');
F=sortrows([X(:,5) X(:,2)]); % Initial plotting of values on graph from file 'housing_price_data.dat'
F=F(25:600,:);  % size 576x2
%seed = 100; rand('seed', seed); randn('seed', seed);
X=F(:,1);
normalize = max(X)-min(X);   % Normalization of x
X = X/normalize;    
X = [repmat(1,length(F),1) X];  % = [1 X]
y=F(:,2);
%% 
% Compute OLS
[b,bint,r] = regress(y,X);  % returns an n-by-1 vector r of residuals.
yhat =y-r;

%% 

% Display result
% Size X=576x2, yhat=576x1 (or 1x576)
figure; hold off;
scatter(X(:,2)*normalize,y, 50, '.'); hold;
plot(X(:,2)*normalize,yhat,'r');
xlabel('Size in square Feet'); ylabel('Price');