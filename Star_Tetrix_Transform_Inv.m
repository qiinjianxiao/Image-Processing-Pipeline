function rcfa=Star_Tetrix_Transform_Inv(rcfa,wb,wr)
rcfa=array_extern_symmetric(rcfa,1);
h=3;w=2;
rYavg=rcfa(h:2:end-1,w:2:end-1);
h=3;w=2;
rDavg=0.125*(rcfa(h-1:2:end-2,w-1:2:end-2)+rcfa(h+1:2:end,w+1:2:end)+rcfa(h-1:2:end-2,w-1:2:end-2)+rcfa(h+1:2:end,w+1:2:end));
rY2=rYavg-rDavg;

rcfa(h:2:end-1,w:2:end-1)=rY2;
rcfa=rcfa(2:end-1,2:end-1);
rcfa=array_extern_symmetric(rcfa,1);
h=2;w=3;
rdif=rcfa(h:2:end-1,w:2:end-1);
h=2;w=3;
rY2avg=0.25*(rcfa(h-1:2:end-2,w-1:2:end-2)+rcfa(h+1:2:end,w+1:2:end)+rcfa(h-1:2:end-2,w-1:2:end-2)+rcfa(h+1:2:end,w+1:2:end));
rY1=rdif+rY2avg;

rcfa(h:2:end-1,w:2:end-1)=rY1;
rcfa=rcfa(2:end-1,2:end-1);
rcfa=array_extern_symmetric(rcfa,1);
h=2;w=2;
rCr=rcfa(h:2:end-1,w:2:end-1);
h=3;w=3;
rCb=rcfa(h:2:end-1,w:2:end-1);

h=2;w=3;
rcfa(h:2:end-1,w:2:end-1)=rY1-0.125*(2^wr*(rcfa(h-1:2:end-2,w:2:end-1)+rcfa(h+1:2:end,w:2:end-1))+2^wb*(rcfa(h:2:end-1,w-1:2:end-2)+rcfa(h:2:end-1,w+1:2:end)));
h=3;w=2;
rcfa(h:2:end-1,w:2:end-1)=rY2-0.125*(2^wr*(rcfa(h:2:end-1,w-1:2:end-2)+rcfa(h:2:end-1,w+1:2:end))+2^wb*(rcfa(h-1:2:end-2,w:2:end-1)+rcfa(h+1:2:end,w:2:end-1)));
rcfa=rcfa(2:end-1,2:end-1);
rcfa=array_extern_symmetric(rcfa,1);
h=3;w=3;
rGavg=0.25*(rcfa(h-1:2:end-2,w:2:end-1)+rcfa(h+1:2:end,w:2:end-1)+rcfa(h:2:end-1,w-1:2:end-2)+rcfa(h:2:end-1,w+1:2:end));
rcfa(h:2:end-1,w:2:end-1)=rCb+rGavg;
h=2;w=2;
rGavg=0.25*(rcfa(h-1:2:end-2,w:2:end-1)+rcfa(h+1:2:end,w:2:end-1)+rcfa(h:2:end-1,w-1:2:end-2)+rcfa(h:2:end-1,w+1:2:end));
rcfa(h:2:end-1,w:2:end-1)=rCr+rGavg;
rcfa=rcfa(2:end-1,2:end-1);