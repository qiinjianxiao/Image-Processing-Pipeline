function Ar=IDR_scaling_inv(Am,k,xc,phi,L)
%L is the number of steps in used in linear interpolation. 
%For implementation in C, use 2^k for L to save computations  

[h,w,d]=size(Am);
Ar=zeros(h,w,d);

if L==0 %use L=0 to turn on the precise inversion (long computation time).
   for iy=1:h
      for ix=1:w
         for iz=1:d
            Ar(iy,ix,iz)=ScalingCurve4HDRinv(Am(iy,ix,iz),k,xc,phi);
         end
      end
   end
else
   Ti=zeros(1,L);   t=(0:L)/L;
   for ia=2:L+1 %starting from ia=2, because Ti(1)=0.
      Ti(ia)=ScalingCurve4HDRinv(t(ia),k,xc,phi);
   end
   Ti_diff = Ti(2:end) -Ti(1:end-1);  

   for iy=1:h
      for ix=1:w
         for iz=1:d
            if Am(iy,ix,iz)==1
               Ar(iy,ix,iz)=1;
            else
               idx=floor(Am(iy,ix,iz)*L);   
               f=Am(iy,ix,iz)*L -idx;   
               Ar(iy,ix,iz) = Ti(idx+1) +f*Ti_diff(idx+1);
            end
         end
      end
   end
end
