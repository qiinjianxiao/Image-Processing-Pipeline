clear all
path='F:\photo\test\figure\three';
files=dir(fullfile(path,'*.jpg'));
for nn=1:length(files)
    fullname=fullfile(files(nn).folder,files(nn).name);
    Img0=imread(fullname);
    k=4;
    Img0=double(Img0)/255;
    Img1=Bmean(Img0,k);
    Img1=Img1*255;
    Img1=Img1/max(Img1(:));
    Img2=uint8(Img1*255);
    rgb=imresize(Img2,0.25);

    Img_save=fullfile(files(nn).folder,'res',files(nn).name);
    imwrite(rgb,Img_save);
end