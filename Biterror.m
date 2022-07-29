M=2;
k=log2(M);
EbNoVec=(5:15)';
numSymPerFrame=100;

berEst=zeros(size(EbNovec));

for n=1:length(EbNovec)
    snrdB=EbNoVec(n)+10*log10(k);
    numErrs=0;
    numBits=0;
    while numErrs <200 && numBits < 1e7
        dataIn=randi([0 1],numSymPerFrame,k);
        dataSyn=bi2de(dataIn);
        txSig=dpskmod(dataSyn,M);
        rxSig=awgn(txSig,snrdB,'measured');
        rxSym=dpskdemod(rxSig,M);
        dataOut=de2bi(rxSym,k);
        nErrors=biterr(dataIn,dataOut);
        numErrs=numErrs+nErrors;
        numBits=numBits+numSymPerFrame*k;
    end
    berEst(n)=numErrs/numBits;
end
berTheory = berawgn(EbNoVec,'dpsk',M);
semilogy(EbNoVec,berEst,'*')
hold on
semilogy(EbNoVec,berTheory)
grid
legend('Estimated BER','Theoretical BER')
xlabel('Eb/No (dB)')
ylabel('Bit Error Rate')
