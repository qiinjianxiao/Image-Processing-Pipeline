function [idr,ldr]=IDR_Fscaling_inv_t(Am,k,xc,phi,F,L)
%L is the number of steps in used in linear interpolation. 
%For implementation in C, use 2^k for L to save computations  

t=(0:65535)/65535; TM0=t; TM=t;
[h,w,d]=size(Am);
% Am=Am/max(Am(:));
ldr=zeros(h,w,d); 
for iy=1:h
  for ix=1:w
        idr(iy,ix)=IDR_Fscaling_inv_sub(Am(iy,ix),F,k,xc,phi);
  end
end
ldr = (1-F)*(Am-1) +F*idr;
