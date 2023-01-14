function Am=IDR_scaling(A,k,xc,phi)

t=(0:65535)/65535; TM=t;
for ia=1:length(t)
   TM(ia)=ScalingCurve4HDR(t(ia),k,xc,phi);
end

[h,w,d]=size(A);
Am=zeros(h,w,d);  A=A+1;
for iy=1:h
   for ix=1:w
      for iz=1:d
         Am(iy,ix,iz)=TM(A(iy,ix,iz));
      end
   end
end
