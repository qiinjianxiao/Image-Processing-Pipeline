function Am=IDR_Fscaling_inv_sub2(A,Ti,Ti_diff,L)

[h,w,d]=size(A);   Am=zeros(h,w,d);
for iy=1:h
   for ix=1:w
      for iz=1:d
         if A(iy,ix,iz)==1
            Am(iy,ix,iz)=1;
         else
            idx=floor(A(iy,ix,iz)*L);
            f=A(iy,ix,iz)*L -idx;   
            Am(iy,ix,iz) = Ti(idx+1) +f*Ti_diff(idx+1);
         end
      end
   end
end
Am(Am<0)=0;  Am(Am>1)=1; 

