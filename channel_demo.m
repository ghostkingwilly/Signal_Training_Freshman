%% channel parameter 

% 910 GHz
freq = 910*10^6;
% 10 dBm
ampl = 10;
%distance 
d = 0:100;
% light speed
LS = 3 * 10^10;

t = d./LS;

phase = -2*j*pi * freq * t;

h = ampl* exp(phase)

figure();
plot(angle(h));
title("Phase")

figure();
plot(abs(h));
title("Amplitude")