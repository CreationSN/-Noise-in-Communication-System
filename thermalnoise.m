%% Thermal Noise Simulation - Sandesh
clear; clc; close all;

% 1. Parameters
B = 1e6;            % Bandwidth: 1 MHz
R = 100;            % Resistance: 100 Ohms
T = 300;            % Temperature: 300 Kelvin
k = 1.38e-23;       % Boltzmann Constant
n_samples = 10000;  % Number of samples

% 2. Generate Thermal Noise
% Formula: V_rms = sqrt(4 * k * T * R * B)
v_rms = sqrt(4 * k * T * R * B);
time = 0 : 1/B : (n_samples-1) / B;
thermal_noise = v_rms * randn(1, n_samples);

% 3. Plotting in Time Domain
figure;
subplot(2,1,1);
plot(time, thermal_noise);
title('Thermal Noise in Time Domain');
xlabel('Time (seconds)');
ylabel('Amplitude (Volts)');
grid on;

% 4. Power Spectral Density (PSD) Analysis
[psd, freq] = pwelch(thermal_noise, [], [], [], B);

subplot(2,1,2);
semilogx(freq, 10*log10(psd));
title('Power Spectral Density (PSD)');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
grid on;

% 5. Statistical Check (Histogram)
figure;
histogram(thermal_noise, 50, 'Normalization', 'pdf');
title('Probability Distribution of Thermal Noise');
xlabel('Voltage');
ylabel('Probability');
