clear;
%clc;
close all;
%% parameter

% frequency(900MHz)
FREQ = 900 * 10^6;
% light speed
LS = 3 * 10^10;%(cm/s)

% mode (0 : linear; 1 : random)
mod = 0;
% time stamp
ts = 300;
% spread
walk_des = 0.1;
% set the plane size 
PLOT_SIZE = 1000;

% reference point
ref_xi = 0;
ref_yi = 0;

% setting starting index of obj and hand
obj_or_xi = 10;
obj_or_yi = 5;

hand_or_xi = 5;
hand_or_yi = -7;

%% plane with straight line

% reference point
ref = [ref_xi, ref_yi];
% subject initial point
o1 = [obj_or_xi, obj_or_yi];
% hand initial point
h1 = [hand_or_xi, hand_or_yi];

% slope and shift
slope1 = 2;
y_shift1 = obj_or_yi - slope1 * (obj_or_xi);

slope2 = -2;
y_shift2 = hand_or_yi - slope2 * (hand_or_xi);

xi_1 = (obj_or_xi+walk_des:walk_des:obj_or_xi+ts);
xi_2 = (hand_or_xi+walk_des:walk_des:hand_or_xi+ts);

% object trajectory 

if(mod == 0) % linear
    yi_1 = slope1 * xi_1 + y_shift1;
    yi_2 = slope2 * xi_2 + y_shift2;
    
elseif(mod == 1) % random
    ran_1 = 4;
    ran_2 = 4;
    yi_1 = rand(1,ts/walk_des)*ran_1 + (obj_or_yi-ran_1/2);
    yi_2 = rand(1,ts/walk_des)*ran_2 + (hand_or_yi-ran_2/2);
    
end

obj_mov = [xi_1; yi_1];
hand_mov = [xi_2; yi_2];

%% calculate

% distance
Ref2obj = norm(abs(o1-ref));
Ref2hand = norm(abs(h1-ref));
Ref2obj_h = norm(abs(o1-[ref_xi, obj_or_yi]));
Ref2han_h = norm(abs(h1-[ref_xi, hand_or_yi]));

Ref2obj_tra = obj_mov - ref.';
Ref2han_tra = hand_mov - ref.';
%hand2obj_tra = obj_mov - hand_mov;
tmp_ref = ones(1,ts/walk_des) .* ref_xi;
ref2obj_tra = obj_mov - [tmp_ref;yi_1];
ref2han_tra = hand_mov - [tmp_ref;yi_2];

% The two-norm of each column
Ref2obj_dis = sqrt(sum(abs(Ref2obj_tra).^2,1));
Ref2han_dis = sqrt(sum(abs(Ref2han_tra).^2,1));
ref2obj_dis = sqrt(sum(abs(ref2obj_tra).^2,1));
ref2han_dis = sqrt(sum(abs(ref2han_tra).^2,1));

% ref angle
theta = (abs(angle(asin(Ref2obj / Ref2obj_h)))+abs(angle(asin(Ref2hand / Ref2han_h))))*180/pi;
theta_tra = (abs(angle(asin(Ref2obj_dis ./ ref2obj_dis))) + abs(angle(asin(Ref2han_dis ./ ref2han_dis)))).*180./pi;

% TODO : time = d/3*10^8
Ref2obj_t = Ref2obj / LS;
Ref2hand_t = Ref2hand / LS;
Ref2obj_dis_t = Ref2obj_dis ./LS;
Ref2han_dis_t = Ref2han_dis ./LS;

% TODO : phase = -2*pi*freq*time
alt_up = -2 * pi * FREQ * i
Ref2obj_p = angle((alt_up * Ref2obj_t));
Ref2hand_p = angle(alt_up * Ref2hand_t);
Ref2obj_dis_p = angle(exp(alt_up .* Ref2obj_dis_t));
Ref2han_dis_p = angle(exp(alt_up .* Ref2han_dis_t));

%% plot 

xlim([0 length(PLOT_SIZE)]);
ylim([0 length(PLOT_SIZE)]);

ini_x = [ref_xi, obj_or_xi, hand_or_xi];
ini_y = [ref_yi, obj_or_yi, hand_or_yi];
plot(ini_x, ini_y, 'o');
hold on;

plot(xi_1, yi_1, '.');
hold on;
plot(xi_2, yi_2, '.');
hold on;
grid on;
title('Trajectory');

figure();
plot(Ref2obj_dis_p,'r');
hold on;
plot(Ref2han_dis_p, 'bl');
title('Phase change');

figure();
plot(theta_tra);
title('Angle of Trajectory');


