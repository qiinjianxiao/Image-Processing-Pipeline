function x3=IDR_Fscaling_inv_sub(y,F,k,xc,phi)

%Find the correct range of the first point : --------------------
x1=0; x2=y;
y1=0;   y2 = (1-F)*x2 +F*ScalingCurve4HDR(x2,k,xc,phi);
if y2>y
   while y2>y
      x2=x2/2;
      y2 = (1-F)*x2 +F*ScalingCurve4HDR(x2,k,xc,phi);
   end
elseif y2<y
   while y2<y  &&  x2<xc/2
      x2=x2*2;
      y2 = (1-F)*x2 +F*ScalingCurve4HDR(x2,k,xc,phi);
   end
end
%x1,x2,y1,y2,y
%-----------------------------------------------------------------

x3 = (x2-x1)/(y2-y1)*(y-y1) +x1;
y3 = (1-F)*x3 +F*ScalingCurve4HDR(x3,k,xc,phi);
if x3>1, x3=1; y3=1; end
while abs((y3-y)/y)>1e-9
   y1=y2; y2=y3; x1=x2; x2=x3;
   x3 = (x2-x1)/(y2-y1)*(y-y1) +x1;
   y3 = (1-F)*x3 +F*ScalingCurve4HDR(x3,k,xc,phi);
   if x3>1, x3=1; y3=1; end
end
