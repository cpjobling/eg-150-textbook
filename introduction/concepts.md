---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.14.4
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

(unit1.2)=
# Unit 1.2: A Conceptual introduction



## Signals
•	are numerical functions of one or more independent variables (e.g. room temperature over time and spatial location)
•	are defined in order to convey some information for subsequent signal processing (eg: to find average room temperature during one day)
•	actual units (e.g.	temperature in degrees Celsius and time in hours) not important for signal processing, but it is useful to be aware of them
•	models of signals are often called waveforms (eg: sine wave model) Examples of signals
•	electrical (voltages, currents)
•	electromagnetic (electromagnetic waves)
•	biological (electrocardiogram, sound waves)
•	man made (text files)
•	etc. etc.
 

 


Microphone output
 
Signal examples
On/off switch state
 
(continuous time, continuous value)
•	pressure converted to voltage signal

Temperature difference of 15cm thick wall (continuous space, continuous value)
•	spatial location is independent variable, and time is a parameter
 
(continuous time, discrete values)
1


0.8


0.6


0.4


0.2


0

0	0.5	1	1.5	2	2.5	3	3.5	4
time [s]

Stock market prices
(discrete time, continuous values)

Frequency of marks in a test (discrete time, discrete values)
 
 
 

What are systems?
Systems
•	modify and manipulate signals in order to extract some useful information
•	implement signal processing (first as mathematical models, then in hardware and software)
•	have inputs (to feed in signals) and outputs (to read out transformed signals) Physical system





•	sound waves converted to electrical signal by microphone
and electrical signal converted back to sound waves by speaker
Mathematical model




vOUT(t) = f (vIN(t)), e.g., vOUT(t) = AvIN(t) where A ∈ R+(positive real number)
•	math abstraction of physical systems necessary to devise signal processing
 

System examples

•	we make mathematical models of every possible system on the Earth (biological, social, technological, geological, . . . systems)
•	usually, the more complicated model, the better it reflects the reality, but the more difficult it is to deal with (mathematically)
•	we are ‘digitalizing the world’ (Big Data, Internet of Things, . . .)



•	can you recognize these systems?
 

System design
Top-down design
•	start from overall specifications, e.g. user requirements [Apple products] Bottom-up design
•	design sub-systems, then interconnect them to achive the desired system
[Cloud computing, Internet, computer and cellular networks]

Basic ideas are (often) simple:
•	e.g. send packets between two nodes in a network
But	the	implementation	is	(almost	always) complicated:
•	how to distinguish end-nodes?
•	how to find the route?
•	how to share network (resources) among billions end-nodes?
•	how to deal with lost and delayed packets?
•	how to deal with mobility and nodes leaving and arriving?
 

 


Example scenarios
 
What is signal processing?
 

1.	given a system, find the signal that will pass through it well (e.g. design transmitter signal in a communication system)
2.	given a signal, find the system that will pass it well (e.g. design audio amplifier)
3.	design a system to make a desired change to the signal (e.g. design audio equalizer)
4.	design a system to extract information from the signal
(e.g. design communication receiver to recover transmitted data symbols)

Feedback
•	key concent in Control Engineering
•	it is found in all technological, biological, financial, social etc. systems
•	positive feedback: a change is amplified (including noise), e.g.	useful to produce oscillations
•	negative feedback: a change is neutralized (noise is suppressed), e.g. useful to stabilize the system
 

![image.png](attachment:image.png)
