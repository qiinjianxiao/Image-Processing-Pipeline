clear all;
path='F:\photo\test\figure\five\nr\re\DSC_0053.dng';
save_re='F:\photo\test\figure\five\nr\re\re';
files=dir(path);
tka=[];tkr=[];tkb=[];tkg1=[];tkg2=[];gtka=[];gtkg1=[];gtkg2=[];BL=[];WLo=[];WL=[];maxVcfa=[];BWLo=[];BWL=[];Pixel_num=[];WB=[];
con_n=[];
for nn=1:length(files)
    nn
    fileName=fullfile(files(nn).folder,files(nn).name);
    RawInfo=imfinfo(fileName);
    blackLevel = RawInfo.SubIFDs{1, 1}.BlackLevel;
    TiffHandle=Tiff(fileName,'r');
    offsets=getTag(TiffHandle,'SubIFD');
    setSubDirectory(TiffHandle,offsets(1));
    cfaImage = double(rawread(fileName));
    if length(blackLevel)~=4
        con_n=[con_n;nn];
        continue;
    end
    [M,N]=size(cfaImage);
    if(rem(M,2)~=0||rem(N,2)~=0)
        con_n=[con_n;nn];
        continue;
    end
    BL=[BL;blackLevel];%%%bl
    org_white_level=RawInfo.SubIFDs{1, 1}.WhiteLevel-blackLevel(1);
    BWLo=[BWLo;org_white_level];%%org-BWL
    white_level=org_white_level*0.99;
    BWL=[BWL;white_level];%%%new-BWL
    num=RawInfo.SubIFDs{1, 1}.UnknownTags(2).Value;
    pattern=str_model(num);
    whiteBalance=RawInfo.AsShotNeutral;
    whiteBalance=1.0./whiteBalance;
    WB=[WB;whiteBalance];
    whiteBalance=rawpattern(whiteBalance,pattern);

    
    cfaImage = cfaImage - blackLevel(1);%%%new-cfa
    maxVcfa=[maxVcfa;max(cfaImage(:))];%%max-cfa
    whiteBalance = repmat(whiteBalance,M/2,N/2);
    cfaWB = cfaImage .* whiteBalance;%%wb-cfa
    [numWLR,numWLB,numWLG1,numWLG2]=thread_WL(cfaWB,org_white_level,pattern);
    all1=numWLR+numWLB+numWLG1+numWLG2;
    pixel=M*N;Pixel_num=[Pixel_num;pixel];
    tka=[tka;all1/pixel];tkr=[numWLR;numWLR/pixel];tkb=[tkb;numWLB/pixel];tkg1=[tkg1;numWLG1/pixel];tkg2=[tkg2;numWLG2/pixel];
    
    [numWLR,numWLB,numWLG1,numWLG2]=thread_WL(cfaWB,white_level,pattern);
    all2=numWLG1+numWLG2;
    gtka=[gtka;all2/pixel];gtkg1=[gtkg1;numWLG1/pixel];gtkg2=[gtkg2;numWLG2/pixel];
%     if (all1/all2)>5
%       copyfile(fileName,fullfile(save_re,files(nn).name));
%     end
end
function [numWLR,numWLB,numWLG1,numWLG2]=thread_WL(cfa,wl,pattern)
    RGGB=Down_Sampling(cfa,pattern);
    R=RGGB(:,:,1);G1=RGGB(:,:,2);
    G2=RGGB(:,:,3);B=RGGB(:,:,4);
    numWLR=length(find(R>wl));
    numWLB=length(find(B>wl));
    numWLG1=length(find(G1>wl));
    numWLG2=length(find(G2>wl));

    if isempty(numWLR)
        numWLR=0;
    end
    if isempty(numWLB)
        numWLB=0;
    end
    if isempty(numWLG1)
        numWLG1=0;
    end
    if isempty(numWLG2)
        numWLG2=0;
    end
end

