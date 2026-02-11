#  Noise in Communication System

# Signal Denoising Experiment
**Author:** Sandesh
**Course:** IoT Bachelor

## Objective
To simulate adding Gaussian White Noise to a signal and removing it using a Butterworth Low-pass filter.

## Results
- **Original Signal:** A clean 5Hz sine wave.
- **Noisy Signal:** Added random fluctuations (Standard Deviation = 0.5).
- **Filtered Signal:** Successfully recovered the sine wave shape by cutting off frequencies above 10Hz.

## Evaluation
I observed that if the `cutoff_frequency` is too low (e.g., 2Hz), the signal disappears. If it is too high (e.g., 100Hz), the noise remains. The best results occur when the cutoff is slightly higher than the signal frequency.
