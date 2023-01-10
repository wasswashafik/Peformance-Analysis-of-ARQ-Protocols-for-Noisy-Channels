%   Data Communication CO250 Mini Project

%   Topic: Performance analysis of state-of-the-art flow control techniques
%   of data-link layer in wired networks using Matlab.

%   Member: 
%   Sharanya Kamath 16CO140

% This program demonstrates Selective Repeat ARQ Protocol for flow control in
% data link layer.
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%                    Selective Repeat ARQ Protocol
%--------------------------------------------------------------------------
function [time, total]=selective_repeat_arq(n, m)
disp('------------------------------------------------------------------------------------------------------');
disp('Selective Repeat ARQ'); %displaying the heading
w = 2^(m-1);
window_size = w
pt = w+1; % next window
flag = 0; % check whether all frames are transmitted or not
ext = 0;  %number of re-transmitted frames
flag1 = 0; %assigning value to flag1
flag2 = 0; %assigning value to flag2
total = 0; %total number of transmissions
time = 0; %frame to reach or ack to reach=3
a=1:n; %frame number
for i=1:w % Running a loop for transmitting frames from 1 to window size
    fprintf('Frame %d Transmitted\n',mod(a(i),w)); % Displaying current frame is transmitted
    total = total + 1; %incrementing the number of transmissions
end % End of for loop
while flag==0 % While all frames are not transmitted
    s=randi(10,1,1); % Producing a random integer between 1 and 10
    if s>=3 % If random integer is greater than 3 then positive acknowledgement is sent
        fprintf('PAK of frame %d received\n',mod(a(pt-w),w)); % Displaying positive acknowledgement
        if mod(total,6)==0  %incrementing time only if appropriate number of acks or time outs are done
            time=time+6; %incrementing time delay
        end %end if
    else % if random integer is less than 3 then negative acknowledgement is sent
        fprintf('NAK of frame %d received\n',mod(a(pt-w),w)); % Displaying negative acknowledgement
        if mod(total,6)==0 %incrementing time only if appropriate number of acks or time outs are done
            time=time+6; %incrementing time delay
        end %end if
        ext=ext+1; %incrementing frames to be re-transmitted
        for i=n+ext:-1:pt+1 
            a(i)=a(i-1);
        end %end for
        a(pt)=a(pt-w);
    end % End of if-else statement
    fprintf('Frame %d Transmitted\n',mod(a(pt),w)); % Displaying that frame has been transferred
    total=total+1; %incrementing numbe rof transmissions
    if a(pt)==n %all frames are transmitted
        flag=1; %change flag value
    end % end of if statement
    pt=pt+1; %incrementing index
end % End of while loop
k=pt-w; % Number of frames
while flag2==0 % While all frames are not received
    test=randi(10,1,1); % Producing a random integer between 1 and 10
    if flag1==1 % Condition for frame transmission
        fprintf('Frame %d Transmitted\n',mod(a(k),w)); % Display that frame has been transmitted
        total = total + 1;  %incrementing numbe rof transmissions
        flag1=0; % set flag1 to 0
    end % End of if statement
    if test>=3 % If random integer is greater than 3 that means positive ACK of frame is received
        fprintf('PAK of frame %d received\n',mod(a(k),w)); % Display that positive ACK is received
        if mod(total,6)==0 %incrementing time only if appropriate number of acks or time outs are done
            time=time+6; % incrementing time delay
        end %end if
        k=k+1; % Increment index
    else % If random integer is less than 3 that means negative ACK of frame is received
        fprintf('NAK of frame %d received\n',mod(a(k),w)); % Display that negative ACK is received
        if mod(total,6)==0 %incrementing time only if appropriate number of acks or time outs are done
            time=time+6; % incrementing time delay
        end %end if
        flag1=1; % Set flag1 to 1 i.e. frame needs to be retransmitted
    end % End of if-else statement
    if k==n+ext+1 % All frames are received
        flag2=1; % Set flag2 to 1 to exit while loop
    end % End of if statement
end% End of while loop

