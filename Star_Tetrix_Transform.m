function cfa=Star_Tetrix_Transform(cfa,wb,wr)
cfa=array_extern_symmetric(cfa, 1);
h=2;w=2;
Gavg=0.25*(cfa(h-1:2:end-2,w:2:end-1)+cfa(h+1:2:end,w:2:end-1)+cfa(h:2:end-1,w-1:2:end-2)+cfa(h:2:end-1,w+1:2:end));
Cr=cfa(h:2:end-1,w:2:end-1)-Gavg;
cfa(h:2:end-1,w:2:end-1)=Cr;
h=3;w=3;
Gavg=0.25*(cfa(h-1:2:end-2,w:2:end-1)+cfa(h+1:2:end,w:2:end-1)+cfa(h:2:end-1,w-1:2:end-2)+cfa(h:2:end-1,w+1:2:end));
Cb=cfa(h:2:end-1,w:2:end-1)-Gavg;
cfa(h:2:end-1,w:2:end-1)=Cb;
cfa=cfa(2:end-1,2:end-1);
cfa=array_extern_symmetric(cfa,1);
h=2;w=3;
Y1=cfa(h:2:end-1,w:2:end-1)+0.125*(2^wr*(cfa(h-1:2:end-2,w:2:end-1)+cfa(h+1:2:end,w:2:end-1))+2^wb*(cfa(h:2:end-1,w-1:2:end-2)+cfa(h:2:end-1,w+1:2:end)));
cfa(h:2:end-1,w:2:end-1)=Y1;
h=3;w=2;
Y2=cfa(h:2:end-1,w:2:end-1)+0.125*(2^wr*(cfa(h:2:end-1,w-1:2:end-2)+cfa(h:2:end-1,w+1:2:end))+2^wb*(cfa(h-1:2:end-2,w:2:end-1)+cfa(h+1:2:end,w:2:end-1)));
cfa(h:2:end-1,w:2:end-1)=Y2;
cfa=cfa(2:end-1,2:end-1);
cfa=array_extern_symmetric(cfa,1);
h=2;w=3;
Y2avg=0.25*(cfa(h-1:2:end-2,w-1:2:end-2)+cfa(h+1:2:end,w+1:2:end)+cfa(h-1:2:end-2,w-1:2:end-2)+cfa(h+1:2:end,w+1:2:end));
dif=Y1-Y2avg;

h=2;w=3;
cfa(h:2:end-1,w:2:end-1)=dif;
cfa=cfa(2:end-1,2:end-1);
cfa=array_extern_symmetric(cfa,1);
h=3;w=2;
Davg=0.125*(cfa(h-1:2:end-2,w-1:2:end-2)+cfa(h+1:2:end,w+1:2:end)+cfa(h-1:2:end-2,w-1:2:end-2)+cfa(h+1:2:end,w+1:2:end));
Yavg=Y2+Davg;
cfa(h:2:end-1,w:2:end-1)=Yavg;
cfa=cfa(2:end-1,2:end-1);













