Reproduction of results 

**Title:** <br>
Performance analysis of state-of-the-art flow control techniques of data-link layer in wired networks using Matlab.


**Abstract:** <br>
In data communications, flow control is the process of managing the rate of data transmission between two nodes to prevent a fast sender from overwhelming a slow receiver. It provides a mechanism for the receiver to control the transmission speed, so that the receiving node is not overwhelmed with data from transmitting node. 
<br>
Following are the flow control techniques of data-link layer in wired networks:<br>
* Noiseless channel : Simplest protocol, Stop-and-Wait protocol
* Noisy channel : Stop-and-Wait Automatic Repeat Request, Go-back-N Automatic Repeat Request, Selective Repeat Automatic Repeat Request.

Automatic-repeat-request (ARQ) protocols are widely used in modern data communications to guarantee reliable transmission over imperfect physical links.  The behavior of an ARQ protocol largely depends on a number of network parameters and traditionally simulation is used for their performance analysis. However, simulation provides less accurate results and usually requires enormous amount of CPU time in order to attain reasonable estimates. In spite of this, we try to present an analysis of performance of the various flow control techniques of data link layer.
<br>

**Objectives:** <br>
* To simulate the above mentioned protocols in Matlab. 
* Performance analysis based on parameters such as efficiency, throughput and time  delay will be presented. This will be done by using plotting graphs between efficiency and protocols and time delay and protocols.
* Through this mini project I aim to gain in depth knowledge about the inner workings of the data link layer for flow control.

**References:**<br>
I. F. Akyildiz and W. Liu, "A general analysis technique for ARQ protocol performance in high speed networks," INFOCOM '91. Proceedings. Tenth Annual Joint Conference of the IEEE Computer and Communications Societies. Networking in the 90s., IEEE, Bal Harbour, FL, 1991, pp. 498-507 vol.2. <br>
[Click Here](http://ieeexplore.ieee.org/document/147545/) <br>

## File Structure


* Introduction.md - Explain theoretical aspects of the mini project. 
* Design.md - Explain design aspects of the mini project.
* PerformanceAnalysis.md - Explains the performance analysis procedures for the various protocols.
* images folder - Contains all the images required for the project.
* main.m
* simplest.m
* simple_stop_and_wait.m
* stop_and_wait_arq.m
* go_back_n_arq.m
* selective_repeat_arq.m

