function [A,omega,x0]=HDRcurve_symS(k,phi)

%phi is the shift parameter in:  A*( sin(omega*x+phi) -sin(phi) )
%phi is normally chosen to be pi/3
%Setting ph=0, this 'HDRcurve_symS' reduces to 'HDRcurve_sym'

%=================================================================================================
%k=1.1; ph=pi/3;
x0=1/k;  
F = k/cos(phi) * cos( (sqrt((k/cos(phi))^2-1) -k*tan(phi))*x0/(1-x0) +phi) -1;

if F>0
   x1=1.1*x0;
else
   x1=0.8*x0;
end
F1 = k/cos(phi) * cos( (sqrt((k/cos(phi))^2-1) -k*tan(phi))*x1/(1-x1) +phi) -1;

while abs(F1)>1e-10
   dx1=(x1-x0)/(F1-F) *(0-F1);
   x0=x1; F=F1;
   x1=x0+dx1;
   F1 = k/cos(phi) * cos( (sqrt((k/cos(phi))^2-1) -k*tan(phi))*x1/(1-x1) +phi) -1;
end

x0=x1; 
omega=(sqrt((k/cos(phi))^2-1) -k*tan(phi))/(1-x0);
A=k/(omega*cos(phi));

%t=(0:1000)/1000*x0; figure; plot(t, A*(sin(omega*t+ph)-sin(ph)),'k.-'); axis equal;
%hold on; plot(1-A*(sin(omega*t+ph)-sin(ph)), 1-t, 'k.-'); grid on;  plot(x0, A*(sin(omega*x0+ph)-sin(ph)), 'r.')
