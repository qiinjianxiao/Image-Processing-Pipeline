% clear all;
path='F:\photo\test\figure\thirteen';
files=dir([path,'\*.png']);
for nn=1:length(files)
    fileName=fullfile(files(nn).folder,files(nn).name);
    imgs=imread(fileName);
    imgs=double(imgs)/65535;
%     img2=imgs(2400:6000,300:4000,:);
%     figure;imshow(img2);
    imgs=double(imgs);
%     imgs=flip(permute(imgs,[2,1,3]),1);
    [tem,shearWL]=girl_frame_pip(imgs,8);
%     tem=Bmean(imgs,16);
%     figure;imshow(tem/max(tem(:)))
    te=files(nn).name;
    te=te(1:end-4);
%     tem=flip(permute(tem,[2,1,3]),1);
%     imwrite(uint8(tem),fullfile(files(nn).folder,'region',[te,'_sh.png']));
%     imwrite(uint8(shearWL),fullfile(files(nn).folder,'region',[te,'WL.png']));
%     imwrite(uint8(shearWL2),fullfile(files(nn).folder,'region',[te,'WL2.png']));
    imwrite(uint16(tem*65535),fullfile(files(nn).folder,'region',[te,'_sh.png']));
    imwrite(uint16(shearWL*65535),fullfile(files(nn).folder,'region',[te,'WL.png']));
%     imwrite(uint16(shearWL2*65535),fullfile(files(nn).folder,'region',[te,'WL2.png']));
end



