function [ rgb_image ] = Ma_demosaic( cfa_image, pattern ,maxc)
    kernel_g_rb = [0 0 -1 0 0;
                   0 0 2 0 0;
                   -1 2 4 2 -1;
                   0 0 2 0 0;
                   0 0 -1 0 0] / 8;
   kernel_rb_g0 = [ 0 0 1/2 0 0;
                     0 -1 0 -1 0;
                     -1 4 5 4 -1;
                     0 -1 0 -1 0;
                     0 0 1/2 0 0] / 8;
   kernel_rb_g1 = kernel_rb_g0';
   kernel_br = [ 0 0 -3/2 0 0;
                    0 2 0 2 0;
                    -3/2 0 6 0 -3/2;
                    0 2 0 2 0;
                    0 0 -3/2 0 0] / 8;
   padded_cfa = array_extern_symmetric(cfa_image, 2);
   filter_cfa_g_rb = filter2(kernel_g_rb, padded_cfa, 'valid');
   filter_cfa_rb_g0 = filter2(kernel_rb_g0, padded_cfa, 'valid');
   filter_cfa_rb_g1 = filter2(kernel_rb_g1, padded_cfa, 'valid');
   filter_cfa_rb = filter2(kernel_br, padded_cfa, 'valid');
   rgb_image = zeros(size(cfa_image,1),size(cfa_image,2),3);
   
    if strcmp(pattern,'rggb')||strcmp(pattern,'RGGB')
       % g channel
       rgb_image(:,:,2) = cfa_image;
       rgb_image(1:2:end,1:2:end,2) = filter_cfa_g_rb(1:2:end,1:2:end);
       rgb_image(2:2:end,2:2:end,2) = filter_cfa_g_rb(2:2:end,2:2:end);
       % r channel
       rgb_image(:,:,1) = cfa_image;
       rgb_image(1:2:end,2:2:end,1) = filter_cfa_rb_g0(1:2:end,2:2:end);
       rgb_image(2:2:end,1:2:end,1) = filter_cfa_rb_g1(2:2:end,1:2:end);
       rgb_image(2:2:end,2:2:end,1) = filter_cfa_rb(2:2:end,2:2:end);
       % b channel
       rgb_image(:,:,3) = cfa_image;
       rgb_image(1:2:end,2:2:end,3) = filter_cfa_rb_g1(1:2:end,2:2:end);
       rgb_image(2:2:end,1:2:end,3) = filter_cfa_rb_g0(2:2:end,1:2:end);
       rgb_image(1:2:end,1:2:end,3) = filter_cfa_rb(1:2:end,1:2:end);
        rgb_image(rgb_image<0)=0;
    elseif strcmp(pattern,'bggr')||strcmp(pattern,'BGGR')
       rgb_image = zeros(size(cfa_image,1),size(cfa_image,2),3);
       % g channel
       rgb_image(:,:,2) = cfa_image;
       rgb_image(1:2:end,1:2:end,2) = filter_cfa_g_rb(1:2:end,1:2:end);
       rgb_image(2:2:end,2:2:end,2) = filter_cfa_g_rb(2:2:end,2:2:end);
       % r channel
       rgb_image(:,:,3) = cfa_image;
       rgb_image(1:2:end,2:2:end,3) = filter_cfa_rb_g0(1:2:end,2:2:end);
       rgb_image(2:2:end,1:2:end,3) = filter_cfa_rb_g1(2:2:end,1:2:end);
       rgb_image(2:2:end,2:2:end,3) = filter_cfa_rb(2:2:end,2:2:end);
       % b channel
       rgb_image(:,:,1) = cfa_image;
       rgb_image(1:2:end,2:2:end,1) = filter_cfa_rb_g1(1:2:end,2:2:end);
       rgb_image(2:2:end,1:2:end,1) = filter_cfa_rb_g0(2:2:end,1:2:end);
       rgb_image(1:2:end,1:2:end,1) = filter_cfa_rb(1:2:end,1:2:end);
        rgb_image(rgb_image<0)=0;
    elseif strcmp(pattern,'gbrg')||strcmp(pattern,'GBRG')
       rgb_image = zeros(size(cfa_image,1),size(cfa_image,2),3);
       % g channel
       rgb_image(:,:,2) = cfa_image;
       rgb_image(2:2:end,1:2:end,2) = filter_cfa_g_rb(2:2:end,1:2:end);
       rgb_image(1:2:end,2:2:end,2) = filter_cfa_g_rb(1:2:end,2:2:end);
       % r channel
       rgb_image(:,:,1) = cfa_image;
       rgb_image(1:2:end,1:2:end,1) = filter_cfa_rb_g1(1:2:end,1:2:end);
       rgb_image(2:2:end,2:2:end,1) = filter_cfa_rb_g0(2:2:end,2:2:end);
       rgb_image(1:2:end,2:2:end,1) = filter_cfa_rb(1:2:end,2:2:end);
       % b channel
       rgb_image(:,:,3) = cfa_image;
       rgb_image(1:2:end,1:2:end,3) = filter_cfa_rb_g0(1:2:end,1:2:end);
       rgb_image(2:2:end,2:2:end,3) = filter_cfa_rb_g1(2:2:end,2:2:end);
       rgb_image(2:2:end,1:2:end,3) = filter_cfa_rb(2:2:end,1:2:end);
        rgb_image(rgb_image<0)=0;
    elseif strcmp(pattern,'grbg')||strcmp(pattern,'GRBG')
       rgb_image = zeros(size(cfa_image,1),size(cfa_image,2),3);
       % g channel
       rgb_image(:,:,2) = cfa_image;
       rgb_image(2:2:end,1:2:end,2) = filter_cfa_g_rb(2:2:end,1:2:end);
       rgb_image(1:2:end,2:2:end,2) = filter_cfa_g_rb(1:2:end,2:2:end);
       % r channel
       rgb_image(:,:,1) = cfa_image;
       rgb_image(1:2:end,1:2:end,1) = filter_cfa_rb_g0(1:2:end,1:2:end);
       rgb_image(2:2:end,2:2:end,1) = filter_cfa_rb_g1(2:2:end,2:2:end);
       rgb_image(2:2:end,1:2:end,1) = filter_cfa_rb(2:2:end,1:2:end);
       % b channel
       rgb_image(:,:,3) = cfa_image;
       rgb_image(1:2:end,1:2:end,3) = filter_cfa_rb_g1(1:2:end,1:2:end);
       rgb_image(2:2:end,2:2:end,3) = filter_cfa_rb_g0(2:2:end,2:2:end);
       rgb_image(1:2:end,2:2:end,3) = filter_cfa_rb(1:2:end,2:2:end);
       rgb_image(rgb_image<0)=0;
    end
    if max(rgb_image(:))>maxc
        rgb_image(rgb_image>maxc)=maxc;
    end
end

