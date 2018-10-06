function zdot=func(t,z)
zdot(1)=2*z(1) - 0.5*z(1)^2 - z(1)*z(2);
zdot(2)=-z(2) + z(1)*z(2);
zdot=zdot';