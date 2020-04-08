close all
clearvars
addpath(genpath("../../GlobalFunctions/"));
raw_data = LTspice2Matlab("./ltspice/nexp.raw");
raw_data.variable_name_list;
var = raw_data.variable_mat;

V1 = var(2,:,1);

V2_4 = var(9,:,1);
I1_4_w = var(20,:,1);
I2_4_w = var(19,:,1); 
V_4_w = var(3,:,1);

V2_43 = var(9,:,2);
I1_43_w = var(20,:,2);
I2_43_w = var(19,:,2); 
V_43_w = var(3,:,2);

V2_45 = var(9,:,3);
I1_45_w = var(20,:,3);
I2_45_w = var(19,:,3); 
V_45_w = var(3,:,3);


% figure()
% plot(V1-V2_4, I1_4_w, 'r.', ... 
%     V1-V2_4, I2_4_w, 'r*', ...
%     V1-V2_4, I1_4_w - I2_4_w, 'r-.', ...
%     V1-V2_4, I1_4_w + I2_4_w, 'r', ...
%     V1-V2_43, I1_43_w, 'g.', ... 
%     V1-V2_43, I2_43_w, 'g*', ...
%     V1-V2_43, I1_43_w - I2_43_w, 'g-.', ...
%     V1-V2_43, I1_43_w + I2_43_w, 'g', ...
%     V1-V2_45, I1_45_w, 'b.', ... 
%     V1-V2_45, I2_45_w, 'b*', ...
%     V1-V2_45, I1_45_w - I2_45_w, 'b-.', ...
%     V1-V2_45, I1_45_w + I2_45_w, 'b');
% xlim([-.15 .15]);

% figure()
% plot(V1-V2_4, V_4_w, 'r.', ... 
%     V1-V2_43, V_43_w, 'g.', ... 
%     V1-V2_45, V_45_w, 'b.');
%    
% xlim([-.5 .5]);

figure()
4ff = polyfit( V1-V2_4, I1_4_w - I2_4_w);

I1_4_s = var(20,:,4);
I2_4_s = var(19,:,4); 
V_4_s = var(3,:,4);

I1_43_s = var(20,:,5);
I2_43_s = var(19,:,5); 
V_43_s = var(3,:,5);

I1_45_s = var(20,:,6);
I2_45_s = var(19,:,6); 
V_45_s = var(3,:,6);