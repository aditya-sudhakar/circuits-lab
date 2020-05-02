clearvars
close all
[status , pid] =system("sh -c 'echo -n $$; exec bash ltspiceStart'");
% pause(2);

%Doesnt work - Pushing anyways
% pid
% system("wineserver -k");

