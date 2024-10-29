function filter_white_noise(gains,coef_mat,fs)
    duration = 2; % Duration of the white noise signal in seconds
    N = duration * fs; % Total number of samples

    % Generate white noise
    w_ = randn(N, 1);

    for i = [1:7]
        if(gains(i) ~= 0)
            w_ = filter(coef_mat(2*i-1,:),coef_mat(2*i,:),w_); 
        end
    end

    y = w_;
    sound(y, fs); % Play the generated white noise
    
    f_grid = (fs/N)*(0:N-1);
    Y = (1/N)*abs(fft(y)).^2; % compute filterd noise' PSD
    Y = 20*log(Y);
    Y = Y-max(Y); % normalize
    figure(1);
    plot(f_grid(1:length(Y)/2),Y(1:length(Y)/2)); grid on; title("filtered noise' PSD"); xlabel("f [hz]");

end