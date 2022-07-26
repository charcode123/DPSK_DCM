clc
close all
clear all
T=1;
Rb=8;
Nb=T*Rb;
Fc=20;
Fs=20*Fc;
Ts=1/Fs;
Nsps=Fs/Rb;
FS=Fs+Nsps;
TS=1/FS;
t=0:TS:T-TS;
t1=0:Ts:T-Ts;
%bk=randi([0 1],1,Nb);
bk=[1,0,1,1,0,1,1,0]
pulse=ones(Nsps,1);
bk_W=reshape(pulse*bk,1,[]);
%plot(t1,bk_W);
Dpsk=DPSKmod(Nb,Fc,bk,Nsps,t);
%plot(t,Dpsk,'k');
Noise_dpsk=noisy(Dpsk,15);
%plot(t,Noise_dpsk,'k');
Rec_bk=DPSKdemod(Noise_dpsk,Nsps,Fs)
Rec_bk_W=reshape(pulse*Rec_bk,1,[]);
plot(t1,Rec_bk_W)

