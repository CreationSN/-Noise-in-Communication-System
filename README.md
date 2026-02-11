#  Noise in Communication System
**Author:** Sandesh
**Course:** IoT Bachelor

# Thermal Noise Generation

Time Domain Variation
When running the MATLAB script, the noise appears as random voltage fluctuations over time.

Gaussian Distribution: The amplitude of the noise follows a normal distribution. Most values stay near 0V, but random "spikes" occur.

Physical Link: I observed that increasing the Temperature (T) or Resistance (R) directly increases the vertical height (amplitude) of these spikes.

Power Spectral Density (PSD) Analysis
The pwelch function was used to calculate the PSD, which shows how noise power is distributed across the frequency spectrum.

Flatness: The semilogx plot shows a relatively horizontal line. This confirms that thermal noise is "White Noise," containing equal power across all frequencies in the bandwidth.

Noise Floor: This horizontal line represents the "noise floor." In IoT sensor design, it is critical that the actual sensor signal is significantly higher than this line to ensure the data is readable and accurate.


# Signal Denoising Experiment

## Objective
To simulate adding Gaussian White Noise to a signal and removing it using a Butterworth Low-pass filter.

## Results
- **Original Signal:** A clean 5Hz sine wave.
- **Noisy Signal:** Added random fluctuations (Standard Deviation = 0.5).
- **Filtered Signal:** Successfully recovered the sine wave shape by cutting off frequencies above 10Hz.

## Evaluation
I observed that if the `cutoff_frequency` is too low (e.g., 2Hz), the signal disappears. If it is too high (e.g., 100Hz), the noise remains. The best results occur when the cutoff is slightly higher than the signal frequency.

#Impact of SNR on Communication Performance

##Objective
To investigate how varying the Signal-to-Noise Ratio (SNR) affects the ability of a receiver to correctly demodulate an Amplitude Shift Keying (ASK) signal.

##Observations
High SNR (10 dB): The demodulated signal is very clean and matches the original message almost perfectly.

Medium SNR (5 dB to 0 dB): The received signal starts looking "fuzzy." Small spikes might appear where there should be a '0'.

Low SNR (-5 dB): The noise power is higher than the signal power. The demodulator fails, creating "bit errors" (interpreting a 0 as a 1 or vice-versa).

##Evaluation
In IoT systems, devices often operate in "noisy" environments (like factories). This experiment proves that if the SNR drops too low, the data received from a sensor will be wrong. This is why we use error-correction codes or higher transmission power to maintain a high SNR.
