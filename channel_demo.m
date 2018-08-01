%% channel parameter 
close all;
clear;

% set the default frequency 910 GHz
freq = 910*10^6;
% set the default amplitude 10 dBm
% and set an 1X100 random amplitude array from 5 to 20
ampl = 10;
ampl_ran = randi([5 20],1,100);

% distance from 1 to 100 cm
d = 1:100;
% light speed in cm/s
LS = 3 * 10^10;

% time = distance / light speed
t = d./LS;

%% calculate for phase 
% 1j for distinguish from variable to complex 
phase = -2*1j*pi * freq * t;

% constant channel and random channel with constant amplitude and random
% amplitude, respectively
h = ampl .* exp(phase);
h_ran = ampl_ran .* exp(phase);

%% Draw for the results

figure();
subplot(2,2,[1,2])
plot(h);
title("Static Raw Signal")

subplot(2,2,[3,4])
plot(h_ran);
title("Dynamic Raw Signal")

figure();
subplot(2,2,1)
plot(abs(h));
ylim([0 20]);
title("\color[rgb]{0 .5 .5}Constant Amplitude");

subplot(2,2,2)
plot(angle(h));
title("\color[rgb]{0 .5 1}Phase with Constant Amplitude");

subplot(2,2,3)
plot(abs(h_ran));
title("\color[rgb]{0 .5 .5}Dynamic Amplitude");

subplot(2,2,4)
plot(angle(h_ran));
title("\color[rgb]{0 .5 1}Phase with Dynamic Amplitude");
