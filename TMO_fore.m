function [im,TMOP]=TMO_fore(tem,TMOP,Qfag)
[M,N,z]=size(tem);
f=1;
if z==3
    [lav, llav, m, maxy, miny, maxl, minl ] = GetTMOParameter(tem, 1 );
    im=zeros(M,N,3);
    maxt=max(max(max(tem)));
    if Qfag~=0
        m=TMOP.m;
        lav=TMOP.lav;
        maxt=TMOP.maxt;     
    end
    hdr255=tem./maxt.*255.0; 
    TMOP.lav=lav;
    TMOP.maxt=maxt;
    TMOP.m=m;
    TMOP.f=1;
    for ia=1:3
      img = tmo_mod2(hdr255(:,:,ia), lav, m, f, maxt ); %im
      im(:,:,ia)=img;
    end 
    
else
    [lav, llav, m, maxy, miny, maxl, minl] = GetTMOParameter(tem, 1);    
    maxt=max(max(tem));
    if Qfag~=0
        m=TMOP.m;
        lav=TMOP.lav;
        maxt=TMOP.maxt;     
    end
    hdr255=tem./maxt.*255.0; 
    TMOP.lav=lav;
    TMOP.maxt=maxt;
    TMOP.m=m;
    TMOP.f=1;
    im = tmo_mod2( hdr255, lav, m, f, maxt ); %im

end


