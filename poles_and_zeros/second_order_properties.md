---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.15.2
kernelspec:
  display_name: Matlab
  language: matlab
  name: matlab
---

+++ {"slideshow": {"slide_type": "slide"}}

(unit5.2)=
# Unit 5.2: More on the Qualitative and Quantitative Response of First- and Second-Order Poles

+++ {"slideshow": {"slide_type": "notes"}}

Follow along at [cpjobling.github.io/eg-150-textbook/poles_and_zeros/second_order_properties](https://cpjobling.github.io/eg-150-textbook/poles_and_zeros/second_order_properties)

![QR Code for this lecture](pictures/qr_code_for_unit52.png)

+++ {"slideshow": {"slide_type": "notes"}}

## Acknowledgements

The notes for this unit have been influenced by the MATLAB LiveScript **PoleZeroAnalysis.mlx** from the MathWorks curriculum module [Transfer Function Analysis of Dynamic Systems](https://uk.mathworks.com/matlabcentral/fileexchange/94635-transfer-function-analysis-of-dynamic-systems) {cite}`tfads`. You will find some useful interactive applications with which you can explore the concepts presented here. Some of these will be deomostrated in the lecture.

The examples have been inspired by the recording of the second half of the video recording of Stephen Boyd's 1999 lecture 10 (delivered at Stanford University) which itself is based on [Qualitative properties of signals & Laplace transforms](https://web.stanford.edu/~boyd/ee102/qualitative.pdf) {cite}`boyd93`.

+++ {"slideshow": {"slide_type": "notes"}}

You can watch the video on YouTube here:

<iframe width="560" height="315" src="https://www.youtube.com/embed/I3DZM0rarTA?si=hSVhhDofHEw1y-rV&amp;start=1407" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

+++ {"slideshow": {"slide_type": "slide"}}

## Agenda

* {ref}`unit.5.2.1`
* {ref}`unit.5.2.2`
* {ref}`unit.5.2.3`
* {ref}`examples16`

+++ {"slideshow": {"slide_type": "slide"}}

(unit.5.2.1)=
## Quantitative behaviour of real poles

In {ref}`unit5.1.2` we stated that a response term that corresponds to a real pole $s = \sigma$ will result in a growing expontial if $\sigma > 0$ and a decaying exponential if $\sigma < 0$.

We didn't quantify these effects, so it is useful to do so here.

+++ {"slideshow": {"slide_type": "subslide"}}

### Rate of exponential growth

Given that the rational polynomial $F(s)$ representing the Laplace transfer of a signal or system has a pole $s = \sigma$, one of the terms in the partial fraction expansion will be

$$\frac{r_\sigma}{s-\sigma}$$

where $r_\sigma$ is the residue of the pole.

The corresponding term in $f(t)$ will be $r_\sigma e^{\sigma t}$.

This will be a growing exponential for which the *doubling time* is a useful measure of the growth rate.

Given that at time $t=0$, $r_\sigma e^{0} = r_\sigma$, the doubling time $T$ is the time for which

$$
\begin{align}
r_\sigma e^{\sigma T} &= 2r_\sigma\\
e^{\sigma T} &= 2\\
\sigma T &= \log_e 2\\
T &= \frac{\log_e 2}{\sigma} = \frac{0.693147180559945}{\sigma} \approx \frac{0.7}{\sigma}.
\end{align}
$$

+++ {"slideshow": {"slide_type": "subslide"}}

(unit5.2:ex7)=
### Example 7

Plot the response of the pole

$$\frac{10}{s - 0.1}$$

and confirm that the doubling time is around 7 seconds.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Solution to example 7

Done in MATLAB

```{code-cell}
---
slideshow:
  slide_type: subslide
---
t = linspace(0,15,100);
sigma = 0.1;
% Doubling time
T = log(2)/sigma;
% Plot
plot(t,10*exp(sigma*t)),ylim([0,50]),grid
% Plot and label lines: first doubling
line([T,T],[0,20],'Color','r','LineStyle','--')
line([0,T],[20,20],'Color','r','LineStyle','--')
hold on 
plot(T,20,'o')
text(3,22,'First doubling')
% Plot and label lines: second doubling
plot(2*T,40,'o')
line([2*T,2*T],[0,40],'Color','g','LineStyle','--')
line([0,2*T],[40,40],'Color','g','LineStyle','--')
text(10,42,'Second doubling')
% Label graph
title('Exponential growth'),
ylabel('f(t) = 10*exp(-0.1*t)'),xlabel('Time t [s]')
hold off
```

+++ {"slideshow": {"slide_type": "subslide"}}

Given that $\sigma = 0.1$, the doubling time $T \approx 0.7/\sigma = 7$ s. The initial value is $10$ at $t=0$ s. It has doubled to $20$ at $t\approx 7$ s, and has doubled again to $40$ at $t\approx 14$.

We have added the exact solutions to the plot.

+++ {"slideshow": {"slide_type": "notes"}}

The MATLAB code to reproduce this result is given in [example7.mlx](matlab/example7.mlx)

+++ {"slideshow": {"slide_type": "subslide"}}

### Rate of exponential decay

If $F(s)$ has a pole $s = -\sigma$, one of the terms in the partial fraction expansion will be

$$\frac{r_\sigma}{s+\sigma}$$

where $r_\sigma$ is the residue of the pole.

The corresponding term in $f(t)$ will be $r_\sigma e^{-\sigma t}$.

This will be a decaying exponential for which the time constant $\tau = 1/|\sigma|$ is a useful measure of the decay rate.

Putting the time constant into the response equation

$$r_\sigma e^{-\sigma \tau} = r_\sigma e^{-1} = 0.367879441171442r_\sigma \approx 0.37r_\sigma.$$

Thus the response reaches around $37\%$ of it's initial value in $\tau = 1/|\sigma|$ s.

+++ {"slideshow": {"slide_type": "subslide"}}

Another measure of decay that is sometimes used is the value of $t$ for which the response reaches $1\%$ of its initial value.

$$
\begin{align}
  0.01 r_\sigma &= r_\sigma e^{-t/\tau}\\
  0.01 &= e^{-t/\tau}\\
  \log_e(0.01) &= -t/\tau \\
  t_{1\%} &\approx 4.6 \tau
\end{align}
$$

+++ {"slideshow": {"slide_type": "subslide"}}

(unit5.2:ex7)=
### Example 8

The current in the RC circuit shown in [Fig. 41](https://cpjobling.github.io/eg-150-textbook/laplace_transform/index.html#rc-circuit-l) has the transform

$$i(t) = \frac{1/RC}{s+ 1/RC}$$

If $R = 1$ M$\Omega$ and $C = 10$ $\mu$F, determine:

(a) The initial current $i(0)$.

(b) The time constant $\tau$.

(c) The time at which the current decays to 1% of $i(0)$.

+++ {"slideshow": {"slide_type": "notes"}}

#### Solution to example 8

+++ {"slideshow": {"slide_type": "notes"}}

(a) The initial current is given by[^unit5.2:1]

$$\lim_{s\to\infty} sI(s) = \lim_{s\to\infty}s\frac{1/RC}{s + 1/RC} = 1/RC.$$

Given the component values of $R$ and $C$, $i(0) = 1/RC = 100$ mA.

+++ {"slideshow": {"slide_type": "notes"}}

[^unit5.2:1]: This is easily determined from $\left.f(t)\right|_{t\to 0} = \left.\frac{1}{RC} e^{-t/RC}\right|_{t\to 0} = 1/RC$.

+++ {"slideshow": {"slide_type": "notes"}}

(b) The time constant $\tau = RC = 10$ s.

+++ {"slideshow": {"slide_type": "notes"}}

(c) The time at which the current decays to 1% of $i(0)$ is 46 s.

+++ {"slideshow": {"slide_type": "notes"}}

MATLAB confirmation

```{code-cell}
---
slideshow:
  slide_type: notes
---
t = linspace(0,50,100);
R = 1e6; C = 10e-6;
sigma = -1/(R*C);
% Time constant and initial current
tau = 1/abs(sigma); i0 = 1/(R*C);
% Plot
plot(t,i0*exp(sigma*t)),grid
% Plot and label lines: time constant
line([tau,tau],[0,i0*exp(-1)],'Color','r','LineStyle','--')
line([0,tau],[i0*exp(-1),i0*exp(-1)],'Color','r','LineStyle','--')
text(tau+1,i0*exp(-1),'Time constant: 37% of i0 in 10 seconds')
hold on 
plot(tau,i0*exp(-1),'o')
% Plot and label lines: 1% point
line([4.6*tau,4.6*tau],[0,0.01*i0],'Color','g','LineStyle','--')
line([0,4.6*tau],[0.01*i0,0.01*i0],'Color','g','LineStyle','--')
plot(4.6*tau,0.01*i0,'o')
text(32,0.01*i0+0.005,'1% of initial current in 46 seconds')
% Label graph
title('Exponential decay of current in an RC circuit'),
ylabel('Current i(t) [A]'),xlabel('Time t [s]')
hold off
```

+++ {"slideshow": {"slide_type": "notes"}}

The MATLAB code to reproduce this result is given in [example8.mlx](matlab/example8.mlx)

+++ {"slideshow": {"slide_type": "slide"}}

(unit5.2.2)=
## Natural frequency

The locations of the poles in the $s$-plane determine the natural oscillation frequencies present in the system.

+++ {"slideshow": {"slide_type": "notes"}}

Consider a pole in the complex plane illustrated in {numref}`fig:unit5.2:1`

+++ {"slideshow": {"slide_type": "subslide"}}

:::{figure-md} 

<img src="pictures/complex_pole.png" alt="Phase  and magnitude  of pole  shown in the complex plane" width="50%" />           
Phase  and magnitude  of pole  shown in the complex plane
:::

+++ {"slideshow": {"slide_type": "subslide"}}

* The natural (undamped) frequency (in rad/s) contributed by a pole $p$ is the pole magnitude, $r=\left|p\right|$.
* The phase, $\phi=\arg p$, determines the relative strength of the oscillatory component.

+++ {"slideshow": {"slide_type": "slide"}}

## Analysis of a second-order system

Second-order systems with a pair of conjugate poles and no zeros are useful for illustrating the natural frequency response analytically. It is helpful to write this type of system in the form:

$$G(s) = \frac{K}{s^2 + 2\zeta\omega_n s + \omega_n^2 }$$ 

where 

* $K$ is the gain coefficient
* $\zeta$ is the damping ratio already introduced in {ref}`unit5.1.4`
* and $\omega_n$ is the (undamped) natural frequency.

+++ {"slideshow": {"slide_type": "notes"}}

These parameters are helpful for drawing a connection between the natural response of the system and the properties of the poles. In this section, the poles of the second-order system will be analytically computed and related to the natural response of the system.

+++ {"slideshow": {"slide_type": "subslide"}}

### Pole analysis

The poles of the system occur when the denominator is zero:

$$p_{1,2} = -\zeta\omega_n \pm \omega_n \sqrt{\zeta^2 - 1}$$
    

+++ {"slideshow": {"slide_type": "fragment"}}

For simplicity, consider $\zeta \in [0,1)$. In this case, the poles are
    
$$p_{1,2} = -\zeta\omega_n \pm j \omega_n \sqrt{1 - \zeta^2}$$

+++ {"slideshow": {"slide_type": "subslide"}}

As stated above, the natural frequency is defined as the magnitude of the pole. The magnitude is computed as :

$$\sqrt{\mathbf{Re}^2 + \mathbf{Im}^2}$$

+++ {"slideshow": {"slide_type": "subslide"}}

Using the definitions illustrated in {numref}`fig:pz:3`, $\mathbf{Re} = -\sigma = -\zeta\omega_n$ and $\mathbf{Im} = \omega = \omega_n \sqrt{1 - \zeta^2}$, so :

+++ {"slideshow": {"slide_type": "fragment"}}

\begin{array}{rl} |p|
 &= \sqrt{\sigma^2 + \omega^2} \\
 &= \sqrt{ (-\zeta \omega_n)^2 + ( \pm \omega_n \sqrt{1-\zeta^2})^2 } \\ 
 &= \sqrt{ \zeta^2 \omega_n^2 + \omega_n^2 (1-\zeta^2) } \\ 
 &= |\omega_n|\ 
\end{array}

+++ {"slideshow": {"slide_type": "notes"}}

This illustrates why this form of the equation is used: the natural frequency is the parameter $\omega_n$.

+++ {"slideshow": {"slide_type": "subslide"}}

The damping ratio $\zeta$ determines the relative strength of the exponential part of the response. 

+++ {"slideshow": {"slide_type": "fragment"}}

As $\zeta\to 1$, the complex part of the pole tends to zero, implying less oscillatory and stronger exponential behavior. 

+++ {"slideshow": {"slide_type": "fragment"}}

For stable systems, that implies greater damping. 

+++ {"slideshow": {"slide_type": "subslide"}}

The gain coefficient $K$ affects the magnitude of the response, not the time-dependent behavior.

+++ {"slideshow": {"slide_type": "subslide"}}

### Natural response

The impulse response of a system $H(s)$ is also called the *natural response*. The natural response $y(t)$ is computed by taking the inverse Laplace transform of

$$\frac{Y(s)}{X(s)} = \frac{Y(s)}{1} = \frac{ K }{s^2 + 2 \zeta \omega_n s  + \omega_n^2}$$
        
because the impulse $x(t)=\delta(t)$ has a Laplace transform $1$. You can find the response's analytic form by referring to a table or using the MATLAB [ilaplace](https://uk.mathworks.com/help/symbolic/sym.ilaplace.html) function.

```{code-cell}
---
slideshow:
  slide_type: subslide
---
syms s zeta omega_n K Y(s) y(t)
Y(s) = K/(s^2 + 2*zeta*omega_n*s + omega_n^2)
```

```{code-cell}
---
slideshow:
  slide_type: fragment
---
y(t) = ilaplace(Y); % The impulse response in the time domain
```

+++ {"slideshow": {"slide_type": "fragment"}}

Gives the result

$$x(t) = \frac{K\,{\mathrm{e}}^{-\zeta\, \omega_n \,t } \,\sin \left(\omega_n \,t\,\sqrt{1-\zeta^2 }\right)}{\omega_n \,\sqrt{1-\zeta^2 }}$$ (eq:unit5.1:1)

+++ {"slideshow": {"slide_type": "subslide"}}

Notice that the impulse response is a product of an exponential and sine function. From these functions observe that:
* The sine function frequency (in rads/s) is $\omega_n \,\sqrt{1-\zeta^2 }$. If the damping $\zeta=0$, then the frequency is $\omega_n$. This is the reason $\omega_n$  is often referred to as the *undamped natural frequency*.
* The rate of decay of the exponential damping function is $\zeta\omega_n$. 
* The gain parameter $K$ only contributes as a constant multiplier to the magnitude of the response.

+++ {"slideshow": {"slide_type": "slide"}}

(unit5.2.3)=
## Step-response of a second-order system

+++ {"slideshow": {"slide_type": "slide"}}

(examples16)=
## Exercises 16

+++ {"slideshow": {"slide_type": "subslide"}}

(ex16.1)=
### Exercise 16.1

A signal or system response $f(t)$ contains the terms

$$\cdots - e^{-2t} - 0.1 t^2 \cos(3t + 5) \cdots$$ (eq:ex16:1)

(a) How many poles are there in $F(s)$?

(b) What is the nature of the response due to the terms given in {eq}`eq:ex16:1`?

(c) Which are the dominant poles?

+++ {"slideshow": {"slide_type": "subslide"}}

(ex16.2)=
### Exercise 16.2

A system has poles $s = 0,\,1\pm j,\,-1,\, -2\pm j2,\,-3$ and zeros at $s = -1.5,\,-3\pm j3$.

(a) Give the transfer function $F(s)=b(s)/a(a)$

(b) Plot the poles on a pole zero map

(c) Give the time constant $\tau$, doubling time $T$, damping ratio $\zeta$, angle $\theta$, natural frequency $\omega_n$, and quality factor $Q$ as appropriate for each pole or pole pair.

(d) How do the zeros affect the response $f(t)$?

(e) Which is the dominant pole?

(f) Will the system be stable or unstable?

+++ {"slideshow": {"slide_type": "notes"}}

#### Partial solution to Exercise 16.2

The poles and zeros can be entered into MATLAB

```{code-cell}
---
slideshow:
  slide_type: notes
---
z = [-1.5; -3 - 3j; -3 + 3j];
p = [0; 1 + j; 1 - j; -1; -2 + 2j; -2 - 2j; -3];
% Define a transfer function in zero-pole-gain form
Fs = zpk(z,p,1)
```

+++ {"slideshow": {"slide_type": "notes"}}

(a) The transfer function is

```{code-cell}
---
slideshow:
  slide_type: notes
---
tf(Fs)
```

+++ {"slideshow": {"slide_type": "notes"}}

(b) The pole-zero map

```{code-cell}
---
slideshow:
  slide_type: notes
---
pzmap(Fs),xlim([-4,1]),ylim([-4,4]),title('Pole zero map for Example 16.2')
```

+++ {"slideshow": {"slide_type": "notes"}}

**Bonus**: the step response is

```{code-cell}
---
slideshow:
  slide_type: notes
---
step(Fs)
```

+++ {"slideshow": {"slide_type": "notes"}}

## Summary

+++ {"slideshow": {"slide_type": "notes"}}

(unit5.2:takeaways)=
### Take aways

#### Real pole $s=\sigma$:

* Growth rate:, $\sigma > 0$, the exponential signal doubles every $T\approx 0.7/\sigma$ s.
* Time constant: $\sigma < 0$, the exponential signal decays to $37\%$ of it's original value in $\tau = 1/\sigma$ s. The expontial signal reaches $1\%$ of it's original value in $t\approx 4.6\tau$ s.

#### Complex pole pair $s = \sigma \pm j\omega$:

+++ {"slideshow": {"slide_type": "notes"}}

## Still to come

We will the conclude this module by considering frequency response analysis of signals and systems defined by rational polynomials in $s$.

+++ {"slideshow": {"slide_type": "notes"}}

## References

+++ {"slideshow": {"slide_type": "notes"}}

## Footnotes
