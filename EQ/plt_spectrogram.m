function [] = plt_spectrogram(sig,fs)
    figure(1);
    windowLength = 1024; 
    overlap = 512; 
    nfft = 1024; 
    spectrogram(sig, windowLength, overlap, nfft, fs, 'yaxis');
    title('Spectrogram');
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    colorbar;
end 