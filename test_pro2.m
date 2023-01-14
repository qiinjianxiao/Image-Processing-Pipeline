clear all;
path='F:\photo\test\figure\five\nr\*.dng';
files=dir(path);
tka={};tkr={};tkb={};tkg1={};tkg2={};
for nn=12:length(files)
    fileName=fullfile(files(nn).folder,files(nn).name);
    TMOP=struct;
    DemoMethod='MLRI';Blocks=256;iternum=10;
    TMOP.DemoMethod=DemoMethod;TMOP.Blocks=Blocks;TMOP.iternum=iternum;
    [img,cfaImage0,cfaImage,TMOP]=CFAtoRGB_pre(fileName,DemoMethod,Blocks,iternum,TMOP);

    [M,N]=size(cfaImage0);
    whiteBalance=1.0./TMOP.AsShotNeutral;
    whiteBalance=rawpattern(whiteBalance,TMOP.pattern);
    whiteBalance = repmat(whiteBalance,M/2,N/2);
    cfaWB = cfaImage0 .* whiteBalance;
    RGGB=Down_Sampling(cfaWB,TMOP.pattern);
    R=RGGB(:,:,1);G1=RGGB(:,:,2);
    G2=RGGB(:,:,3);B=RGGB(:,:,4);
    wl_org=TMOP.white_level/0.99+TMOP.blackLevel;
%     cfaWB(cfaWB<wl_org)=0;
    ka=length(find(cfaWB>wl_org));
    kr=length(find(R>wl_org));
    kb=length(find(B>wl_org));
    kg1=length(find(G1>wl_org));
    kg2=length(find(G2>wl_org));
    if isempty(ka)
        ka=0;
    end
    if isempty(kr)
        kr=0;
    end
    if isempty(kb)
        kb=0;
    end
    if isempty(kg1)
        kg1=0;
    end
    if isempty(kg2)
        kg2=0;
    end
    num=M*N;
    tka=[tka,ka/num];tkr=[tkr,kr/num];tkb=[tkb,kb/num];tkg1=[tkg1,kg1/num];tkg2=[tkg2,kg2/num];
end

% cfaImage0(cfaImage0<TMOP.blackLevel)=TMOP.blackLevel;
% recfa=cfaImage;
% wl_org=TMOP.white_level/0.99+TMOP.blackLevel;
% wl_org=uint16(wl_org);
% white_level=TMOP.white_level+TMOP.blackLevel;
% white_level=uint16(white_level);
% di=0.5*(wl_org-white_level);
% d=uint16(di);
% recfa=uint16(recfa+TMOP.blackLevel);
% recfa(recfa==white_level)=(white_level+di);
% diff=double(recfa)-cfaImage0;
% % diff(diff>0)=0;
% dif=abs(diff);
% % figure;imshow(dif/max(dif(:)));
% RGGB=Down_Sampling(dif,TMOP.pattern);
% max(diff(:))
% min(diff(:))
% [h,w]=find(diff<-0.01);
% [h2,w2]=find(diff>0.01);
% dif=round(dif);cfaImage0=round(cfaImage0);
% pro=dif./cfaImage0;
% k=find(pro>0);
% t=pro(k);



% figure;imshow(double(diff)/max(double(diff(:))));
% k=2.;xc=0.5;r=1.;
% [image,TMOP]=TMO_pro_Fsac(img,TMOP,k,xc,r);
% % image=flip(permute(image,[2,1,3]),1);
% % figure;imshow(image)
% 
% [filepath,name,ext] = fileparts(fileName);
% tem=['_k',uint8(k*10),'_xc',uint8(xc*10),'_r',uint8(r*10)];
% rename=[name,tem,ext];
% Img_save=fullfile(filepath,rename);
% imwrite(uint16(image*65535),Img_save);

% [re,TMOP]=TMO_pro_Fsac_Inv(image,TMOP,k,xc,r);
% reCFA=CFAtoRGB_pre_Inv(re,TMOP);
% % diff=uint16(abs(reCFA-cfaImage));
% cfaImage2=cfaImage0-TMOP.blackLevel;
% diff=uint16(abs(reCFA-cfaImage2));
% max(diff(:))
% max(abs(reCFA(:)-cfaImage(:)))
% Img_save='D:\CFAtoRGB\save\re.png';
% imwrite(uint16(image*65535),Img_save)