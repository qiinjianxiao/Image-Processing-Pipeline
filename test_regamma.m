clear all;
close all;
path='F:\photo\test\figure\eight';
files=dir(fullfile(path,'*.jpg'));
r=2.2;
for nn=1
    fileName=fullfile(files(nn).folder,files(nn).name);
    Img=imread(fileName);
    figure;imshow(Img);
    Img=double(Img);
    
    reImg=Img.^(2.4);
    maxV=max(reImg(:));
    minV=min(reImg(:));
    reImg=(reImg-minV)/(maxV-minV);
    figure;imshow(reImg);
    te=files(nn).name;
    te=te(1:end-3);
    te=[te,'_ga.png'];
    Img_save=fullfile(files(nn).folder,te);
    imwrite(uint16(reImg*65535),Img_save);
end