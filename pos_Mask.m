function [reCFA_mask,te]=pos_Mask(CFA,g0,white_level)
CFA=double(CFA);
[M,N]=size(CFA);
reCFA=zeros(M+2,N+2);
reCFA_mask=zeros(M+2,N+2);
reCFA(2:end-1,2:end-1)=CFA;
reCFA(:,1)=reCFA(:,3);reCFA(:,end)=reCFA(:,end-2);
reCFA(1,:)=reCFA(3,:);reCFA(end,:)=reCFA(end-2,:);
h=g0(1)+1;w=g0(2)+1;%%g0:the postion in CFA, not in extern CFA
te=0.25*(reCFA(h-1:2:end-2,w:2:end-1)+reCFA(h+1:2:end,w:2:end-1)+reCFA(h:2:end-1,w-1:2:end-2)+reCFA(h:2:end-1,w+1:2:end));
G=reCFA(h:2:end-1,w:2:end-1);
mask1=(te>white_level);
mask2=(G>=white_level);%%must include '='
mask=mask1+mask2;
mask(mask<2)=0;
mask(mask==2)=1;
imask=(mask==0);
reCFA_mask(h:2:end-1,w:2:end-1)=mask;
reCFA_mask=reCFA_mask(2:end-1,2:end-1);
te=te.*mask+G.*imask;




