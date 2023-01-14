function [idr,ldr]=IDR_Fscaling_inv(Am,k,xc,phi,F,L)
%L is the number of steps in used in linear interpolation. 
%For implementation in C, use 2^k for L to save computations  

% t=(0:65535)/65535; TM0=t; TM=t;
% [h,w,d]=size(Am);
% % Am=Am/max(Am(:));
% ldr=zeros(h,w,d); 
% for iy=1:h
%   for ix=1:w
%       for iz=1:d
%         idr(iy,ix,iz)=IDR_Fscaling_inv_sub(Am(iy,ix,iz),F,k,xc,phi);
%       end
%   end
% end
% ldr = (1-F)*(Am-1) +F*idr;
% 
t=(0:L)/L;
%IDR image: ===================================================================
%Creating the inverse table: --------------------------------------------
Ti=zeros(1,L+1);
for ia=2:L
   Ti(ia)=IDR_Fscaling_inv_sub(t(ia),F,k,xc,phi);
end
Ti(L+1)=1;
Ti_diff = Ti(2:end) -Ti(1:end-1);
%------------------------------------------------------------------------

idr=IDR_Fscaling_inv_sub2(Am,Ti,Ti_diff,L);

%LDR image: ===================================================================
if F==0
   %Creating the inverse table: --------------------------------------------
   TM=zeros(1,L+1);
   for ia=2:L
      TM(ia)=ScalingCurve4HDR(t(ia),k,xc,phi);
   end
   TM(L+1)=1;
   TM_diff = TM(2:end) -TM(1:end-1);
   %------------------------------------------------------------------------
   ldr=IDR_Fscaling_inv_sub2(idr,TM,TM_diff,L);  
elseif F==1
   ldr =Am;
else
   ldr = (Am - (1-F)*idr)/F;
end
ldr(ldr<0)=0;  ldr(ldr>1)=1; 
