%   Data Communication CO250 Mini Project

%   Topic: Performance analysis of state-of-the-art flow control techniques
%   of data-link layer in wired networks using Matlab.

%   Member: 
%   Sharanya Kamath 16CO140

% This program demonstrates Stop-n-Wait ARQ Protocol for flow control in
% data link layer.
%--------------------------------------------------------------------------
function [time, total] = stop_and_wait_arq(n)
%clc; %clears all input and output from the Command Window display.
disp('------------------------------------------------------------------------------------------------------');
disp('Stop and Wait ARQ'); % displaying the heading
disp('SAMPLE INPUT AND OUTPUT: '); % For displaying on output screen
%n=input('Number of Frames: '); % For taking input from user
frame=1; % Starting from the first frame
total = 0; % total number of transmissions
time=0; %frame to reach or ack to reach =3, timeout=6

while frame <= n % Begin a while loop for counting the frames till n
    total = total+1; % incrementing the number of frames transmitted
    fprintf('Transmitting Frame %d\n',mod(frame,2)); % Transmitting the current frame
    s=randi(10,1,1); % Producing a random integer between 1 and 10
    
    if s<3  % If random integer is less than 3 that means acknowledgement failed to reach on time
        fprintf('TIME OUT\n Re-'); % Displaying Time Out message. The frame is to be retransmitted
        time=time+6; % incrementing time delay
       
    else % if random integer is greated than 3, it is taken as positive acknowledgement is received
        fprintf('Positive ACK of Frame %d Received\n',mod(frame,2)); % Displaying positive acknowledgement message
        frame=frame+1; % Incrementing frame count and progressing to the next frame
        time=time+6; % incrementing time delay
    end % End of if-else ladder
    
end % End of while loop
