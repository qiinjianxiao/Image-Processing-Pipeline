function [tem,shearWL]=girl_frame_pip(img,k)
%%%dark
% maxc=max(img(:));
% dw=120;dh=80;
% th=2296;tw=2450;
% sth=floor(th/k)+1;stw=floor(tw/k)+1;
% tem=Bmean(img,k);
% shearWL=img(th+1:th+dh*k,tw+1:tw+dw*k,:);%%%org
% tem=shear_RGB(tem,sth,stw,dh,dw,3,'r',maxc);

%%%Car
% maxc=max(img(:));
% dw=80;dh=60;
% th=2600;tw=2500;
% sth=floor(th/k)+1;stw=floor(tw/k)+1;
% tem=Bmean(img,k);
% shearWL=img(th+1:th+dh*k,tw+1:tw+dw*k,:);%%%org
% tem=shear_RGB(tem,sth,stw,dh,dw,2,'g',maxc);
% dw=90;dh=60;
% th=4330;tw=2260;
% sth=floor(th/k)+1;stw=floor(tw/k)+1;
% shearWL2=img(th+1:th+dh*k,tw+1:tw+dw*k,:);%%%org
% tem=shear_RGB(tem,sth,stw,dh,dw,2,'g',maxc);
%%studio
% maxc=max(img(:));
% dw=60;dh=40;
% th=2900;tw=5100;
% sth=floor(th/k)+1;stw=floor(tw/k)+1;
% tem=Bmean(img,k);
% shearWL=img(th+1:th+dh*k,tw+1:tw+dw*k,:);%%%org
% tem=shear_RGB(tem,sth,stw,dh,dw,2,'g',maxc);

% maxc=max(img(:));
% dw=60;dh=40;
% th=200;tw=500;
% % sth=floor(th/k)+1;stw=floor(tw/k)+1;
% tem=Bmean(img,k);
% % shearWL=img(th+1:th+dh*k,tw+1:tw+dw*k,:);%%%org
% % tem=shear_RGB(tem,sth,stw,dh,dw,2,'g',maxc);


% dw=80;dh=60;
% th=4050;tw=1450;
% sth=floor(th/k)+1;stw=floor(tw/k)+1;
% shearWL=img(th+1:th+dh*k,tw+1:tw+dw*k,:);%%%org
% tem=shear_RGB(tem,sth,stw,dh,dw,2,'g',maxc);

%%ladder--permute
% maxc=max(img(:));
% dw=80;dh=60;
% th=500;tw=400;
% sth=floor(th/k)+1;stw=floor(tw/k)+1;
% tem=Bmean(img,k);
% shearWL=img(th+1:th+dh*k,tw+1:tw+dw*k,:);%%%org
% shearWL=Bmean(shearWL,2);
% tem=shear_RGB(tem,sth,stw,dh,dw,2,'r',maxc);
%%studio
maxc=max(img(:));
dw=30;dh=40;
th=2510;tw=3200;
sth=floor(th/k)+1;stw=floor(tw/k)+1;
tem=Bmean(img,k);
shearWL=img(th+1:th+dh*k,tw+1:tw+dw*k,:);%%%org
% shearWL=Bmean(shearWL,2);
tem=shear_RGB(tem,sth,stw,dh,dw,2,'G',maxc);


