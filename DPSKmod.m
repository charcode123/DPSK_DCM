function DPSK = DPSKmod(Nb,Fc,bk,Nsps,t)
    ref=1;
    for i=1:Nb
        ref=not(xor(ref,bk(i)));
        dk(:,i)=ref;
    end
    dk=[1 dk];
    NRZ=2*dk-1;
    Pulse=ones(Nsps,1);
    NRZ_W=reshape(Pulse*NRZ,1,[]);
    C=sin(2*pi*Fc*t);
    DPSK=NRZ_W.*C;
end