% Unit tests for Tikhonov 

%% Test setup
Tik = tikhonov_object;
Tik.verbose = 0;
Tik.n_lambda = 100;
Tik.lambda_range = [-15 -2];

tol = 1e-14;

J_test = diag(1:100);
Tik.precompute(J_test);

dV_single = 1e-3*ones(100,1);
dV_multiple = 1e-3*ones(100,50);
dV_zeros = zeros(100,1);

%% Run tests


fprintf('Testing inverse of single dV')
[~,T] = Tik.predict(dV_single);
expected = 100e-3./(1:100)'; % 1/x

% Test the inverse solution
try
assert( max(abs(T-expected)) < tol,'Error with inverse')
catch 'Error with inverse'
    exit(1)
end
fprintf('.')
% Use caluclated inverse to recompute forward solution
assert (isequal(expected'*J_test,dV_single'),'Error with forward')
fprintf('.\n')


fprintf('Testing inverse of multple dVs')
[~,T] = Tik.predict(dV_multiple);
expected = repmat(expected,1,50);
assert( max(abs(T(:)-expected(:))) < tol,'Error with inverse')
fprintf('.')
% Use caluclated inverse to recompute forward solution
assert (isequal(expected'*J_test,dV_multiple'),'Error with forward')
fprintf('.\n')


fprintf('Testing inverse of zero-valued dV')
[~,T] = Tik.predict(dV_zeros);
expected = dV_zeros;
assert( isequal(T,expected),'Error with inverse')
fprintf('.')
% Use caluclated inverse to recompute forward solution
assert (isequal(expected'*J_test,dV_zeros'),'Error with forward')
fprintf('.\n')

%% Clear variables

clear Tik tol J_test dV_test