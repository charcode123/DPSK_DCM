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
%bk=randi([0 1],1,Nb);
bk=[1,0,1,1]
Dpsk=DPSKmod(Nb,Fc,bk,Nsps,t);
plot(t,Dpsk,'k');
Noise_dpsk=noisy(Dpsk,0);
plot(t,Noise_dpsk,'k');
Rec_bk=DPSKdemod(Noise_dpsk,Nsps,Fs)
