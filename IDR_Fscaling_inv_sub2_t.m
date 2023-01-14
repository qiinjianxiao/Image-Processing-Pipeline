function Am=IDR_Fscaling_inv_sub2_t(A,Ti,Ti_diff,L)

[h,w,d]=size(A);   Am=zeros(h,w,d);
for iy=1:h
   for ix=1:w
     if A(iy,ix)==1
        Am(iy,ix)=1;
     else
        idx=floor(A(iy,ix)*L);
        f=A(iy,ix)*L -idx;   
        Am(iy,ix) = Ti(idx+1) +f*Ti_diff(idx+1);
     end
   end
end
Am(Am<0)=0;  Am(Am>1)=1; 
