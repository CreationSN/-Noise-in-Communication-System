%% Signal Noise Addition and Removal - Sandesh
clear; clc; close all;

% 1. Parameters
fs = 1000;          % Sampling frequency (Hz)
t = 0:1/fs:1;       % Time vector (1 second)
f_signal = 5;       % Signal frequency (5 Hz)
amplitude = 1;      % Signal amplitude

% 2. Generate Original Sinusoidal Signal
original_signal = amplitude * sin(2 * pi * f_signal * t);

% 3. Add Gaussian White Noise
noise_level = 0.5;  % Adjust this to make it noisier
noise = noise_level * randn(size(t));
noisy_signal = original_signal + noise;

% 4. Low-pass Butterworth Filter
cutoff_frequency = 10; % Hz
order = 4;             % Filter order
[b, a] = butter(order, cutoff_frequency / (fs/2), 'low');
filtered_signal = filter(b, a, noisy_signal);

% 5. Plotting Results
figure;

% Original Signal
subplot(3,1,1);
plot(t, original_signal, 'LineWidth', 1.5);
title('Original Clean Signal (5 Hz)');
ylabel('Amplitude'); grid on;

% Noisy Signal
subplot(3,1,2);
plot(t, noisy_signal, 'Color', [0.8 0.3 0.3]);
title('Signal + Gaussian White Noise');
ylabel('Amplitude'); grid on;

% Filtered Signal
subplot(3,1,3);
plot(t, filtered_signal, 'g', 'LineWidth', 1.5);
title(['Filtered Signal (Low-pass Cutoff: ', num26str(cutoff_frequency), ' Hz)']);
xlabel('Time (seconds)'); ylabel('Amplitude'); grid on;