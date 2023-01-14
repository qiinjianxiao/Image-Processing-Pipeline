function y=ScalingCurve4HDRinv(x,k,xc,phi)
%phi is the shift parameter in:  A*( sin(omega*x+phi) -sin(phi) )
%phi is normally chosen to be pi/3
%Setting ph=0, this 'HDRcurve_symS' reduces to 'HDRcurve_sym' (which is already moved to recycle).

[A,omega,x0]=HDRcurve_symS(k,phi);

r_upper_right=1-xc; r_bot_left=xc;
if x>xc %upper right
   x=(x-xc)/r_upper_right;
   if x<=1-x0
      y = (asin(x/A +sin(phi)) -phi) /omega;
   else
      y = 1 -A*(sin(omega*(1-x)+phi) -sin(phi));
   end
   y = y*r_upper_right +xc;
else %bottom left
   x = x/r_bot_left;
   if x<=x0
      y = A*(sin(omega*x+phi) -sin(phi));
   else
      y = 1 -(asin((1-x)/A +sin(phi)) -phi)/omega;
   end
   y = y*r_bot_left;
end
