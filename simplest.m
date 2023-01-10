%   Data Communication CO250 Mini Project

%   Topic: Performance analysis of state-of-the-art flow control techniques
%   of data-link layer in wired networks using Matlab.

%   Member: 
%   Sharanya Kamath 16CO140

% This program demonstrates Simplest Protocol for flow control in
% data link layer.
%--------------------------------------------------------------------------

clc; %clears all input and output from the Command Window display.
disp('SAMPLE INPUT AND OUTPUT: '); % For displaying on output screen

n = input('Number of Frames: '); % For taking input from user
frame = 1; % Starting from the first frame

while frame <= n % Begin a while loop for counting the frames till n
    fprintf('Transmitting Frame %d\n',frame); % Transmitting the current frame
    frame=frame+1; % Incrementing frame count and progressing to the next frame
end % End of while loop

  
