function reCFA=Nearby_avg_Up4(CFA,masks,pattern)
CFA=double(CFA);
[M,N]=size(CFA);
reCFA=zeros(M+2,N+2);
reCFA(2:end-1,2:end-1)=CFA;
reCFA(:,1)=reCFA(:,3);reCFA(:,end)=reCFA(:,end-2);
reCFA(1,:)=reCFA(3,:);reCFA(end,:)=reCFA(end-2,:);
if strcmp(pattern,'RGGB')||strcmp(pattern,'rggb')
    h=1+1;w=2+1;
else
    h=1+1;w=1+1;
end
te=0.25*(reCFA(h-1:2:end-2,w:2:end-1)+reCFA(h+1:2:end,w:2:end-1)+reCFA(h:2:end-1,w-1:2:end-2)+reCFA(h:2:end-1,w+1:2:end));
G=reCFA(h:2:end-1,w:2:end-1);
mask=masks(h-1:2:end,w-1:2:end);
imask=(mask==0);
G=mask.*te+imask.*G;
reCFA(h:2:end-1,w:2:end-1)=G;
if strcmp(pattern,'RGGB')||strcmp(pattern,'rggb')
    h=2+1;w=1+1;
else
    h=2+1;w=2+1;
end
G=reCFA(h:2:end-1,w:2:end-1);
te=0.25*(reCFA(h-1:2:end-2,w:2:end-1)+reCFA(h+1:2:end,w:2:end-1)+reCFA(h:2:end-1,w-1:2:end-2)+reCFA(h:2:end-1,w+1:2:end));
mask=masks(h-1:2:end,w-1:2:end);
imask=(mask==0);
G=mask.*te+imask.*G;
reCFA(h:2:end-1,w:2:end-1)=G;
reCFA=reCFA(2:end-1,2:end-1);

% CFA=double(CFA);
% [M,N]=size(CFA);
% reCFA=zeros(M+2,N+2);
% reCFA(2:end-1,2:end-1)=CFA;
% reCFA(:,1)=reCFA(:,3);reCFA(:,end)=reCFA(:,end-2);
% reCFA(1,:)=reCFA(3,:);reCFA(end,:)=reCFA(end-2,:);
% te=0.25*(reCFA(3:2:end-1,1:2:end-2)+reCFA(3:2:end-1,3:2:end)+reCFA(2:2:end-2,2:2:end-1)+reCFA(4:2:end,2:2:end-1));
% G=reCFA(3:2:end-1,2:2:end-2);
% mask=masks(2:2:end,1:2:end);
% imask=(mask==0);
% G=mask.*te+imask.*G;
% reCFA(3:2:end-1,2:2:end-2)=G;
% % se_mask(3:2:end-1,2:2:end-2)=mask;
% G=reCFA(2:2:end-2,3:2:end-1);
% te=0.25*(reCFA(2:2:end-2,2:2:end-2)+reCFA(2:2:end-2,4:2:end)+reCFA(1:2:end-3,3:2:end-1)+reCFA(3:2:end,3:2:end-1));
% mask=masks(1:2:end,2:2:end);
% imask=(mask==0);
% G=mask.*te+imask.*G;
% reCFA(2:2:end-2,3:2:end-1)=G;
% reCFA=reCFA(2:end-1,2:end-1);
