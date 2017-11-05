function ret = cellgrowth(t, Y, mu, Ks, Kd, M, Yxs)

%Create MATLAB function file for the differential equations
% setup ret in correct form (ie. a column vector)
     ret = zeros(2,1);
% extract current values of X and S where X = Y(1) and S = Y(2)
     X = Y(1);
     S = Y(2); 
 % return updates of X and S    
     ret(1) = mu * S * X / (Ks + S) - Kd * X;
     ret(2) = -mu * S * X  / ((Ks + S) * Yxs) - M * S;
end

