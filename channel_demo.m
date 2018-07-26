%% channel parameter 
close all;
clear;
% 910 GHz
freq = 910*10^6;
% 10 dBm
ampl = 10;
ampl_ran = randi([5 20],1,100);
%distance 
d = 1:100;
% light speed
LS = 3 * 10^10;

t = d./LS;

phase = -2*1j*pi * freq * t;

h = ampl .* exp(phase);
h_ran = ampl_ran .* exp(phase);

figure();
plot(h_ran);
title("Raw Signal")

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
title("\color[rgb]{0 .5 1}Phase with Unconstant Amplitude");
