function tem=Bmean(img,k)
[h,w,d]=size(img);
h8=floor(h/k);w8=floor(w/k);
tem=zeros(h8,w8,d);
for m=1:w8
    for n=1:h8
        for ia=1:d
            s=img(1+(n-1)*k:n*k,1+(m-1)*k:m*k,ia);
            tem(n,m,ia)=mean(mean(s,1),2);
        end
    end
end
