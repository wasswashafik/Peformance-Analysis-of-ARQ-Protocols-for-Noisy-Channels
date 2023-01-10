%   Data Communication CO250 Mini Project

%   Topic: Performance analysis of state-of-the-art flow control techniques
%   of data-link layer in wired networks using Matlab.

%   Members: 
%   Namrata Ladda   16CO121
%   Mehnaz Yunus    16CO124
%   Sharanya Kamath 16CO140

% This program demonstrates the main function for flow control in
% data link layer, and also plots the performance graph.
%-----------------------------------------------------------------------------------

% ----------------------------------------------------------------------------------
%                              Main Function                                
%-----------------------------------------------------------------------------------
clc;
frames = input('Number Of Frames: '); %input number of frames
m = input('Size of sequence number field (in bits):'); %input sequence number field (in bits)

[stwTime, stwtotal] = stop_and_wait_arq(frames); %calling the stop_and_wait_arq function and storing the returned values.

[gbnTime, gbntotal] = go_back_n_arq(frames, m); %calling the go_back_n_arq function and storing the returned values.

[selTime, seltotal] = selective_repeat_arq(frames, m); %calling the selective_repeat_arq function and storing the returned values.


c1 = categorical({'1.Stop and Wait ARQ', '2.Go Back N ARQ', '3.Selective Repeat ARQ'}); %storing the x-axis labels in a string vector.
y1 = [(frames/stwtotal)*100 (frames/gbntotal)*100 (frames/seltotal)*100]; %storing the y-axis values in a numerical vector.

c2 = categorical({'1.Stop and Wait ARQ', '2.Go Back N ARQ', '3.Selective Repeat ARQ'}); %storing the x-axis labels
y2 = [stwTime gbnTime selTime]; %storing the y-axis values in a numerical vector.

%plotting throughput graph
subplot(3,4,[1,2,5,6]); %using subplot function to plot multiple graphs on same screen
bar(c1,y1); %plotting a bar graph
xlabel('type of flow control'); %denoting the x label
ylabel('ratio of ideal to total no. of transmissions'); %denoting the y label

%plotting time delay graph
subplot(3,4,[3,4,7,8]); %using subplot function to plot multiple graphs on same screen
bar(c2,y2); %plotting a bar graph
xlabel('type of flow control'); %denoting the x label
ylabel('time delay'); %denoting the y label