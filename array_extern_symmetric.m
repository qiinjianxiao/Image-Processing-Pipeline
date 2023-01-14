function rear= array_extern_symmetric( input, L)
    org = size(input);
    padded_sz = org + 2*L;
    rear = zeros(padded_sz);
    rear(L+1:L+org(1),L+1:L+org(2)) = input;
    rear(:,1:L) = rear(:,2*L+1:-1:L+2);
    rear(:,end-L+1:end) = rear(:,end-L-1:-1:end-2*L);
    rear(1:L,:) = rear(2*L+1:-1:L+2,:);
    rear(end-L+1:end,:) = rear(end-L-1:-1:end-L-L,:);
end