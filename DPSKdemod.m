function result = DPSKdemod(DPSK,Nsps,Fs)
    j=0
    for i=1:Nsps:Fs
        j=j+1;
        rec_bits(:,j)=sum(DPSK(i:Nsps*j).*DPSK(Nsps*j+1:Nsps*(j+1)));
    end
    result=rec_bits>0;
end
