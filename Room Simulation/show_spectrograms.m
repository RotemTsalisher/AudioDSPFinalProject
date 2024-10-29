function show_spectrograms(ax_x, ax_out, x, out, fs)
    %% Parameters for spectrogram
    M = 128; % Window length
    g = hann(M, "periodic"); % Window function
    L = 0.75 * M; % Overlap length
    Ndft = 128; % Number of FFT points

    % Compute the spectrogram of the original signal
    [S_x, F_x, T_x, P_x] = spectrogram(x, g, L, Ndft, fs);
    P_x = abs(P_x); % Ensure we are working with magnitude values
    P_x = 10 * log10(P_x + 1e-10); % Convert to dB scale, avoiding log of zero

    % Plot the spectrogram of the original signal on the ax_x UIAxes
    imagesc(ax_x, T_x, F_x, P_x);
    axis(ax_x, 'xy'); % Ensure the frequency axis is vertical
    xlabel(ax_x, 'Time (s)');
    ylabel(ax_x, 'Frequency (Hz)');
    title(ax_x, 'Spectrogram of Original Signal');
    colorbar(ax_x);
    axis(ax_x, 'tight'); % Adjust axis limits to fit the data tightly

    % Compute the spectrogram of the processed signal
    [S_out, F_out, T_out, P_out] = spectrogram(out, g, L, Ndft, fs);
    P_out = abs(P_out); % Ensure we are working with magnitude values
    P_out = 10 * log10(P_out + 1e-10); % Convert to dB scale, avoiding log of zero

    % Plot the spectrogram of the processed signal on the ax_out UIAxes
    imagesc(ax_out, T_out, F_out, P_out);
    axis(ax_out, 'xy'); % Ensure the frequency axis is vertical
    xlabel(ax_out, 'Time (s)');
    ylabel(ax_out, 'Frequency (Hz)');
    title(ax_out, 'Spectrogram of Processed Signal');
    colorbar(ax_out);
    axis(ax_out, 'tight'); % Adjust axis limits to fit the data tightly
end
