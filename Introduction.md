## Flow Control Techniques of Data-Link Layer
### Simplest Protocol
In simplest protocol, there is no flow control and error control mechanism. It is a unidirectional protocol in which data frames travel in only one direction (from sender to receiver). <br>
Also, the receiver can immediately handle any received frame with a processing time that is small enough to be negligible. <br>
The protocol consists of two distinct procedures :a sender and receiver. The sender runs in the data link layer of the source machine and the receiver runs in the data link layer of the destination machine. No sequence number or acknowledgements are used here. <br>

##### Working:
![Simplest Protocol](https://10.100.13.215/16CO140/CO250-MP-121-124-140/raw/master/images/introduction/simplest.jpg "Simplest Protocol")

### Simple Stop-and-Wait Protocol
In this method of flow control, the sender sends a single frame to receiver & waits for an acknowledgment. There is no chance of frame or acknowledgement as this protocol is used for noiseless channel.
<br><br>

##### Working:<br>
![Simple Stop-and-Wait Protocol](https://10.100.13.215/16CO140/CO250-MP-121-124-140/raw/master/images/introduction/StopWaitProtocol.jpg "Simple Stop-and-Wait Protocol")

### Stop-And-Wait ARQ Protocol

Stop-and-wait ARQ is a method to send information between two connected devices in a noisy channel. It ensures that information is not lost due to dropped packets and that packets are received in the correct order. <br>

##### Characteristics:<br>
* It offers error and flow control<br>
* It is used in Data Link and Transport Layers<br>
* It uses link between sender and receiver as half duplex link<br>
* Throughput = 1 Data packet/frame per RTT<br>
* It is an special category of SWP where its window size is 1<br>
* Irrespective of number of packets sender is having stop and wait protocol  requires only  2 sequence numbers 0 and 1
<br><br>

##### Working: <br>
![Stop-And-Wait ARQ Protocol](https://10.100.13.215/16CO140/CO250-MP-121-124-140/raw/master/images/introduction/StopandWaitARQ.png "Stop-And-Wait ARQ Protocol")

### Go-Back-N ARQ Protocol
Go-Back-N ARQ is a more efficient use of a connection than Stop-and-wait ARQ, since unlike waiting for an acknowledgement for each packet, the connection is still being utilized as packets are being sent. 
##### Characteristics:
* The key to Go-back-N is that several packets can be sent before receiving acknowledgments, but the receiver can only buffer one packet.
* Go back means sender has to go back N places from the last transmitted packet in the unacknowledged window and not from the point where the packet is lost. 
* The sliding window size at sender’s side is 2^(m-1) and receiver’s side is 1. 
* GBN uses Cumulative Acknowledgement. At the receiver side, an acknowledgement timer is started whenever the receiver receives any packet which is fixed and when it expires, it sends a cumulative ACK for the number of packets recieved in that interval of timer i.e. if receiver has received N packets, then the acknowledgement number will be N+1.

##### Working: <br>
![Go-Back-N ARQ Protocol](https://10.100.13.215/16CO140/CO250-MP-121-124-140/raw/master/images/introduction/gobackn.jpeg "Go-Back-N ARQ Protocol")

### Selective Repeat Request ARQ

***Why Selective Repeat Protocol?***<br>
The go-back-n protocol works well if errors are less, but if the line is poor it wastes a lot of bandwidth on retransmitted frames. An alternative strategy, the selective repeat protocol, is to allow the receiver to accept and buffer the frames following a damaged or lost one.

Selective repeat attempts to retransmit only those packets that are actually lost (due to errors) :
* Receiver must be able to accept packets out of order.
* Since receiver must release packets to higher layer in order, the receiver must be able to buffer some packets.

This protocol(SRP) is mostly identical to GBN protocol, except that buffers are used and the receiver, and the sender, each maintain a window of size. SRP works better when the link is very unreliable. Because in this case, retransmission tends to happen more frequently, selectively retransmitting frames is more efficient than retransmitting all of them. SRP also requires full duplex link. backward acknowledgements are also in progress.

##### Working:
![Selective Repeat Request ARQ](https://10.100.13.215/16CO140/CO250-MP-121-124-140/raw/master/images/introduction/selectiverepeat.jpg "Selective Repeat Request ARQ")