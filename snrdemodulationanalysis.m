%% SNR and Demodulation Performance Analysis - Sandesh
clear; clc; close all;

% 1. Parameters
fs = 1000;          % Sampling frequency (Hz)
t = 0:1/fs:1;       % Time vector
f_c = 50;           % Carrier frequency (Hz)
snr_values = [10, 5, 0, -5]; % SNR values in dB

% 2. Generate Binary Message Signal
% Note: Using a slightly slower bit rate for visual clarity
bits = randi([0 1], 1, 10); 
message_signal = repelem(bits, floor(length(t)/length(bits))+1);
message_signal = message_signal(1:length(t));

% 3. ASK Modulation
carrier = sin(2 * pi * f_c * t);
modulated_signal = message_signal .* carrier;

% 4. Add Noise and Demodulate for each SNR
figure('Name', 'SNR Impact on Demodulation');

for i = 1:length(snr_values)
    % Add AWGN Noise
    received_signal = awgn(modulated_signal, snr_values(i), 'measured');
    
    % Simple Demodulation (Envelope Detection + Threshold)
    demodulated_env = abs(hilbert(received_signal));
    recovered_bits = demodulated_env > 0.5; % Threshold at 0.5
    
    % Plotting
    subplot(4, 1, i);
    plot(t, received_signal, 'r', 'DisplayName', 'Received'); hold on;
    plot(t, recovered_bits, 'b', 'LineWidth', 1.5, 'DisplayName', 'Demodulated');
    title(['SNR = ', num2str(snr_values(i)), ' dB']);
    ylabel('Amp');
    if i == 4, xlabel('Time (s)'); end
    legend('Location', 'northeast');
    grid on;
end