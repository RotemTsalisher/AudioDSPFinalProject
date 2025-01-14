function [] = plot_eq(ax,b,a,fs)
    duration = 1; N = fs*duration;
    f_ = fs/2*(0:N-1)/N;

    h = freqz(b,a,fs);
    h_magnitude = 20*log10(abs(h));
    plot(ax,f_,h_magnitude); xlim(ax,[0,24000]); ylim(ax,[-25,25]); grid(ax,'on');
end


