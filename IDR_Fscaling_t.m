function [img,ldr,TM0]=IDR_Fscaling_t(A,k,xc,phi,F)

t=(0:65535)/65535; TM0=t; TM=t;
for ia=1:length(t)
   TM0(ia)=ScalingCurve4HDR(t(ia),k,xc,phi);
   %TM(ia)=(1-F)*t(ia)+F*ScalingCurve4HDR(t(ia),k,xc,phi);
end

if max(max(A))>10 %A consists of integers, maxA=65535
% if max(max(A))>10  
%111
   [h,w,~]=size(A);
   ldr=zeros(h,w);  A=A+1; %img=ldr;
   for iy=1:h
      for ix=1:w
        ldr(iy,ix)=TM0(A(iy,ix));
      end
   end
   img = (1-F)*(A-1)/65535 +F*ldr;
else %A is in the range 0 - 1
   %222
   L=length(TM0)-1; %%%%%%%%%%%%%%
   TM0_diff=TM0(2:end)-TM0(1:end-1);
   ldr=IDR_Fscaling_inv_sub2_t(A,TM0,TM0_diff,L);
   img = (1-F)*(A-1) +F*ldr;
end