clc
close all
clear all
T=1;
Rb=4;
Nb=T*Rb;
Fc=20;
Fs=20*Fc;
Ts=1/Fs;
Nsps=Fs/Rb;
FS=Fs+Nsps;
TS=1/FS;
t=0:TS:T-TS;
bk=randi([0 1],1,Nb);
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
plot(t,DPSK,'k');
%///////Demolution////////
j=0;
for i=1:Nsps:Fs
    j=j+1;
    rec_bits(:,j)=sum(DPSK(i:Nsps*j).*DPSK(Nsps*j+1:Nsps*(j+1)));
end
results=rec_bits>0