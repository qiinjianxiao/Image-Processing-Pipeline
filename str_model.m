function str=str_model(num)
R=find(num==0);
G=find(num==1);
B=find(num==2);
if R<G(1)&&R<B%RGGB
    str=['rggb'];
elseif B<G(1)&&G(1)<R
    str=['bggr'];
elseif G(1)<R&&R<B
    str=['grbg'];
elseif G(1)<B&&B<R
    str=['gbrg'];
end
    
    
