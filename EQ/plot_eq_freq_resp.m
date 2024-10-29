function [] = plot_eq_freq_resp(ax_mag,ax_phase,coef_mat,fs,gains)
    duration = 1; N = fs*duration;
    f_ = fs/2*(0:N-1)/N;
    h_magnitude =  zeros(1,N);
    h_phase = zeros(1,N);

    for i = [1:7]
        if(gains(i)~=0)
            h = [freqz(coef_mat(2*i-1,:),coef_mat(2*i,:),fs)]';
            h_magnitude = h_magnitude + 20*log10(abs(h));
            h_phase = h_phase + angle(h);
        end
    end

    % h_magnitude = 20*log10(abs(h));
    plot(ax_mag,f_,h_magnitude); xlim(ax_mag,[0,24000]); ylim(ax_mag,[-25,25]); grid(ax_mag,'on');
    plot(ax_phase,f_,h_phase); xlim(ax_phase,[0,24000]); ylim(ax_phase,[-pi,pi]); grid(ax_phase,'on');
end