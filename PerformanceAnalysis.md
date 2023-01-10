# Peformance Analysis of ARQ Protocols for Noisy Channels

## Stop-and-Wait ARQ
This protocol is very inefficient if the channel is thick (large bandwidth) and long (round-trip delay is long). The product of the two is called the bandwidth delay-product. TThe bandwidth delay product is a measure of the number of bits we can send out of our system while waiting for news from the receiver. The protocol can be inefficient if channel is not used effectively.<br>
The number of transmission in Stop-and-Wait ARQ is less than the other protocols. This is because the sender waits for an acknowledgement and retransmits only if the acknowledgement is not received or if it is lost.<br>
Apart from this, pipelining is not implemented in this protocol. We need to wait for a frame to reach the destination and be acknowledged before the next frame can be sent. This further decreases the efficiency.

## Go-Back-N ARQ
In this protocol, to improve the efficiency of transmission, multiple frames are in transition while waiting for acknowledgement. More than one frame are kept outstanding to keep the channel busy while the sender is waiting for acknowledgement. <br>
However, this protocol involves a lot of unnecessary retransmissions. This is because all the frames in send window are transmitted when the timer expires even though some of the frames might have successfully reached the receiver.<br>
Go-Back-N is also very inefficient for a noisy link. In a noisy link, a frame has a higher probability of damage, which means the resending of multiple frames. The resending uses up the bandwidth and slows down the transmission.

## Selective Repeat ARQ
This protocol resends only the damaged frames and thus increases the efficiency in noisy links. However, the processing at the receiver is more complex. It is the most complex of the set of protocols for error control, it is however the most efficient scheme.<br>
Resending only particular damaged frames drastically reduces the number of unnecessary transmissions, thus improving the efficiency.

### Graph of ratio of ideal to total number of transmissions

number of frames = 20
size of sequence number in bits = 4

![Graph 1](https://10.100.13.215/16CO140/CO250-MP-121-124-140/raw/master/images/graphs/ratio.jpg "Ratio of ideal to total number of transmissions")


### Graph of time delay

![Graph 2](https://10.100.13.215/16CO140/CO250-MP-121-124-140/raw/master/images/graphs/time_delay.jpg "Time delay")


