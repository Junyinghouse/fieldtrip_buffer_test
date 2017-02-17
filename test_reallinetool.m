
% 14 Feb 2017
% Junying
% test simulating real-time data wrote into buffer by sine2ft.exe application of fieldtrip and read from buffer in Matlab

clear all
clc
close all
%% 1 read header from buffer
while true
  hdr = ft_read_header('buffer://localhost:1972')
  pause(1)
end


%% 2 read data from buffer
while true
    dat = ft_read_data('buffer://localhost:1972','begsample', 1, 'endsample', inf);
    plot(dat');
    pause(1)
end


 