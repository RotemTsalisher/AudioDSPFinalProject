function filter_sig(sig , gains,coef_mat,fs,sys_fs)
    
    w_ = sig;
    for i = [1:7]
        if(gains(i) ~= 0)
            w_ = filter(coef_mat(2*i-1,:),coef_mat(2*i,:),w_); 
        end
    end

    y = w_;

    plt_spectrogram(y,sys_fs);
    sound(y,fs); % Play the filtered signal

end