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

(Systems_Described_by_Differential_Equations)=
# Unit 3.3: Systems Described by Differential Equations

This section is based on Section 2.5 of {cite}`schaum`

+++ {"slideshow": {"slide_type": "notes"}}

Follow along at [cpjobling.github.io/eg-150-textbook/lti_systems/lti3](https://cpjobling.github.io/eg-150-textbook/lti_systems/lti3)

![QR Code for this lecture](pictures/qrcode_lti3.png)

+++ {"slideshow": {"slide_type": "notes"}}

## Subjects to be covered

We conclude our introduction to continuous-time LTI system by considering

* {ref}`Continuous_Time_LTI_Systems_Described_by_Differential_Equations`
* {ref}`examples_8`

+++ {"slideshow": {"slide_type": "notes"}}

(Continuous_Time_LTI_Systems_Described_by_Differential_Equations)=
## Continuous-time LTI systems described by differential equations

* {ref}`ccde_a_linear_constant_coefficient_differential_equations`
* {ref}`ccde_b_linearity`
* {ref}`ccde_c_causality`
* {ref}`ccde_d_time_invariance`
* {ref}`ccde_e_impulse_response`

+++ {"slideshow": {"slide_type": "subslide"}}

(ccde_a_linear_constant_coefficient_differential_equations)=
### A. Linear constant-coefficient differential equations

A general $N$th-order linear constant-coefficient ordinary differential (LCCODE) equation is given by

$$a_N\frac{d^N}{dt^N}y(t) + a_{N-1}\frac{d^{N-1}}{dt^{N-1}} y(t) + \cdots + a_1\frac{d}{dt} y(t) +a_0 y(t) + a_0 y(t)\\
\quad\quad\quad = b_M\frac{d^M}{dt^M}x(t) + b_{M-1}\frac{d^{M-1}}{dt^{M-1}} x(t) + \cdots + b_1\frac{d}{dt} x(t) +a_0 x(t)$$

where the coeeficients $a_k$ and $b_k$ are real constants and usually $N > M$.

+++ {"slideshow": {"slide_type": "fragment"}}

The order $N$ refers to the highest derivative of $y(t)$ in the differential equation.

+++ {"slideshow": {"slide_type": "subslide"}}

The LCCODE can be written in more compact form as

$$\sum_{k=0}^N a_k \frac{d^k}{dt^k} y(t)=\sum_{k=0}^M b_k \frac{d^k}{dt^k} x(t)$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Applications of linear constant-coefficient differential equations

LCCODEs play a central role in describing the input-output relationships of a wide variety of electrical, mechanical, chemical and biological systems.

+++ {"slideshow": {"slide_type": "subslide"}}

{un3.3:rc}=
#### Illustration: An RC Circuit

For instance, in the RC circuit considered in {ref}`ex4.1`, the input $x(t)=v_s(t)$ and the output $y(t)=v_c(t)$ are related by a first-order constant-coefficient differential equation

$$\frac{dy(t)}{dt}+\frac{1}{RC}y(t)=\frac{1}{RC}x(t)$$

+++ {"slideshow": {"slide_type": "fragment"}}

So, by inspection, $N=1$, $a_1 = 1$, $a_0 = b_0 = 1/RC$.

+++ {"slideshow": {"slide_type": "subslide"}}

#### General solution of the general linear constant-coefficient differential equation

The general solution of the general linear constant-coefficient differential equation for a particular input $x(t)$ is given by

$$y(t)=y_p(t)+y_h(t)$$

+++ {"slideshow": {"slide_type": "fragment"}}

where $y_p(t)$ is a *particular solution* satisfying the linear constant-coefficient differential equation and $y_h(t)$ is a *homegeneous solution* (or *complementary solution*) satisfying the homegeneous differential equation

$$\sum_{k=0}^N a_k \frac{d^k}{dt^k}y(t)=0$$

+++ {"slideshow": {"slide_type": "fragment"}}

The exact form of $y_h(t)$ is determined by $N$ auxiliary conditions.

+++ {"slideshow": {"slide_type": "subslide"}}

Note that 

$$\sum_{k=0}^N a_k \frac{d^k}{dt^k}y(t)=\sum_{k=0}^M b_k \frac{d^k}{dt^k} x(t)$$

does not completely specify the the output $y(t)$ in terms of $x(t)$ unless auxiliary conditions are defined. In general. a set of auxiliary conditions are the values of

$$y(t),\frac{d}{dt}y(t),\ldots,\frac{d^{N-1}}{dt^{N-1}}y(t)$$

at some point in time.

+++ {"slideshow": {"slide_type": "subslide"}}

(ccde_b_linearity)=
### B. Linearity

The system defined by 

$$\sum_{k=0}^N a_k \frac{d^k}{dt^k}y(t)=\sum_{k=0}^M b_k \frac{d^k}{dt^k} x(t)$$

will be linear only if all the auxilliary conditions are zero (see {ref}`ex8_4`).

+++ {"slideshow": {"slide_type": "subslide"}}

If the auxilliary conditions are not zero, then the response $y(t)$ of a system can be expressed as

$$y(t) = y_\mathrm{zi}(t) + y_\mathrm{zs}(t)$$

where $y_\mathrm{zi}(t)$ called the *zero-input response*, is the response to the aunxilliary conditions, and $y_\mathrm{zs}(t)$, called the *zero-state response*, is the response of a linear system with zero auxiliary conditions.

+++ {"slideshow": {"slide_type": "subslide"}}

This is illustrated in {numref}`fig:zs_and_zi_responses`

:::{figure-md} fig:zs_and_zi_responses
<img src="pictures/zi_and_zs.png" alt="Zero-state and zero-input responses" width="60%">

Zero-state and zero-input responses
:::

+++ {"slideshow": {"slide_type": "notes"}}

Note that $y_\mathrm{zi}(t) \neq y_h(t)$ and $y_\mathrm{zs}(t) \neq y_p(t)$ and that in general $y_\mathrm{zi}(t)$ contains $y_h(t)$ and $y_\mathrm{zs}(t)$ contains both $y_h(t)$ and $y_p(t)$ (see {ref}`ex8_3`).

+++ {"slideshow": {"slide_type": "subslide"}}

(ccde_c_causality)=
### C. Causality

In order for the linear system described by a linear constant-coefficient differential equation

$$\sum_{k=0}^N a_k \frac{d^k}{dt^k}y(t)=\sum_{k=0}^M b_k \frac{d^k}{dt^k}x(t)$$

to be causal, we must assume the condition of *initial rest* (or an *initially relaxed condition*).

+++ {"slideshow": {"slide_type": "subslide"}}

That is, if $x(t)=0$ for $t\le t_0$, then assume $y(t) = 0$ for $t\le t_0$ (See {ref}`ex4_6`).

+++ {"slideshow": {"slide_type": "subslide"}}

Thus, the response for $t > t_0$ can be calculated from the linear constant-coefficient differential equation with the initial conditions

$$y(t_0)=\frac{d}{dt}y(t_0)=\cdots=\frac{d^{N-1}}{dt^{N-1}}y(t_0)=0$$

where

$$\frac{d^k}{dt^k}y(t_0) = \left.\frac{d^k}{dt^k}y(t)\right|_{t=t_0}$$

+++ {"slideshow": {"slide_type": "fragment"}}

Clearly, at initial rest, $y_\mathrm{zs}(t)=0$.

+++ {"slideshow": {"slide_type": "subslide"}}

(ccde_d_time_invariance)=
### D. Time-invariance

For a linear causal system, initial rest also implies time-invariance ({ref}`ex8_6`).

+++ {"slideshow": {"slide_type": "subslide"}}

(ccde_e_impulse_response)=
### E. Impulse response

The impulse response $h(t)$ of a linear constant-coefficient differential equation satisfies the differential equation

$$\sum_{k=0}^N a_k \frac{d^k}{dt^k}y(t) = \sum_{k=0}^M b_k \frac{d^k}{dt^k} \delta(t)$$

with the initial rest condition.

+++ {"slideshow": {"slide_type": "fragment"}}

Examples of finding impulse responses are given in {ref}`ex8_6` to {ref}`ex8_8`.

+++ {"slideshow": {"slide_type": "subslide"}}

### A peek into the future

Later in this course, and probably for the rest of your career, you will find the impulse and other responses by using the Laplace transform.

+++ {"slideshow": {"slide_type": "slide"}}

(examples_8)=
## Exercises 8: Systems described by differential equations

+++ {"slideshow": {"slide_type": "subslide"}}

(ex8_1)=
### Exercise 8.1 

The continuous-time system shown in {numref}`fig:ex:8.1` consists of one integrator and one scalar multiplier. Write the differential equation that relates the output $y(t)$ to the input $x(t)$.

:::{figure-md} fig:ex:8.1
<img src="pictures/ex8_1.png" alt="A one-integrator linear system" width="40%">

A one-integrator linear system
:::

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 2.18 in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

#### MATLAB Solution

```{code-cell}
---
slideshow:
  slide_type: notes
---
cd matlab
```

```{code-cell}
---
slideshow:
  slide_type: fragment
---
open examples8
```

+++ {"slideshow": {"slide_type": "notes"}}

You can download and run these scripts and try them yourself.

* MATLAB Scipt [examples8.slx](https://github.com/cpjobling/eg-150-textbook/blob/main/lti_systems/matlab/examples8.mlx?raw=true)
* Simulation model [example8_1.slx](https://github.com/cpjobling/eg-150-textbook/blob/main/lti_systems/matlab/example8_1.slx?raw=true)

+++ {"slideshow": {"slide_type": "subslide"}}

(ex8_2)=
### Exercise 8.2

The continuous-time system shown in {numref}`fig:ex:8.2` consists of two integrators and two scalar multipliers. Write the differential equation that relates the output $y(t)$ to the input $x(t)$.

:::{figure-md} fig:ex:8.2
<img src="pictures/ex8_2.png" alt="A two-integrator linear system" width="60%">

A two-integrator linear system
:::

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 2.19 in in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

#### MATLAB Solution

* Simulink model [example8_2.slx](https://github.com/cpjobling/eg-150-textbook/blob/main/lti_systems/matlab/example8_2.slx?raw=true)

+++ {"slideshow": {"slide_type": "notes"}}

```{note}
As we will be moving on to show how differential equations can be solved by the Laplace transform, the remaining examples are optional and will not be examined.
```

+++ {"slideshow": {"slide_type": "subslide"}}

(ex8_3)=
### Exercise 8.3

Consider a continuous-time system whose input $x(t)$ and output $y(t)$ are related by

$$\frac{dy(t)}{dt}+ay(t)=x(t)$$

where $a$ is a constant.

(a) Find $y(t)$ with the auxilliary condition $y(0) = y_0$ and

$$x(t) = Ke^{-bt}u_0(t)$$

(b) Express $y(t)$ in terms of the zero-input and zero-state responses.

+++ {"slideshow": {"slide_type": "notes"}}

#### Solution

This is an example of how a first-order LCCODE would be solved. We provide as an instructional example but will assume that you will be tested on this in other modules.

a) Given that 

$$\frac{d}{dt}y(t)+ay(t)=x(t)$$

we assume that the *particular solution* will be of the form $y_p(t) = Ae^{-bt}$. 

Substituting for $y_p(t)$ in the differential equation we have

$$-bAe^{-bt}+aAe^{-bt} = Ke^{-bt}$$

from which, after cancelling the common term $e^{-bt}$, gives

$$A = K(a -b)$$

and 

$$y_p(t) = \frac{K}{a-b}e^{-bt}\quad t > 0$$ 

To obtain the *homegenous solution* we assume that

$$y_h(t) = Be^{st}$$

Substituting for $y_h(t)$ in the differential equation we have

$$sBe^{st} + aBe^{st} =\left( s + a\right)e^{st} = 0$$

so $s=-a$ and

$$y_h(t) = Be^{-at}$$

Combining $y_p(t)$ and $y_h(t)$ we have

$$y(t) = y_p(t) + y_h(t) = Be^{-at} + \frac{K}{a-b}e^{-bt}\quad t> 0$$

Using the auxilary equation $y(0) = y_0$

$$B = y_0 - \frac{K}{a - b}$$

then

$$y(t) = \left(y_0 - \frac{K}{a - b}\right) + \frac{K}{a-b}e^{-bt}\quad t> 0$$

For $t < 0$ we have $x(t) = 0$ and the differential equation becomes equal to the homogeneous equation $y_h(t)$ so

$$y(t) = Be^{-at}\quad t < 0$$

From the auxillary equation $y(0) = y_0$, we obtain

$$y(t) = y_0e^{-at}\quad t < 0$$

+++ {"slideshow": {"slide_type": "notes"}}

b) Combining the solutions for $y(t) > 0$ and $y(t) < 0$, y(t) can be expression in terms of $y_\mathrm{zi}(t)$ (zero-input response and $y_\mathrm{zs}(t)$ (zero-state response) as

$$y(t) = y_0 e^{-at} + \frac{K}{a-b}\left(e^{-bt}-e^{-at}\right) u_0(t)$$

$$y(t) = y_\mathrm{zi}(t) + y_\mathrm{zs}(t)$$

where

$$y_\mathrm{zi}(t) = y_0e^{-at}$$

and

$$y_\mathrm{zs}(t) = \frac{K}{a-b}\left(e^{-bt}-e^{-at}\right) u_0(t)$$

+++ {"slideshow": {"slide_type": "subslide"}}

(ex8_4)=
### Exercise 8.4

Consider the system in {ref}`ex8_3`.

(a) Show that the system is not linear if $y(0)=y_0\neq 0$.

(b) Show that the system is linear if $y(0) = 0$.

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, see the solved problem 2.21 in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex8_5)=
### Exercise 8.5

Consider the system in {ref}`ex8_3`. Show that the initial rest condition $y(0) = 0$ also implies that the system is time-invariant.

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, see the solved problem 2.22 in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex8_6)=
### Exercise 8.6

Consider the system in {ref}`ex8_3`. Find the impulse response $h(t)$ of the system.

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, see the solved problem 2.23 in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex8_7)=
### Exercise 8.7

Consider the system in {ref}`ex8_3` with $y(0)=0$. 

(a) Find the step response $s(t)$ of the system without using the impulse response $h(t)$.

(b) Find the step response $s(t)$ of the system with the impulse response $h(t)$ obtained in {ref}`ex8_6`.

(c) Find the impulse response $h(t)$ from the step response $s(t)$.

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, see the solved problem 2.24 in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex8_8)=

### Exercise 8.8

Consider the system described by

$$\frac{dy(t)}{dt} + 2y(t) = x(t) + \frac{dx(t)}{dt}$$

Find the impulse response $h(t)$ of the system.

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 2.25 in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "slide"}}

## Summary

In this lecture we have concluded our introduction to LTI systems by looking at linear constant-coefficient differential equations.

(unit3.3:takeaways)=
### Unit 3.3: Take aways

#### LCCODEs

Continuous-time LTI systems are often modelled as linear constant coefficient ordinary differential equations (LCCODEs). The solution of such equations has wide application in engineering and science.

The general description of a LCCODE is given in compact form as:

$$\sum_{k=0}^N a_k \frac{d^k}{dt^k} y(t)=\sum_{k=0}^M b_k \frac{d^k}{dt^k} x(t)$$

where the coefficients $a_k$ and $b_k$ are real constants and $n$ and $m$ are integers.

We illustrated in {ref}`un3.3:rc` that the simple RC circuit can be represented as such an LCCODE.

#### Solution of LCCODEs

The solution of LCCODEs requires the determination and combination of the *homegenious solution* which is due only to the output $y(t)$ and its derivatives, and a *particular solution* which takes account of the input $x(t)$, its derivatives, and the initial values of $y(t)$ and its derivatives.

We were told that continuous-time LTI systems defined by LCCODEs are only *causal* and *time invariant* if they are initially at rest.

The output of the continuous-time LTI system with input $x(t)$ that is at rest and has zero initial conditions is called the *zero-state* output $y_\mathrm{zs}(t)$. The outputs due to the inital conditions can be computed from the system with zero input which is named $y_\mathrm{zi}(t)$. The total response of such a system is given by $y(t) = y_\mathrm{zs}(t) + y_\mathrm{zi}(t)$.

For reference, a fully worked solution of a first-order LCCODE is provided in {ref}`ex8_3`. **You will not be expected to solve such problems in the assessments for this module**.

#### Analogue computer models

In {ref}`examples_8` we were introduced to the representation of an LCCODE as a block diagram constructed from integral, gain and summing blocks. Such models were the basis of *analogue computation* which was used widely by engineers before the widespread adoption of digital computers. Models based on integration are still the basis of modern numerical digital system simulation tools like Multisim and Simulink. 

Examples of the solution of {ref}`ex8_1` and {ref}`ex8_2` have been provided in MATLAB and Simulink.

### Looking ahead

Any continuous-time LTI system that can be represented by an LCCODE can be solved by taking the *Laplace transform* of the differential equation. The derivative terms like $a_k d^n y(t)/dt^n$ become polynomial terms like $a_k s^n Y(s)$, where $Y(s)$ is the Laplace transform of $y(t)$. As we shall see in {ref}`unit4`, such systems are then representable as rational polynomials in $s$ and are easily solved using algebraic techniques such as *polynomial factorization* and *partial fraction expansion*.

+++ {"slideshow": {"slide_type": "subslide"}}

### Continuous-Time LTI Systems Described by Differential Equations

* {ref}`ccde_a_linear_constant_coefficient_differential_equations`
* {ref}`ccde_b_linearity`
* {ref}`ccde_c_causality`
* {ref}`ccde_d_time_invariance`
* {ref}`ccde_e_impulse_response`

+++ {"slideshow": {"slide_type": "slide"}}

## Next Time

We move on to consider 

* {ref}`laplace`

## References

```{bibliography}
:filter: docname in docnames
```
