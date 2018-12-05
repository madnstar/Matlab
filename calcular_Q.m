function [Q] = calcular_Q(A,lambda)
%calcular_Q Notamos que Q(u)=A(u)+lamda*I

Q=A+lambda*sparse(eye(length(A)));

end

