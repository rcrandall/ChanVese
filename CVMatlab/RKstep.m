function y_next = RKstep(tin, yin, dt, rhs, A, b, c)

[s, m] = size(b);
n = length(yin);
K = zeros(n,s);

for i = 1:s
K(:,i) = rhs(tin + c(i)*dt, yin + dt*(K*A(i,:)'));
end

% Each column of y_next is the solution calculated using the
% corresponding column of b
y_next = yin*ones(1,m) + dt*(K*b);
end