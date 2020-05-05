close all
clearvars
addpath(genpath("../GlobalFunctions/"));
raw_data = LTspice2Matlab("./ltspice/30bit.raw");
vnml=raw_data.variable_name_list
data = raw_data.variable_mat;
% [status , pid] =system("sh -c 'echo -n $$; exec bash ltspiceStart'");
% pause(2);

%Doesnt work - Pushing anyways
% pid
% system("wineserver -k");

time = raw_data.time_vect; 
Ibefore = data(166,:);
Iafter = data(163, :);



plot(time, Ibefore, 'rs-', ...
     time, Iafter, 'bs-');
title("Current Increment from $29^{th}$ to $30^{th}$ bit", 'Interpreter', 'Latex');
xlabel("Time (s)", 'Interpreter', 'Latex');
ylabel("Current (A)", 'Interpreter', 'Latex');
legend('$\overline{ I_{out}}$ at $29^{th}$ bit',...
       '$\overline{ I_{out}}$ at $30^{th}$ bit', 'Interpreter', 'Latex');
  
