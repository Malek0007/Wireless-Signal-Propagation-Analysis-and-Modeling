# Wireless Signal Propagation Analysis and Modeling

## Project Overview

This project focuses on the analysis and modeling of signal propagation in wireless communication. Specifically, it aims to understand how signal strength decays over distance in various environments. The primary objective is to calculate key parameters like path loss, propagation exponent, and standard deviation under both Line-Of-Sight (LOS) and Non-Line-Of-Sight (NLOS) conditions.

## Key Concepts

### 1. **Path Loss**
Path loss refers to the reduction in signal strength as the signal travels from the transmitter to the receiver. It is a critical factor in wireless communication that can significantly impact network performance. Path loss is calculated using a reference distance and frequency.

### 2. **Propagation Exponent (Alpha)**
The propagation exponent (α) describes how rapidly the signal strength decreases with distance. It varies for different environments:
- **LOS (Line-Of-Sight):** A clear, unobstructed path between the transmitter and receiver.
- **NLOS (Non-Line-Of-Sight):** Obstacles partially or fully block the path, causing signal attenuation.

### 3. **Standard Deviation (Sigma)**
Sigma represents the level of unpredictability in signal strength. It measures how much the actual signal strength deviates from the expected path loss model, indicating the variance in signal behavior due to environmental factors.

## Environments Considered

- **Line-Of-Sight (LOS):** The transmitter and receiver have an unobstructed path, meaning the signal travels directly without interference.
- **Non-Line-Of-Sight (NLOS):** Obstacles such as buildings, trees, or other structures block or partially obscure the signal, leading to greater signal attenuation.

## Data Handling

The project uses measurement data from both LOS and NLOS conditions. This data is adjusted and analyzed to compute:
- **Path Loss** for both environments.
- **Propagation Exponent (Alpha)** to quantify the rate at which signal strength decreases with distance.
- **Standard Deviation (Sigma)** to indicate the variance in signal strength from the expected model.

## Key Calculations

- **Path Loss Calculation**: The reduction in signal strength over distance, modeled as:
  \[
  \text{Path Loss} = \text{Reference Loss} + 10 \times \alpha \times \log_{10}\left(\frac{d}{d_0}\right)
  \]
  where:
  - \(d\) is the distance between the transmitter and receiver.
  - \(d_0\) is the reference distance.
  - \(\alpha\) is the propagation exponent.

- **Propagation Exponent (Alpha)**: Describes the rate of signal decay with distance, and it differs between LOS and NLOS conditions.

- **Standard Deviation (Sigma)**: Measures how much the signal strength varies from the expected path loss model.

## Running the Analysis

To run the analysis and generate the models:
1. **Prepare the data**: Ensure you have measurement data for LOS and NLOS conditions.
2. **Calculate path loss**: Use the provided formulas to compute the path loss.
3. **Compute propagation exponent (Alpha)**: Analyze the data to calculate the value of \(\alpha\) for both LOS and NLOS environments.
4. **Calculate standard deviation (Sigma)**: Compute the standard deviation to assess the signal's variability.
