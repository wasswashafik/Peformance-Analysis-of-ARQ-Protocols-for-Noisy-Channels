## Design Analysis
Design of algorithms of different flow control techniques in data-link layer in wired networks.

#### SIMPLEST PROTOCOL
***Sender:***<br>
The data link layer at the sender site gets data from its network layer, makes a frame out of the data, and sends it.<br>
***Receiver:***<br>
The data link layer at the receiver site receives a frame from its physical layer, extracts data from the frame, and delivers the data to its network layer<br><br>

#### SIMPLE STOP-AND-WAIT PROTOCOL
***Sender:***<br>
Send one data packet at a time.<br>
Send next packet only after receiving acknowledgement for previous. <br>
***Receiver:*** <br>
Send acknowledgement after receiving and consuming of data packet. <br>
After consuming packet acknowledgement need to be sent.<br><br>

#### STOP-AND-WAIT ARQ PROTOCOL
***Sender:***<br>
Sends one frame at a time. <br>
After sending each frame, the sender doesn't send any further frames until it receives an acknowledgement (ACK) signal. <br>
The timeout countdown is reset after each frame transmission.<br>
***Receiver:***<br>
After receiving a valid frame, the receiver sends an ACK. <br>
If the ACK does not reach the sender before a certain time, known as the timeout, the sender sends the same frame again. <br><br>
***Design of the code:***<br>
In the matlab code, probabilities are assigned for Time-Out and ACK.<br>
P(Time-Out) = 2/10<br>
P(ACK) = 8/10<br><br>

#### GO-BACK-N ARQ PROTOCOL
***Sender:*** <br>
the sending process continues to send a number of frames specified by a window size even without receiving an acknowledgement (ACK) packet from the receiver.<br>
It is a special case of the general sliding window protocol with the transmit window size of N and receive window size of 1.<br>
It can transmit N frames to the peer before requiring an ACK.<br>
***Receiver:***<br>
The receiver process keeps track of the sequence number of the next frame it expects to receive, and sends that number with every ACK it sends.<br><br>
***Design of the code:***<br>
In the matlab code, probabilities are assigned for Time-Out and ACK.<br>
P(Time-Out) = 2/10<br>
P(ACK) = 8/10<br><br>

#### SELECTIVE REPEAT ARQ PROTOCOL
***Sender:*** <br>
 the sender sends a number of frames specified by a window size even without the need to wait for individual ACK from the receiver as in Go-Back-N ARQ.<br>
 The sender individually retransmits frames that have timed out.<br>
***Receiver:***<br>
The receiver may selectively reject a single frame, which may be retransmitted alone; this contrasts with other forms of ARQ, which must send every frame from that point again.<br>
 The receiver accepts out-of-order frames and buffers them. <br><br>
 ***Design of the code:***<br>
In the matlab code, probabilities are assigned for Positive ACK and Negative ACK.<br>
P(NAK) = 2/10<br>
P(PAK) = 8/10<br><br>


