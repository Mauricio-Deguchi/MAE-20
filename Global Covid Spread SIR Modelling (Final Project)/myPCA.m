function [coeff0rth, pcaData] = myPCA(data)
% myPCA analyses the principal compoenents of gievn COVID-19 statistical...
% data from multiple contries - covid_countries.csv
%
%   Inputs:
%       data: A nxp matrix represemtomg only the numerical parts of the
%       dataset
%   Outputs:
%       coeffOrth: a pxp martix whose columns are the eigenvectors
%       corresponding to the sorter eigenvalues
%       
%       pcaData: a nxp matrix representing the data projected onto the
%       principal components

%% Useful constants:
rows = size(data,1);            % Number of rows in the data
columns = size(data, 2);        % number of columns in the data

%% 1) Data standardization
% mean calculation
means = zeros(1,columns);       % preallocates memory for the array of means
for i = 1:columns               % for each column
    means(i) = (sum(data(:,i)))/(rows);     % the mean will be the sum of that column divided by the number of rows
end

% standard deviation calculation
stand_dev = zeros(1,columns);   % preallocates memory for the array of standard deviations
for l = 1:columns               % for each column
    sums = sum((data(:,l) - means(l)).^2);          % we will find the sum of the column over the squared difference between that row and its mean
    stand_dev(l) = (sums/(rows-1))^(1/2);           % the standard deviation will be the square root of the sum from earlier divided by one less than the number of rows
end

% standardization
for j = 1:columns                                   % for each column
    data(:,j) = (data(:,j)-means(j))/stand_dev(j);  % we will standardize the data by substracting each column from its mean and dividing it by its standard deviation
end


%% 2) Covariance Matrix Computation
dataT = data.';                         % stores the transpose of our standardized matrix
cov_mat = (dataT * data)/(rows-1);      % the covariance matrix is the transpose matrix multiplied by the standardized matrix and divided by the one less than the number of rows

%% Eigen values
[eig_vectors,eig_values] = eig(cov_mat);        % determines the eigen values and eigen vectors of our covariance matrix

[sort_eig,idx]= sort(diag(eig_values),'descend');   % sorts our eigen values and returns the order of the sorted indices
% the sorted eigen values are unused but must be stored in order to be able
% to access the indices
coeff0rth = eig_vectors(:,idx);         % extracts the eigen vectors in the order determined by their eigen values
pcaData = data*coeff0rth;               % multiplies the standardized data by the eigen vectors of the covariance matrix
end







