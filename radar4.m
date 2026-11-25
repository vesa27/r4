clear; clc; close all;

range = 0:0.1:100;

clutter_sweep1 = 8 * exp(-((range - 20)/1.2).^2) + 8 * exp(-((range - 75)/1.2).^2);
clutter_sweep2 = clutter_sweep1;

stat_target_sweep1 = 7 * exp(-((range - 50)/1.2).^2);
stat_target_sweep2 = 7 * exp(-((range - 50)/1.2).^2);

mov_target_sweep1 = 7 * exp(-((range - 35)/1.2).^2);
mov_target_sweep2 = 7 * exp(-((range - 40)/1.2).^2);

sweep1 = clutter_sweep1 + stat_target_sweep1 + mov_target_sweep1;
sweep2 = clutter_sweep2 + stat_target_sweep2 + mov_target_sweep2;

mti_output = abs(sweep1 - sweep2);

figure('Name', 'MTI Radar: Clutter vs Stationary vs Moving', 'Color', 'w');

subplot(3,1,1);
plot(range, sweep1, 'b', 'LineWidth', 1.5);
title('1. Sweep 1: Clutter (20, 75 km), Stationary Target (50 km), Moving Target (35 km)', 'Color', 'k');
xlabel('Distance / Range (km)', 'Color', 'k');
ylabel('Amplitude (V)', 'Color', 'k');
ylim([0 10]); grid on;
set(gca, 'Color', 'w', 'XColor', 'k', 'YColor', 'k');

subplot(3,1,2);
plot(range, sweep2, 'r', 'LineWidth', 1.5);
title('2. Sweep 2 (Delayed): Clutter & Stationary Target Unchanged, Moving Target Shifted to 40 km', 'Color', 'k');
xlabel('Distance / Range (km)', 'Color', 'k');
ylabel('Amplitude (V)', 'Color', 'k');
ylim([0 10]); grid on;
set(gca, 'Color', 'w', 'XColor', 'k', 'YColor', 'k');

subplot(3,1,3);
plot(range, mti_output, 'k', 'LineWidth', 1.8);
title('3. MTI Output: Clutter & Stationary Targets Cancelled (0 V), Only Moving Target Detected', 'Color', 'k');
xlabel('Distance / Range (km)', 'Color', 'k');
ylabel('Amplitude (V)', 'Color', 'k');
ylim([0 10]); grid on;
set(gca, 'Color', 'w', 'XColor', 'k', 'YColor', 'k');
