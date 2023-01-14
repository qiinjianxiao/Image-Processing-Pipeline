% clear all;
% path='E:\new_code_data\download\camera-pipeline-nonUI-master\test\raw\two\DSCF0525.RAF';
% files=dir(path);
% Img=raw2rgb(path);
% Img=double(Img);
% TMOP={};
% TMOP.pattern='rggb';
% k=4;xc=0;r=1;
% [image,TMOP]=TMO_pro_Fsac(Img,TMOP,k,xc,r);
% 
% tem=files(1).name;
% tem=[tem(1:end-4),'_k',num2str(uint8(k*10)),'_xc',num2str(uint8(xc*10)),'_r',num2str(uint8(r*10)),'_mal.png'];
% Img_save=fullfile(files(1).folder,'image',tem);
% imwrite(uint16(image*65535),Img_save)

clear all;
path='F:\photo\test\figure\three';
name='8902938569.jpg';
Img=imread(fullfile(path,name));
Img=double(Img)/255;
TMOP={};
TMOP.pattern='rggb';
ks=[12,14,16];xcs=[0];r=1;
for nn=1:length(ks)
    for mm=1:length(xcs)
        k=ks(nn);xc=xcs(mm);
        [image,TMOP]=TMO_pro_Fsac(Img,TMOP,k,xc,r);
        figure;imshow(image)
        tem=name;
        tem=[tem(1:end-5),'_k',num2str(uint8(k*10)),'_xc',num2str(uint8(xc*10)),'_r',num2str(uint8(r*10)),'_mal.png'];
        Img_save=fullfile(path,tem);
        imwrite(uint16(image*65535),Img_save)
    end
end

