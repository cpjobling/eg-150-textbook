---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.16.7
kernelspec:
  display_name: MATLAB Kernel
  language: matlab
  name: jupyter_matlab_kernel
---

+++ {"slideshow": {"slide_type": "slide"}}

(elementary_signals)=
# Unit 2.3: Elementary Signals

The preparatory reading for this section is [Chapter 1](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=3384197&ppg=75#ppg=17) of {cite}`karris` which

* begins with a discussion of the elementary signals that may be applied to electrical circuits
* introduces the unit step, unit ramp and dirac delta functions
* presents the sampling and sifting properties of the delta function and
* concludes with examples of how other useful signals can be synthesised from these elementary signals.

Additional information has been adapted from [Section 1.4]() of {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

Follow along at [cpjobling.github.io/eg-150-textbook/signals_and_systems/elementary_signals](https://cpjobling.github.io/eg-150-textbook/signals_and_systems/elementary_signals)

![QR Code](pictures/qrcode_unit2.3.png)

+++ {"slideshow": {"slide_type": "slide"}}

(es:intro)=
## Introduction

+++ {"slideshow": {"slide_type": "subslide"}}

Consider the network shown in below where the switch is closed at time $t=T$ and all components are ideal. 

![Network with a switch which is closed at t = T.](./pictures/circuit2.png)

Express the output voltage $V_{\mathrm{out}}$ as a function of the unit step function, and sketch the appropriate waveform.

+++ {"slideshow": {"slide_type": "subslide"}}

### Slido poll 1

+++ {"slideshow": {"slide_type": "subslide"}}

**Solution**

Before the switch is closed at $t < T$:

$$V_{\mathrm{out}} = 0.$$

After the switch is closed for $t > T$: 

$$V_{\mathrm{out}} = V_s.$$

+++ {"slideshow": {"slide_type": "subslide"}}

We imagine that the voltage jumps instantaneously from 0 to $V_s$ volts at $t = T$ seconds as shown below.

<img src="./pictures/step.png" width = "30%"  alt="The step function" />

We call this type of signal a step function.

+++ {"slideshow": {"slide_type": "subslide"}}

What is happening at $t=0$?

+++ {"slideshow": {"slide_type": "fragment"}}

Mathematically, the value of the signal at $t=0$ is *undefined* and the time derivative is infinite. In practice, we could imagine that the signal will be somewhere on the dotted line. But, we don't know where.

+++ {"slideshow": {"slide_type": "slide"}}

(heaviside)=
## The Unit Step Function

$${u_0}(t) = \left\{ {\begin{array}{*{20}{c}}
{0\quad t < 0}\\
{1\quad t > 0}
\end{array}} \right.$$

![The unit step function](./pictures/unitstep.png)

+++ {"slideshow": {"slide_type": "subslide"}}

### In MATLAB

In MATLAB, we use the `heaviside` function (named after [Oliver Heaviside](https://en.wikipedia.org/wiki/Oliver_Heaviside)) to model the unit step signal.

```{code-cell}
---
slideshow:
  slide_type: fragment
---
cd('/Users/eechris/code/src/github.com/cpjobling/eg-150-textbook/signals_and_systems/elementary_signals')
edit plot_heaviside
```

```{code-cell}
---
slideshow:
  slide_type: subslide
---
plot_heaviside
```

+++ {"slideshow": {"slide_type": "notes"}}

Note that, so that it can be plotted, MATLAB defines the *Heaviside function* slightly differently from the mathematically ideal unit step:

$$\mathrm{heaviside}(t) = \left\{ {\begin{array}{*{20}{c}}
{0\quad t < 0}\\
{1/2\quad t = 0}\\
{1\quad t > 0}
\end{array}} \right.$$

+++ {"slideshow": {"slide_type": "slide"}}

(es:simple_signal_ops)=
## Simple Signal Operations

+++ {"slideshow": {"slide_type": "subslide"}}

### Amplitude Scaling

Sketch $Au_0(t)$ and $-Au_0(t)$

```{code-cell}
---
slideshow:
  slide_type: subslide
---
syms t;
u0(t) = heaviside(t); % rename heaviside function for ease of use
A = 2; % so signal can be plotted
fplot(A*u0(t),[-1,1],'LineWidth',2),ylim([-0.2,2.2]),grid,title('Amplitude scaling $$Au_0(t)$$','interpreter','latex')
```

+++ {"slideshow": {"slide_type": "notes"}}

Note that the signal is scaled in the $y$ direction.

```{code-cell}
---
slideshow:
  slide_type: subslide
---
fplot(-A*u0(t),[-1,1],'LineWidth',2),ylim([-2.2,0.2]),grid,...
title('Amplitude scaling and mirroring $$-Au_0(t)$$','interpreter','latex'),...
xlabel('t')
```

+++ {"slideshow": {"slide_type": "notes"}}

Note that, because of the sign, the signal is mirrored about the $x$ axis as well as being scaled by 2.

+++ {"slideshow": {"slide_type": "subslide"}}

### Time Reversal

Sketch $u_0(-t)$

```{code-cell}
---
slideshow:
  slide_type: subslide
---
fplot(A*u0(-t),[-1,1],'LineWidth',2),ylim([-0.2,2.2]),grid,title('Time reversal $$Au_0(-t)$$','interpreter','latex'),xlabel('t')
```

+++ {"slideshow": {"slide_type": "notes"}}

The sign on the function argument $-t$ causes the whole signal to be reversed in time. Note that another way of looking at this is that the signal is mirrored about the $y$ axis.

+++ {"slideshow": {"slide_type": "subslide"}}

### Time Delay and Advance

Sketch $u_0(t-T)$ and $u_0(t+T)$

```{code-cell}
---
slideshow:
  slide_type: subslide
---
T = 1; % again to make the signal plottable.
fplot(u0(t - T),[-1,2],'LineWidth',2),ylim([-0.2,1.2]),grid,title('Time delay $$u_0(t - T)$$','interpreter','latex'),xlabel('t')
```

+++ {"slideshow": {"slide_type": "notes"}}

This is a *time delay* ... note for $u_0(t - T)$ the step change occurs T seconds **later** than it does for $u_o(t)$.

```{code-cell}
---
slideshow:
  slide_type: subslide
---
fplot(u0(t + T),[-2,1],'LineWidth',2),ylim([-0.2,1.2]),grid,title('Time advance $$u_0(t + T)$$','interpreter','latex'),xlabel('t')
```

+++ {"slideshow": {"slide_type": "notes"}}

This is a *time advance* ... note for $u_0(t + T)$ the step change occurs T seconds **earlier** than it does for $u_o(t)$.

+++ {"slideshow": {"slide_type": "subslide"}}

### Examples

We will work through some examples in class. See [Examples 3](examples3.html).

+++ {"slideshow": {"slide_type": "slide"}}

(es:synthesis)=
## Synthesis of Signals from the Unit Step

Unit step functions can be used to represent other time-varying functions such as rectangular pulses, square waves and triangular pulses. See [Examples 3](examples3) for the examples that we will look at in class.

+++ {"slideshow": {"slide_type": "slide"}}

(es:ramp)=
## The Ramp Function

![Integrator (RC) circuit](./pictures/rc.png)

In the circuit shown above $i_s$ is a constant current source and the switch is closed at time $t=0$.

+++ {"slideshow": {"slide_type": "notes"}}

When the current through the capacitor $i_c(t) = i_s$ is a constant and the voltage across the capacitor is

$$v_c(t) = \frac{1}{C}\int_{-\infty}^{t} i_c(\tau)\;d\tau$$ 

where $\tau$ is a dummy variable.

+++ {"slideshow": {"slide_type": "notes"}}

Since the switch closes at $t=0$, we can express the current $i_c(t)$ as

$$i_c(t) = i_s u_0(t)$$

and if $v_c(t) = 0$ for $t < 0$ we have

$$v_c(t) = \frac{i_s}{C}\int_{-\infty}^{t} u_0(\tau)\;d\tau = \underbrace { \frac{i_s}{C}\int_{ - \infty }^0 0\;{\kern 1pt} d\tau }_0 + \frac{i_s}{C}\int_{0}^{t} 1\;d\tau$$

+++ {"slideshow": {"slide_type": "notes"}}

So, the voltage across the capacitor can be represented as

$$v_C(t)=\frac{i_s}{C}t u_0(t)$$

+++ {"slideshow": {"slide_type": "notes"}}

**Note** that in this as in other examples throughout these notes, and in published tables of transforms, the inclusion of $u_0(t)$ in $v_c(t)$ acts as a "gating function" that limits the definition of the signal to the causal range $0 \le t \lt \infty$.

+++ {"slideshow": {"slide_type": "subslide"}}

To sketch the wave form, let's arbitrarily let $C$ and $i_s$ be one and then plot with MATLAB.

```{code-cell}
---
slideshow:
  slide_type: subslide
---
C = 1; is = 1;
vc(t)=(is/C)*t*u0(t);
fplot(vc(t),[-1,4],'LineWidth',2),grid,title('A ramp function'),xlabel('t')
```

+++ {"slideshow": {"slide_type": "notes"}}

This type of signal is called a **ramp function**. Note that it is the *integral* of the step function (the resistor-capacitor circuit implements a simple integrator circuit).

+++ {"slideshow": {"slide_type": "subslide"}}

The unit ramp function is defined as

$$u_1(t) = \int_{-\infty}^{t}u_0(\tau)d\tau$$

so

$${u_1}(t) = \left\{ {\begin{array}{*{20}{c}}
{0\quad t < 0}\\
{t\quad t \ge 0}
\end{array}} \right.$$

and 

$$u_0(t) = \frac{d }{dt}u_1(t)$$

+++ {"slideshow": {"slide_type": "notes"}}

**Note**

Higher order functions of $t$ can be generated by the repeated integration of the unit step function. 

For future reference, you should determine $u_2(t)$, $u_3(t)$ and $u_n(t)$ for yourself and make a note of the general rule:

$$u_{n-1} = \frac{1}{n}\frac{d}{dt}u_n(t)$$

Details are given in equations 1.26&mdash;1.29 in {cite}`karris`.

+++ {"slideshow": {"slide_type": "slide"}}

(es:dirac_delta)=
## The Dirac Delta Function

![A differentiating function (RL network)](./pictures/lr.png)

In the circuit shown above, the switch is closed at time $t=0$ and $i_L(t)=0$ for $t<0$. Express the inductor current $i_L(t)$ in terms of the unit step function and hence derive an expression for $v_L(t)$.

+++ {"slideshow": {"slide_type": "notes"}}

**Solution** 

$$v_L(t) = L\frac{di_L}{dt}$$

Because the switch closes instantaneously at $t=0$

$$i_L(t) = i_s u_0(t)$$

Thus 

$$v_L(t) = i_s L\frac{d}{dt} u_0(t).$$

+++ {"slideshow": {"slide_type": "subslide"}}

(es:unit_impulse)=
### The unit Impulse Function

The unit impulse function $\delta(t)$, is the derivative of the unit step.

$$\delta(t) = \frac{d}{dt}u_0(t)$$

which is tricky to compute because $u_0(t)$ is discontinuous at $t=0$ but it must have the properties

$$\int_{-\infty}^{t}\delta(\tau)d\tau = u_0(t)$$

+++ {"slideshow": {"slide_type": "subslide"}}

To solve this problem we need to invent a function that represents the derivative of the unit step function. This function is called the *unit impulse function* 𝛿(𝑡), also known as the *Dirac delta* function (named after [Paul Dirac](https://en.wikipedia.org/wiki/Paul_Dirac)).

+++ {"slideshow": {"slide_type": "fragment"}}

Traditionally, $\delta(t)$ is often defined as the limit of a suitably chosen conventional function having unity area over an infinitesimal time interval as shown in Fig. {numref}`dirac_delta_function`.

+++ {"slideshow": {"slide_type": "subslide"}}

:::{figure-md} dirac_delta_function
<img src="pictures/dirac_delta.png" alt="Visualisation of the Dirac delta function as the limit of a conventional function with unit area." width="40%">

Visualisation of the Dirac delta function as the limit of a conventional function with unit area.
:::

+++ {"slideshow": {"slide_type": "subslide"}}

The Dirac delta posseses the following properties

$$\delta\left(t\right)=\left\lbrace \begin{array}{ll}
0 & t\ne 0\\
\infty & t = 0
\end{array}\right.$$

+++ {"slideshow": {"slide_type": "fragment"}}

$$\int_{\epsilon}^{-\epsilon}\delta(t)\,dt = 1$$

+++ {"slideshow": {"slide_type": "fragment"}}

The unit impulse function plays a fundamental role in systems analysis.

+++ {"slideshow": {"slide_type": "subslide"}}

### Sketch of the delta function

Continuing the example, and replacing the derivative of the unit step $u_0(t)$ with the unit impulse $\delta(t)$

$$V_\mathrm{out}(t)=V_L(t) = i_sL\delta(t)$$ 

![The delta function](pictures/impulse.png)

+++ {"slideshow": {"slide_type": "notes"}}

Note when we draw the unit impulse we show the height of $\delta(t)$ as one so the height of the impulse in the figure is $i_sL$.

+++ {"slideshow": {"slide_type": "subslide"}}

### MATLAB Confirmation

```{code-cell}
---
slideshow:
  slide_type: '-'
---
syms is L;
vL(t) = is * L * diff(u0(t))
```

+++ {"slideshow": {"slide_type": "notes"}}

Note that we can't plot dirac(t) in MATLAB with `fplot`. The best we can do is a stem plot.

```{code-cell}
L = 1; is = 2;
stem(0,L*is),ylim([-0.2,2.2]),title('Impulse $$v_L(t) = L*i_s*\delta(t)$$','interpreter','latex'),grid,xlabel('t')
```

+++ {"slideshow": {"slide_type": "slide"}}

(es:delta_props)=
## Important properties of the delta function

+++ {"slideshow": {"slide_type": "subslide"}}

### Sampling Property

The *sampling property* of the delta function states that

$$f(t)\delta(t-a) = f(a)\delta(t-a)$$

or, when $a = 0$,

$$f(t)\delta(t) = f(0)\delta(t)$$

+++ {"slideshow": {"slide_type": "notes"}}

Multiplication of any function $f(t)$ by the delta function $\delta(t)$ results in sampling the function at the time instants for which the delta function is not zero.

The study of descrete-time (sampled) systems is based on this property.

*You should work through the proof* for youself.

+++ {"slideshow": {"slide_type": "subslide"}}

(sifting_property)=
### Sifting Property

The *sifting property* of the delta function states that

$$\int_{-\infty}^{\infty}f(t)\delta(t-\alpha)dt=f(\alpha)$$

+++ {"slideshow": {"slide_type": "notes"}}

That is, if multiply any function $f(t)$ by $\delta(t-\alpha)$, and integrate from $-\infty$ to $+\infty$, we will get the value of $f(t)$ evaluated at $t=\alpha.$

*You should also work through the proof* for yourself.

+++ {"slideshow": {"slide_type": "subslide"}}

### Higher Order Delta Fuctions

the n*th*-order *delta function* is defined as the n*th* derivative of $u_0(t)$, that is

$$\delta^n(t)=\frac{d^n}{dt^n}[u_0(t)]$$

The function $\delta'(t)$ is called the *doublet*, $\delta''(t)$ is called the *triplet* and so on.

+++ {"slideshow": {"slide_type": "subslide"}}

By a procedure similar to the derivation of the sampling property we can show that

$$f(t)\delta'(t-a)=f(a)\delta'(t-a)-f'(t)\delta(t-a)$$

+++ {"slideshow": {"slide_type": "subslide"}}

Also, derivation of the sifting property can be extended to show that

$$\int_{-\infty}^{\infty}f(t)\delta^n(t-\alpha)dt = \left. ( - 1)^n\frac{d^n}{dt^n}[f(t)] \right|_{t = \alpha }$$

+++ {"slideshow": {"slide_type": "slide"}}

### Quiz and take aways

+++ {"slideshow": {"slide_type": "slide"}}

## Summary

In this chapter we have looked at some elementary signals and the theoretical circuits that can be used to generate them.

(unit2.3:takeaways)=
### Unit 2.3: Take aways

* You should note that the unit step is the *heaviside function* $u_0(t)$.
* Many useful signals can be synthesized by use of the unit step as a "gating function" in combination with other signals
* That unit ramp function $u_1(t)$ is the integral of the step function.
* The *Dirac delta* function $\delta(t)$ is the derivative of the unit step function. We sometimes refer to it as the *unit impulse function*.
* The delta function has sampling and sifting properties that will be useful in the development of *time convolution* and *sampling theory*.

+++ {"slideshow": {"slide_type": "notes"}}

## Exercises

We will do some of these in class. See [Examples 3](examples3.html).


## References

```{bibliography}
:filter: docname in docnames
```

+++

## Next Time

[Systems and Classification of Systems](../systems/index)
* {ref}`system_representation`
* {ref}`deterministic_and_stochastic_systems`
* {ref}`continuous_time_and_discrete_time_systems`
* {ref}`systems_with_memory_and_without_memory`
* {ref}`causal_and_non-causal_systems`
* {ref}`linear_systems_and_nonlinear_systems`
* {ref}`linear_time_invariant_systems`
* {ref}`stable_systems`
* {ref}`feedback_systems`
