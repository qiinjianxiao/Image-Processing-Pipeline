clear all;
path='F:\photo\test\figure\severn';
files=dir(fullfile(path,'*.dng'));
ks=[2];xcs=[0.5];rs=[1.0];
t=[];
for nn=19
    for j=1:length(xcs)
        for s=1:length(rs)
            for i=1:length(ks)
                fileName=fullfile(files(nn).folder,files(nn).name)
                TMOP=struct;
                DemoMethod='MLRI';Blocks=256;iternum=10;
                TMOP.DemoMethod=DemoMethod;TMOP.Blocks=Blocks;TMOP.iternum=iternum;
                [img,~,cfaImage,TMOP]=CFAtoRGB_pre(fileName,DemoMethod,Blocks,iternum,TMOP);
                t=[t;TMOP.time];
% %                 k=2.5;xc=0.45;r=1.3;
%                 k=ks(i);xc=xcs(j);r=rs(s);
                [image,TMOP]=TMO_pro_Fsac(img,TMOP,k,xc,r);
%                 % image=flip(permute(image,[2,1,3]),1);
%                 tem=files(nn).name;
%                 tem=[tem(1:end-4),'_k',num2str(uint8(k*10)),'_xc',num2str(uint8(xc*10)),'_r',num2str(uint8(r*10)),'.png'];
%                 Img_save=fullfile(files(nn).folder,'image',tem);
%                 imwrite(uint16(image*65535),Img_save)
            end
        end
    end
end