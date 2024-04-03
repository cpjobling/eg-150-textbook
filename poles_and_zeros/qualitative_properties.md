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

(unit5.1)=
# Unit 5.1: Qualitative Properties of Signals and Transfer functions

{cite}`boyd93` {cite}`tfads`

+++ {"slideshow": {"slide_type": "notes"}}

The notes for this section have been adapted from [Qualitative properties of signals & Laplace transforms](https://web.stanford.edu/~boyd/ee102/qualitative.pdf) {cite}`boyd93` and was also partly influenced by the MATLAB LiveScript **PoleZeroAnalysis.mlx** from the MathWorks curriculum module [Transfer Function Analysis of Dynamic Systems](https://uk.mathworks.com/matlabcentral/fileexchange/94635-transfer-function-analysis-of-dynamic-systems) ( {cite}`tfads`).

+++ {"slideshow": {"slide_type": "notes"}}

Follow along at [cpjobling.github.io/eg-150-textbook/poles_and_zeros/qualitative_properties](https://cpjobling.github.io/eg-150-textbook/poles_and_zeros/qualitative_properties)

![QR Code for this lecture](pictures/qr_code_for_unit51.png)

+++ {"slideshow": {"slide_type": "slide"}}

## Agenda

* {ref}`unit5.1.1`
* {ref}`unit5.1.2`
* {ref}`unit5.1.3`
* {ref}`unit5.1.4`
* {ref}`unit5.1.5`
* {ref}`unit5.1.6`
* {ref}`unit5.1.7`
* {ref}`unit5.1.8`

+++ {"slideshow": {"slide_type": "slide"}}

(unit5.1.1)=
## Inverse Laplace transform of a rational $F(s)$

Suppose $F(s) = N(s)/D(s)$ is rational and strictly proper[^pz_note1] with $\mathcal{L}^{-1}\left\{F(s)\right\} = f(t)$ each term in the partial fraction expansion of $F(s)$ gives a term in $f(t)$:

+++ {"slideshow": {"slide_type": "fragment"}}

* For a single pole at $s = \lambda$[^pz_note2],

$$\mathcal{L}^{-1}\left\{\frac{1}{s-\lambda} \right\} = e^{\lambda t}$$ (eq:pz:1)

+++ {"slideshow": {"slide_type": "subslide"}}

* For a pole at $s = \lambda$ of multiplicity $k$,

$$\mathcal{L}^{-1}\left\{\frac{1}{\left(s-\lambda\right)^k} \right\} = \frac{1}{\left(k-1\right)!}t^{k-1}e^{\lambda t} $$ (eq:pz:2)

+++ {"slideshow": {"slide_type": "fragment"}}

* The *poles* of $F(s)$ determine the types of terms that appear in $f(t)$.

+++ {"slideshow": {"slide_type": "fragment"}}

* The *zeros* (or *residues*) of $F(s)$ determine the coeficients multiplying each ter, or the amplitude and phase of oscillitory terms.

+++ {"slideshow": {"slide_type": "notes"}}

[^pz_note1]: If the numerator $N(s)$ is a polynomial $b_ms^m + b_{m-1}s^{m-1} + \cdots b_1s + b_0$ and the denominator $D(s)$ is a polynomial $a_ns^n + a_{n-1}s^{n-1} + \cdots a_1s + a_0$, the rational polynomial $F(s) = N(s)/D(s)$ is strictly proper if $n > m$. We examined the case of improper rational polynomials in {ref}`ilap:improper`.

[^pz_note2]: The term $\lambda$ may be complex, in which case there will be two complex poles $\lambda_1$ and $\lambda_2$ which form the complex conjugate pairs $\lambda_{1,2} = \sigma \pm j\omega$. In this case, the poles will be represented as the roots of the quadratic factor $\left(s - \sigma - j\omega\right)\left(s - \sigma + j\omega\right) = s^2 + 2\sigma s + \left(\sigma^2 + \omega^2\right)$. The inverse Laplace transform of a such a quadratic factor will be oscilliatory.

+++ {"slideshow": {"slide_type": "slide"}}

(unit5.1.2)=
## Qualitative properties of terms

+++ {"slideshow": {"slide_type": "subslide"}}

### Real poles

+++ {"slideshow": {"slide_type": "fragment"}}

* Real, positive poles correspond to growing exponential terms

+++ {"slideshow": {"slide_type": "fragment"}}

* Real, negative poles correspond to decaying exponential terms

+++ {"slideshow": {"slide_type": "fragment"}}

* A pole at $s = 0$ corresponds to a constant (DC) term

+++ {"slideshow": {"slide_type": "subslide"}}

### Complex poles

+++ {"slideshow": {"slide_type": "fragment"}}

* Complex pole pairs with positive real part correspond to exponentially growing sinusoidal terms

+++ {"slideshow": {"slide_type": "fragment"}}

* Complex pole pairs with negative real part correspond to exponentially decaying sinusoidal terms

+++ {"slideshow": {"slide_type": "subslide"}}

### Imaginary poles

* Pure imaginary pole pairs correspond to sinusoidal terms

+++ {"slideshow": {"slide_type": "subslide"}}

### Repeated poles

* Repeated poles yield the same tyoes of terms, multiplied by powers of $t$.

+++ {"slideshow": {"slide_type": "subslide"}}

(unit5.3.3)=
## Quantitative properties of terms

+++ {"slideshow": {"slide_type": "fragment"}}

The pole $\lambda_1 = \sigma + j\omega$ and its conjugate pair $\lambda_2 = \sigma - j\omega$ will yield a time domain term 

$$ae^{\sigma t}\cos\left(\omega t + \phi\right)$$ (eq:pz:3)

+++ {"slideshow": {"slide_type": "fragment"}}

* The real part of the pole gives the *growth rate* (if positive) or *decay rate* (if negative) of the corresponding term in $f(t)$

+++ {"slideshow": {"slide_type": "fragment"}}

* The imaginary part gives the oscillation *frequency*

+++ {"slideshow": {"slide_type": "notes"}}

This is summarized in {numref}`fig:pz:1`

+++ {"slideshow": {"slide_type": "subslide"}}

:::{figure-md} fig:pz:1

<img src="pictures/quant.png" width="50%"
     alt="A figure illustrating the quantitive properties of terms f(t) resulting from the poles of F(s)." />

Illustrating the quantitive properties of the terms $f(t)$ resulting from the poles of $F(s)$
:::

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 1

Quantifying the response for $f(t) = e^{\sigma t}\cos\left(\omega t\right)$: rows $\omega = 30, 15, 0$; columns: $\sigma = -1.5, 0.75, 0, 0.75, 1.5$

```{code-cell}
---
slideshow:
  slide_type: subslide
---
format compact
cd matlab
example1
```

+++ {"slideshow": {"slide_type": "subslide"}}

The MATLAB code to reproduce this figure is given in [example1.mlx](matlab/example1.mlx)

```{code-cell}
---
slideshow:
  slide_type: fragment
---
open example1
```

+++ {"slideshow": {"slide_type": "slide"}}

(unit5.1.4)=
## Complex poles: Damping ratio $\zeta$ and quality factor $Q$

For a pole at $s = \lambda = \sigma + j\omega$ (hence also at $\bar{\lambda}$[^pz_note3]) with $\sigma < 0$:

$$F(s) = \frac{r}{s-\lambda} + \frac{\bar{r}}{s-\lambda},\;f(t) = ae^{\sigma t}\cos\left(\omega t + \phi\right)$$

+++ {"slideshow": {"slide_type": "fragment"}}

There are two measures of the decay rate per cycle of oscillation:

+++ {"slideshow": {"slide_type": "subslide"}}

* **damping ratio**

$$\zeta = \frac{-\sigma}{\sqrt{\sigma^2 + \omega^2}}$$ (eq:pz:4)

+++ {"slideshow": {"slide_type": "subslide"}}

* **quality factor**

$$Q = \frac{1}{2} \sqrt{\frac{\sigma^2 + \omega^2}{\sigma^2}} = \frac{1}{2\zeta} $$ (eq:pz:5)

+++ {"slideshow": {"slide_type": "notes"}}

[^pz_note3]: Here we are using the bar notation $\bar{x}$ to represent the complex conjugate of complex number $x$.

+++ {"slideshow": {"slide_type": "subslide"}}

The damping ratio (or $Q$) is related to the $angle$ of the pole in the complex plane as shown in {numref}`fig:pz:3`:

:::{figure-md} fig:pz:3

<img src="pictures/fig3.png" alt="The damping ratio is related the the angle of the pole in the complex plane" width="50%" />

The damping ratio is related the the angle of the pole in the complex plane
:::

+++ {"slideshow": {"slide_type": "subslide"}}

The oscillation is

+++ {"slideshow": {"slide_type": "fragment"}}

* underdamped: $\zeta < 1$ ($Q > 1/2$)

+++ {"slideshow": {"slide_type": "fragment"}}

* critically damped: $\zeta = 1$ ($Q = 1/2$)

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 2: parallel RLC circuit

Consider the parallel RLC citcuit shown in {numref}`fig:pz:4`

:::{figure-md} fig:pz:3

<img src="pictures/example2.png" alt="Parallel RCL circuit: resistor R in parallel with inductor L and capacitor C. The supplied voltage is the voltage across the capacitor v and the current is the current flowing the the inductor." width="50%" />

Parallel RLC circuit (reproduced from page 6-8 of {cite}`boyd93`)
:::

+++ {"slideshow": {"slide_type": "subslide"}}

Taking Laplace transforms we have 

$$V(s) = -sL I(s)$$ (eq:pz:6)

+++ {"slideshow": {"slide_type": "fragment"}}

and

$$sCV(s) = I(s) - \frac{V(s)}{R} $$ (eq:pz:7)

+++ {"slideshow": {"slide_type": "fragment"}}

So

$$\left(s^2 + \frac{1}{RC} s + \frac{1}{LC}\right) = 0$$ (eq:pz:8)

+++ {"slideshow": {"slide_type": "subslide"}}

The roots of the quadratic on the left-hand-side of ({eq}`eq:pz:7`) are given by

$$\begin{align}
\lambda &= \frac{-\frac{1}{RC}  \pm \sqrt{\frac{1}{RC}^2 - \frac{4}{LC}}}{2}\\
&= -\frac{1}{2RC}  \pm \sqrt{\frac{1}{4R^2C^2} - \frac{1}{LC}}\\
\end{align}$$

+++ {"slideshow": {"slide_type": "subslide"}}

If we assume that the system is underdamped then

$$\frac{1}{LC} > \frac{1}{4R^2C^2}$$

+++ {"slideshow": {"slide_type": "fragment"}}

and

$$\lambda = -\frac{1}{2RC} \pm j \sqrt{\frac{1}{LC} - \frac{1}{4R^2C^2}}$$

+++ {"slideshow": {"slide_type": "subslide"}}

giving

$$\sigma =  -\frac{1}{2RC}$$

+++ {"slideshow": {"slide_type": "fragment"}}

and

$$\omega = \sqrt{\frac{1}{LC} - \frac{1}{4R^2C^2}}$$

+++ {"slideshow": {"slide_type": "subslide"}}

This means that

$$Q = \frac{{R}}{\sqrt{L/C}}$$

+++ {"slideshow": {"slide_type": "fragment"}}

and

$$\zeta = \frac{\sqrt{L/C}}{2R}$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Intepretation

$Q$ is a neasure of the number of cycles to decay

* Time to decay to 1% of amplitude us about $4.6/|\sigma|$
* The period of oscilation is $2\pi/\omega$
* The number of cycles to decay to 1% amplitude

$$N_{1\%}\approx \frac{4.6/|\sigma|}{2\pi/\omega} = 1.46 \frac{\omega}{2|\sigma|} $$

A rule of thumb (accurate for $Q>2$ or so):

$$N_{1\%}\approx 1.46 Q $$

Another rule of thumb: $N_{4\%} \approx Q$

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 3

Assume $\omega = 2\pi$ rad/s (so period $T = 1$ s). Plot the response $e^{-\sigma t}\cos\left(\omega t\right)$ for $Q = 20$ and $Q=10$.

+++ {"slideshow": {"slide_type": "subslide"}}

### Solution to example 4

Given that

$$Q = \frac{1}{2} \sqrt{\frac{\omega^2 + \sigma^2}{\sigma^2}}$$

it is relatively easy to show that

$$\sigma = \frac{\omega}{\sqrt{4Q^2 - 1}}$$

So to plot this:

```{code-cell}
---
slideshow:
  slide_type: slide
---
omega = 2*pi;
t = linspace(0,30,1000);
Q = 20;
sigma = omega/sqrt(4*Q^2 - 1);
subplot(211)
plot(t,exp(-sigma*t).*cos(omega*t)),title('Q = 20')
Q = 10;
sigma = omega/sqrt(4*Q^2 - 1);
subplot(212)
plot(t,exp(-sigma*t).*cos(omega*t)),title('Q = 10')
```

+++ {"slideshow": {"slide_type": "slide"}}

(unit5.1.5)=
## Dominant Poles

Suppose the poles of $F(s)$ are $p_1,\ldots,p_n$. The asymptotic growth (or decay if $<0$) is determined by the *maximum real part*:

$$\alpha = \left\{\Re p_1,\ldots\Re p_n\right\}$$

+++ {"slideshow": {"slide_type": "fragment"}}

* The pole (pr poles) which achieve this maximum real part are called **dominant**

+++ {"slideshow": {"slide_type": "fragment"}}

* As $t \to \infty$ these terms become larger and larger compared to the other terms, no matter what the residues.

+++ {"slideshow": {"slide_type": "notes"}}

As an example, see {numref}`fig:pz:4`. Although this system has six poles, the pole closest to $s = 0$ has the largest real part and so will be dominant.

+++ {"slideshow": {"slide_type": "subslide"}}

:::{figure-md} fig:pz:4

<img src="pictures/fig4.png" alt="Illustration of a dominant pole" width="50%" />

Dominant poles in a transform $F(s)$
:::

+++

### Example 4

Let

$$F(s) = \frac{100}{s+2} + \frac{1}{s+1}$$

From transform tables

$$f(t) = 100e^{-2t} + e^{-t}$$

* The assymptic decay rate is determined by the pole at $s = -1$
* Assymptotcally, $f(t)$ decays like $e^{-t}$
* Even though associated with the residue for the nondominant pole is 100 times larger, the term associated with the dominant pole is larger  for $t > 4.6$.

```{code-cell}
---
slideshow:
  slide_type: subslide
---
t = linspace(0,10,1000);
f1 = 100*exp(-2*t);
f2 = exp(-t);
subplot(2,2,1)
plot(t,f1),grid,ylim([0,0.5]),xlim([0,10])
subplot(2,2,2)
plot(t,f2),ylim([0,0.5]),grid
subplot(2,2,[3,4])
plot(t,f1+f2),ylim([0,0.5]),grid
```

+++ {"slideshow": {"slide_type": "slide"}}

(unit5.1.6)=
## Stability of autonomous LCCODEs

The linear constant coefficient ordinary differential equation (LCCODE)

$$a_n\frac{d^n y(t)}{dt^n} + a_{n-1}\frac{d^{n-1} y(t)}{dt^{n-1}}+\cdots+a_0 y(t) = 0$$

is *stable* if all solutions converge to zero, regardless of initial condition.

+++ {"slideshow": {"slide_type": "subslide"}}

Take the Laplace transform

$$
\begin{eqnarray*}
a_n\left(s^n Y(s) - s^{n-1}y(0) - s^{n-2} y'(0)-\cdots-y^{(n-1)}(0)\right)\\
+ a_{n-1}\left(s^{n-1}Y(s) - s^{n-2}y(0) - \cdots - y^{(n-2)}y(0)\right)\\+\cdots+a_0 y(0) = 0
\end{eqnarray*}
$$

+++ {"slideshow": {"slide_type": "fragment"}}

$$Y(s) = \frac{b_{n-1}s^{n-1}+b_{n-2}s^{n-2}+\cdots+b_1 s + b_0}{a_ns^n + a_{n-1}s^{n-1} + \cdots + a_1 s + a_0} =\frac{b(s)}{a(s)}$$

where $b(s)$ depends on the initial conditions.

+++ {"slideshow": {"slide_type": "subslide"}}

The LCCODE is stable only when all poles of $Y(s)$ have *negative real part*, i.e. the roots of $a(s)$ are in the left half plane.

+++ {"slideshow": {"slide_type": "slide"}}

(unit5.1.7)=
## Initial value theorem

A general property of Laplace transforms (not just for rational $F(s)$:

$$\lim_{s\to\infty}sF(s) = f(0^+)$$

(We can take $s$ to be real in the limit).

+++ {"slideshow": {"slide_type": "subslide"}}

This makes a connection between $f(t)$ for small $t$ and $F(s)$ for large $s$.

+++ {"slideshow": {"slide_type": "notes"}}

Reason: for large (real) $s$, $se^{-st}$ is bunched up near $t=0$, so:

$$F(s) = \int_0^\infty se^{-st}f(t)\,dt\approx f(0^+) \int_0^\infty se^{-st}\,dt=f(0^+)$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Examples 5

a) Find the initial value of $f(t) = e^{at}$

b) Find the initial value of the unit step signal $u_0(t)$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Solutions to examples 5

+++ {"slideshow": {"slide_type": "fragment"}}

a) For $f(t) = e^{at}$, $F(s) = 1/(s - a)$ so

$$\lim_{s\to\infty}sF(s) = \lim_{s\to\infty}\frac{s}{s-a} = 1 = f(0^+)$$

+++ {"slideshow": {"slide_type": "fragment"}}

b) For $f(t) = u_0(t)$, $F(s) = 1/s$

$$\lim_{s\to\infty}sF(s) = 1 = f(0^+)$$

+++ {"slideshow": {"slide_type": "slide"}}

(unit5.1.8)=

## Final value theorem

The final value theorem make the connection between $f(t)$ for large $t$ and $F(s)$ for small $s$.

$$\lim_{t\to\infty} f(t) = \left.sF(s)\right|_{s=0}$$

if the limit exists.

+++ {"slideshow": {"slide_type": "notes"}}

Reason: from the relation between Laplace transforms and derivatives,

$$sF(s) - f(0) = \mathcal{L}\left\{\frac{df(t)}{dt} \right\}=\int_0^\infty \frac{df(t)}{dt}e^{-st}\,dt$$

$$s\left.F(s)\right|_{s=0} - f(0) = \int_0^\infty \frac{df(t)}{dt}\,dt=\lim_{t\to\infty} f(t)-f(0)$$

$$s\left.F(s)\right|_{s=0} = \lim_{t\to\infty} f(t)$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Examples 6

a) Find the final value of $f(t) = 1 - e^{-t}$

b) Find the final value of $f(t) = \cos\left(\omega t\right)$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Solutions to examples 6

a) If $f(t) = 1 - e^{-t}$, 

$$F(s) = \frac{1}{s} -\frac{1}{s+1},$$

and

$$\lim_{t\to\infty}f(t) = \left.sF(s)\right|_{s=0} = \frac{s}{s} - \frac{s}{s+1} = 1 - \frac{0}{1} = 1$$

+++ {"slideshow": {"slide_type": "subslide"}}

b) $f(t) = \cos\left(\omega t\right)$ and

$$F(s) = \frac{s}{s^2 + \omega^2}$$

In this case $\lim_{t\to\infty} f(t)$ does not exist; the final value theorem does not apply here.

+++ {"slideshow": {"slide_type": "notes"}}

## Summary

In this unit we have presented some properties of rational polynomials which apply to the Laplace transform of signals and systems represented by transfer functions. In particular, we have developed some tools that help us to reason about the behaviour of a signal or system providing we know the location of its poles and zeros.

We covered the following topics

* {ref}`unit5.1.1`
* {ref}`unit5.1.2`
* {ref}`unit5.1.3`
* {ref}`unit5.1.4`
* {ref}`unit5.1.5`
* {ref}`unit5.1.6`
* {ref}`unit5.1.7`
* {ref}`unit5.1.8`

### Take Aways

#### Transfer function

The summary of the time-domain and s-domain transforms are illustrated in {numref}`fig:3-7`. The key result is $Y(s) = H(s)X(s)$ which simplifies the computation of the system response $y(t) = h(t)*x(t)$ which has to be done using time-convolution.

If we know $Y(s)$ and $X(s)$ we can determine $H(s)$ using

$$H(s) = \frac{Y(s)}{X(s)}$$

and $h(t) = \mathcal{L}^{-1}\left\{H(s)\right\}$

#### Characterization of LTI Systems

For continuous-time LTI systems the causality and stabilty of a system is guaranteed if all the poles of the transfer function are in the left-half of the $s$-plane and the $j\omega$ axis is included in the region of convergence. That is, if the poles of the system $H(s)$, $s_k$ have real part $-\sigma_k$, the system will be causal and stable if $\sigma_k < 0$ for all $k$.

#### Laplace transforms of LCCODEs

The linear constant coefficient ordinary differential equation (LLCODE) of a system involving input signal $x(t)$ and output signal $y(t)$ is given in {eq}`eq:338`. When we take Laplace transforms of this differential equation, ignoring initial conditions, we get the polynomial equation {eq}`eq:339` from which we can determine the transfer function:

$$H(s) = \frac{Y(s)}{X(s)} = \frac{b_M s^M + b_{M-1}s^{M-1}+ \cdots + b_1 s + b_0}{a_{N} s^N + b_{N-1}s^{N-1}+ \cdots + a_1 s + a_0}$$

This is a rational polynomial in $s$ and it can be solved for any input $x(t)$ that has a Laplace transform $X(s)$ by forming

$$Y(s) = H(s)X(s)$$

and taking inverse Laplace transforms using the Partial Fraction Expansion method discussed in {ref}`unit4.5`.

Several examples are given in {ref}`examples12` in which the problems given in {ref}`examples8` of {ref}`unit3.3` are redone as Laplace transform problems. 


#### Block diagrams

Complex systems can be broken down into subsystems which may be represented by block diagrams which have either series or parallel connections (see {numref}`Fig:3-8` and {numref}`Fig:3-9` and feedback (See {ref}`ex:13.8`)


### Still to come

In the next unit {ref}`examples16` we will do some examples to practice what we have learned in this section. We will the conclude this module by considering frequency response analysis of signals and systems defined by rational polynomials in $s$.

We will build on these ideas in **EG-247 Digital Signal Processing** and you will be able to use what you have learned in **EG-243 Control Systems**.

+++ {"slideshow": {"slide_type": "notes"}}

## References

```{bibliography}
:filter: docname in docnames
```
