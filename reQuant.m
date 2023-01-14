function [cfarQuadr,thred,level]=reQuant(cfas,reQ,reQmethod,nbit)

Im=max(cfas(:));
if reQ==2
    [cfarQuadr,thred,level]=reQuantization1(cfas,reQmethod,nbit,Im);%%%new 
elseif reQ==3
    [cfarQuadr,thred,level]=reQuantization3(cfas,reQmethod,nbit,Im);
elseif reQ==4
    [cfarQuadr,thred,level]=reQuantization4(cfas,reQmethod,nbit,Im);
elseif reQ==5
    [cfarQuadr,thred,level]=reQuantization5(cfas,reQmethod,nbit,Im);
elseif reQ==6
    [cfarQuadr,thred,level]=reQuantization2D(cfas,reQmethod,nbit,Im);
end
cfarQuadr(cfarQuadr<0)=0;
