%   Data Communication CO250 Mini Project

%   Topic: Performance analysis of state-of-the-art flow control techniques
%   of data-link layer in wired networks using Matlab.

%   Member: 
%   Sharanya Kamath 16CO140

% This program demonstrates Go back N ARQ Protocol for flow control in
% data link layer.
%-----------------------------------------------------------------------------------

% ----------------------------------------------------------------------------------
%                               Go back N ARQ protocol                                 
%-----------------------------------------------------------------------------------
function [time, total] = go_back_n_arq(n, m)
  disp('------------------------------------------------------------------------------------------------------');
disp('Go Back N ARQ'); % displaying heading
w = 2^m; % calculate window size
window_size = w %display window size
pt = 1; %number of frames transmitted
flag = 0; %check if all frames are transmitted or not
flag2 = 0;  %check successful transmission and reception
a = 1:n;  %frame number
total = 0; %total number of transmissions
time = 0; %frame to reach or ack to reach=3, timeout=6
while flag==0 %while all frames are not transmitted
    if flag2==0 %if unsuccessfull reception
%------------------------------------------------------------------------------------
%                       Transmitting The Frames In A Window                          
%------------------------------------------------------------------------------------
        for i=1:w  %transmit w frames (window size)
            total = total +1 ; %incrementing the number of frames transmitted
            fprintf('Frame %d Transmitted\n',mod(a(pt),w)); %frame transmitted
            pt = pt + 1; %increment number of frames transmitted
        end %end for
        flag2 = 1; %successfull transmission
    end %end if
    s = randi(10,1,1); %producing random number between 1 to 10
    if s>=3 %frame received
        fprintf('Positive ACK of Frame %d Received\n',mod(a(pt-w),w)); %particular frame is received
        total = total +1 ; %incrementing the number of frames transmitted
        if mod(total,6)==0 %incrementing time only if appropriate number of acks or time outs are done
            time = time + 6; %incrementing time
        end %end if
        fprintf('Frame %d Transmitted\n',mod(a(pt),w)); %next frame transmitted
        if a(pt)==n %all frames transmitted
            flag = 1; %all frames transmitted
        end %end if
        pt = pt + 1; %incrementing number of frames transmitted
    else %error in frame
        fprintf('Time out of Frame %d\n',mod(a(pt-w),w)); %time out
        if mod(total,6)==0 %incrementing time only if appropriate number of acks or time outs are done
            time = time + 6; %incrementing time
        end %end if
        for j = 0:w-1 %all frames in the window are discarded
            fprintf('Frame %d Discarded\n',mod(a(pt-w+j),w)); %particular frame discarded
        end %end for
        pt = pt-w; %frames transmitted reduced by w
        flag2 = 0; %unsuccessful reception
    end %end if-else
end %end while
%-------------------------------------------------------------------------------------
%                       Last 'W' Frames are dealt seperately                          
%-------------------------------------------------------------------------------------
i = n-w+1;%start index of left frame
while (i<=n) %while index is less than total frames
    s=randi(10,1,1); %producing random number between 1 to 10
    if s>=3 %successful reception
        fprintf('Positive ACK of Frame %d Received\n',mod(a(i),w)); %particuar frame received
        if mod(total,6)==0 %incrementing time only if appropriate number of acks or time outs are done
            time = time + 6; %incrementing time
        end %end if
        i=i+1; %incrementing index
    else %uncsuccessful reception
        fprintf('Time out of Frame %d\n',mod(a(i),w)); %negative acknowledgement
        if mod(total,6)==0 %incrementing time only if appropriate number of acks or time outs are done
            time = time + 6; %incrementing time
        end %end of if
        for j=i:n %discarding frames
            fprintf('Frame %d Discarded\n',mod(a(j),w)); %particular frame discarded
        end %end for
        for k=i:n %trasmitting frames again
            total = total + 1; %incrementing number of frames transmitted
            fprintf('Frame %d Transmitted\n',mod(a(k),w)); %particular frame transmitted
        end %end for
    end %end if-else
end %end while loop
