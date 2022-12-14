---
jupytext:
  formats: md:myst,ipynb
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.14.1
kernelspec:
  display_name: Matlab
  language: matlab
  name: matlab
---

+++ {"slideshow": {"slide_type": "slide"}}

# Worksheet 4

## To accompany Chapter 3.1 Laplace Transform

+++ {"slideshow": {"slide_type": "notes"}}

## Colophon

This worksheet can be downloaded as a [PDF file](https://cpjobling.github.io/eg-247-textbook/worksheets/worksheet4.pdf). We will step through this worksheet in class. 

A printout of this worksheet will be distributed before the second class meeting in the **Week 2: Classroom Activities** section of the Canvas site. I will also distribute a copy to your personal **Worksheets** section of the **OneNote Class Notebook** so that you can add your own notes using OneNote. 

You are expected to have at least watched the video presentation of [Chapter 3.1](https://cpjobling.github.io/eg-247-textbook/laplace_transform/1/laplace) of the [notes](https://cpjobling.github.io/eg-247-textbook) before coming to class. If you haven't watch it afterwards!

After class, the lecture recording and the annotated version of this worksheet will be made available to you via OneNote and through Canvas.

+++ {"slideshow": {"slide_type": "subslide"}}

## First hour quiz: The Laplace and inverse Laplace transforms

+++ {"slideshow": {"slide_type": "skip"}}

This will be a group activity. If you did the quiz in Canvas before class you will be in a good place to get these answers.

+++ {"slideshow": {"slide_type": "fragment"}}

### Question 1: The Laplace Transform

Without looking it up, which of these integrals represents the Laplace and Inverse laplace transforms?

+++ {"slideshow": {"slide_type": "fragment"}}

<table>
<tr><td>A.</td><td>
    
$$\frac{1}{2\pi j}\int_{\sigma-j\omega}^{\sigma+j\omega}\,F(s)\,e^{st}\,ds$$
    
</td><td>B.</td><td>
    
$$\int_{0}^{\infty}\,f(t)\,e^{-st}\,dt$$
    
</td></tr>
<tr><td>C.</td><td>
    
$$\int_{-\infty}^{t}\,f(\tau)\,g(t-\tau)\,d\tau$$
    
</td><td>D.</td><td>
    
$$\int_{-j\omega}^{+j\omega}\,f(t)\,e^{-j\omega t}\,dt$$
    
</td></tr>
</table>

+++ {"slideshow": {"slide_type": "subslide"}}

Bonus: what are the other two integrals?

+++ {"slideshow": {"slide_type": "subslide"}}

### Question 2: Laplace transforms

Match the transform to the time-domain operator

<table>
<tr><td>1.</td><td>
        
$$\int_{-\infty}^{t}\,f(\tau)\,d\tau$$
        
</td><td>A.</td><td>
        
$$\frac{F(s)}{s}+\frac{f(0^-)}{s}$$
        
</td></tr>
<tr><td>2.</td><td>
        
$$\lim_{t\rightarrow 0}\,f(t)$$
        
</td><td>B.</td><td>
        
$$sF(s) - f(0^-)$$
        
</td></tr>
<tr><td>3.</td><td>
        
$$\int_0^t\,f_1(\tau)f_2(t-\tau)\,d\tau$$
        
</td><td>C.</td><td>
        
$$\frac{\int_{0}^{T}\,f(t)\,e^{-sT}}{1-e^{-sT}}$$
        
</td></tr>
    <tr><td>4.</td><td>
        
$$\frac{d}{dt}\,f(t)$$
        
</td><td>D.</td><td>
        
$$F_1(s)\,F_2(s)$$
        
</td></tr>
    <tr><td>5.</td><td>
        
$$f(t + nT)$$
        
</td><td>E.</td><td>
        
$$\lim_{s\rightarrow \infty}\,sF(s)$$
        
</td></tr>
</table>

+++ {"slideshow": {"slide_type": "subslide"}}

### Question 3: Properties of Laplace transforms

Match each of these mathematical properties to the associated Laplace transform property.

<table>
<tr><td>1.</td><td>Linearity</td><td>A.</td><td>
    
$$f(t - a)\,u_0(t - a) \Leftrightarrow e^{-as} F(s)$$
    
</td></tr>
<tr><td>2.</td><td>Time Scaling</td><td>B.</td><td>
    
$$c_1f_1(t) + c_2f_2(t)+ \cdots + c_nf_n(t)\Leftrightarrow c_1F_1(s) + c_2F_2(s) + \cdots + c_nF_n(s)$$
    
</td></tr>
<tr><td>3.</td><td>Time-shift</td><td>C.</td><td>
    
$$e^{-at}\, f(t) \Leftrightarrow F(s + a)$$
    
</td></tr>
<tr><td>4.</td><td>Frequency Shift</td><td>D.</td><td>
    
$$f(at) \Leftrightarrow (1/a) \, F (s/a)$$
    
</td></tr>
</table>

+++ {"slideshow": {"slide_type": "subslide"}}

### Question 4: Name that property

What property is this? 

$$\lim_{t\rightarrow \infty}\,f(t)\Leftrightarrow \lim_{s\rightarrow 0}\,sF(s)$$

A. Convolution in the time domain

B. Initial value theorem

C. Final value theorem

D. Differentiation in the time domain

E. Integration in the time domain

+++ {"slideshow": {"slide_type": "subslide"}}

### Question 5: Elementary signals

Match the elementary signal to its Laplace transform

<table>
<tr><td>1.</td><td>Dirac delta (unit impulse)</td><td>
    
$$\delta(t)$$
    
</td><td>A.</td><td>
    
$$e^{-as}$$

</td></tr>
<tr><td>2.</td><td>Unit step</td><td>
    
$$u_0(t)$$
    
</td><td>B.</td><td>
    
$$\frac{1-e^{-as}}{s}$$

</td></tr>
<tr><td>3.</td><td>Unit ramp</td><td>
    
$$u_1(t) = t u_0(t)$$
    
</td><td>C.</td><td>
    
$$\frac{1}{s}$$
    
</td></tr>
<tr><td>4.</td><td>Exponential decay</td><td>
    
$$e^{-at}u_0(t)$$
    
</td><td>D.</td><td>
    
$$1$$
    
</td></tr>
<tr><td>5.</td><td>Damped sinusoid</td><td>
    
$$e^{-at}\,\sin(\omega t)u_0(t)$$
    
</td><td>E.</td><td>
    
$$\frac{1}{s^2}$$
    
</td></tr>
<tr><td>6.</td><td>Sampling function</td><td>
    
$$\delta(t-a)$$
    
</td><td>F.</td><td>
    
$$\frac{1}{s+a}$$

</td></tr>
<tr><td>7.</td><td>Gating function</td><td>

$$u_0(t)-u_0(t-a)$$
    
</td><td>G.</td><td>
    
$$\frac{\omega}{(s+a)^2+\omega^2}$$
    
</td></tr>
</table>

+++ {"slideshow": {"slide_type": "subslide"}}

### End of first hour quiz

Is there anything in this quiz that you think we should go over in more detail in class?

Add to the **???????Questions and Discussion on the Laplace Transformation and its Applications** board in Canvas after class.

+++ {"slideshow": {"slide_type": "slide"}}

## Laplace transforms of common waveforms

We will work through a few of the following on the board in class

* Pulse
* Linear segment
* Triangular waveform
* Rectangular periodic waveform (square wave)
* Half rectified sine wave

+++ {"slideshow": {"slide_type": "subslide"}}

### Pulse

Compute the Laplace transform of the pulse shown in the figure.

![pulse](images/pulse.png)

For full solution see [Example 2.4.1](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=3384197&ppg=63) in Karris.

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">






















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

### Line segment

Compute the Laplace transform of the line segment shown below.

![line](images/line.png)

For full solution see [Example 2.4.2](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=3384197&ppg=64) in Karris.

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">






















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

### Triangular Pulse

Compute the Laplace transform of the triangular pulse shown below

![triangle](images/triangle.png)

For full solution see [Examples in 2.4.3](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=3384197&ppg=65) in Karris.

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">






















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

### Square Wave

Compute the Laplace transform of the periodic function shown below.

![square wave](images/sqare.png)

For full solution see [Example 2.4.4](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=3384197&ppg=66) in Karris.

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">






















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

### Half-rectified Sinewave

Compute the Laplace Transform of the half-rectified sine wave shown below.

![half-rectified sinewave](images/rectsine.png)

For full solution see [Example 2.4.5](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=3384197&ppg=67) in Karris.

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">






















</pre>

+++ {"slideshow": {"slide_type": "slide"}}

## Homework

Attempt at least one of the end-of-chapter exercises from each question 1-7 of [Section 2.7](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=3384197&ppg=75#ppg=71) of {cite}`karris`. Don't look at the answers until you have attempted the problems.

If we have time, I will work through one or two of these in class.

+++ {"slideshow": {"slide_type": "notes"}}

## References

See [Bibliography](/zbib).

+++ {"slideshow": {"slide_type": "notes"}}

## Answers to in-class problems

1. $$Au_0(t)-Au_0(t-a)\Leftrightarrow \frac{A\left(1-e^{-as}\right)}{s}.$$

2. $$(t-1)u_0(t-1)\Leftrightarrow \frac{e^{-s}}{s}.$$

3. $$f_T(t)\Leftrightarrow \frac{\left(1-e^{-s}\right)^2}{s^2}.$$

4. $$f_R(t)\Leftrightarrow \frac{A\tanh \left(\frac{As}{2}\right)}{s}.$$

5. $$f_{HW}(t) \Leftrightarrow \frac{1}{\left(s^2 + 1\right)\left(1-e^{\pi s}\right)}.$$
