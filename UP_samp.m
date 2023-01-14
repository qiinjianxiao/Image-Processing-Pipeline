function RGB=UP_samp(img,k)
[m,n,z]=size(img);
RGB=zeros(m*k,n*k,z);
mask=ones(k,k);
for ix=1:m
    for iy=1:n
        for s=1:z
            te=img(iy,ix,s)*mask;
            RGB(1+(iy-1)*k:iy*k,1+(ix-1)*k:ix*k,s)=te;
        end
    end
end

