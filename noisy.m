function noisy_signal = noisy(DPSK,snr)
    noisy_signal=awgn(DPSK,snr);
end