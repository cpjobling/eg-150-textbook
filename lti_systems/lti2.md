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

(lti_systems2)=
# Unit 3.2: Properties and Eigenfunctions of Continuous-Time LTI Systems

This section is based on Sections 2.3 and 2.4 of {cite}`schaum`

+++ {"slideshow": {"slide_type": "notes"}}

Follow along at [cpjobling.github.io/eg-150-textbook/lti_systems/lti2](https://cpjobling.github.io/eg-150-textbook/lti_systems/lti2)

![QR Code for this lecture](pictures/qrcode_lti2.png)

+++ {"slideshow": {"slide_type": "notes"}}

## Subjects to be covered

We continue our introduction to continuous-time LTI systems by considering:

* {ref}`Properties_of_Continuous_Time_LTI_Systems`
* {ref}`eigenfunctions_of_continuous_time_LTI_systems`
* {ref}`examples_6`
* {ref}`examples_7`

+++ {"slideshow": {"slide_type": "slide"}}

(Properties_of_Continuous_Time_LTI_Systems)=
## Properties of Continuous-Time LTI Systems

* {ref}`a_systems_with_and_without_memory`
* {ref}`b_causality`
* {ref}`c_Stability`

+++ {"slideshow": {"slide_type": "subslide"}}

(a_systems_with_and_without_memory)=
### A. Systems with or without memory

+++ {"slideshow": {"slide_type": "fragment"}}

Since the output $y(t)$ of a memoryless system depends only on the current input $x(t)$, then, if the system is also linear and time-invariant, this relationship can only be of the form

$$y(t) = Kx(t)$$

where $K$ is a (gain) constant.

+++ {"slideshow": {"slide_type": "subslide"}}

Thus the corresponding impulse response $h(t)$ is simply

$$h(t) = K\delta(t)$$

+++ {"slideshow": {"slide_type": "fragment"}}

Therefore, if $h(t_0) \neq 0$ for $t_0 \neq 0$, then the continuous-time LTI system has memory.

+++ {"slideshow": {"slide_type": "slide"}}

(b_causality)=
### B. Causality

+++ {"slideshow": {"slide_type": "subslide"}}

(causal_systems)=
#### Causal continuous-time LTI systems

As discussed in Section {ref}`causal_and_non-causal_systems`, a causal system does not respond to an input event until that event actually occurs.

+++ {"slideshow": {"slide_type": "fragment"}}

Therefore, for a causal LTI system, we have

$$h(t) = 0\quad t \lt 0$$

+++ {"slideshow": {"slide_type": "subslide"}}

Applying the causality condition to the convolution integral, the output of a causal continuous-time LTI system is expressed as

$$y(t) = \int_0^{\infty}h(\tau)x(t-\tau)\,d\tau$$

+++ {"slideshow": {"slide_type": "subslide"}}

Alternatively, applying the causality to the convolution integral (defined in Section {ref}`convolution_integral`)

$$y(t) = \int_{-\infty}^{\infty}x(\tau)h(t-\tau)\,d\tau$$

we have

$$y(t) = \int_{-\infty}^{t}x(\tau)h(t-\tau)\,d\tau$$

+++ {"slideshow": {"slide_type": "fragment"}}

This equation shows that the only values of the input $x(t)$ used to evaluate the output $y(t)$ are those for $\tau \le   t$.

+++ {"slideshow": {"slide_type": "subslide"}}

(causal_signals)=
#### Causal signals

Based on the causality condition, any signal is called *causal* if

$$x(t)=0\quad t \lt 0$$

and is called *anticausal* if

$$x(t)=0\quad t \gt 0$$

+++ {"slideshow": {"slide_type": "subslide"}}

Combining the definition of a *causal signal* with a *causal system*, when the input $x(t)$ is causal, the output of a causal continuous-time LTI system is given by

$$y(t) = \int_{0}^{t}h(\tau)x(t-\tau)\,d\tau =  \int_{0}^{t}x(\tau)h(t-\tau)\,d\tau$$

+++ {"slideshow": {"slide_type": "slide"}}

(c_Stability)=
### C. Stability

The BIBO (bounded-input/bounded-output) stability of an LTI system (Section {ref}`stable_systems`) is readily ascertained by the impuse response. It can be shown ({ref}`ex6_5`) that a continuous-time LTI system is BIBO stable if its  impulse response is absolutely integrable; that is,

$$\int_{-\infty}^{\infty}\left|h(\tau)\right|\,d\tau \lt \infty$$ (eq:221)

+++ {"slideshow": {"slide_type": "slide"}}

(eigenfunctions_of_continuous_time_LTI_systems)=
## Eigenfunctions of Continuous-Time LTI Systems

In [Unit 2.4: Systems and Classification of Systems
](https://cpjobling.github.io/eg-150-textbook/signals_and_systems/systems/index.html#ex4-7) (Example {ref}`ex4_7`) we saw that the eigenfunctions of continuous-time LTI system represented by the complex exponentials $e^{st}$, with $s$ a complex variable.

+++ {"slideshow": {"slide_type": "fragment"}}

That is

$$\mathbf{T}\left\{e^{st}\right\}=\lambda e^{st}$$

where $\lambda$ is the eigenvalue of $\mathbf{T}$ associated with $e^{st}$.

+++ {"slideshow": {"slide_type": "subslide"}}

Setting $x(t)=e^{st}$ in the convolution integral, we have

$$y(t) = \mathbf{T}\left\{e^{st}\right\}$$

+++ {"slideshow": {"slide_type": "fragment"}}

$$y(t) = \int_{-\infty}^{\infty}h(\tau)e^{s(t-\tau)}\,d\tau$$

+++ {"slideshow": {"slide_type": "fragment"}}

$$y(t) = \left[\int_{-\infty}^{\infty}h(\tau)e^{-s\tau}\,d\tau\right]e^{st}$$

+++ {"slideshow": {"slide_type": "fragment"}}

$$y(t) = H(s)e^{st} = \lambda e^{st}$$

+++ {"slideshow": {"slide_type": "subslide"}}

where 

$$\lambda = H(s) = \int_{-\infty}^{\infty}h(\tau)e^{-s\tau}\,d\tau$$

+++ {"slideshow": {"slide_type": "subslide"}}

Thus, the *eigenvalue* of a continuous-time LTI system associated with the *eigenfunction* $e^{st}$ is given by $H(s)$ which is a complex constant whose value is determined by the value of $s$ via the equation

$$H(s) = \int_{-\infty}^{\infty}h(\tau)e^{-s\tau}\,d\tau.$$

+++ {"slideshow": {"slide_type": "notes"}}

Note from the equation

$$y(t) = H(s)e^{st}$$

that $y(0) = H(s)$.

+++ {"slideshow": {"slide_type": "subslide"}}

### Looking Ahead
The above results underline the definition of the Laplace transform and Fourier transform. The {ref}`laplace` will be discussed later in this course. The Fourier Transform will be introduced in **EG-247 Digital Signal Processing** next year.

+++ {"slideshow": {"slide_type": "slide"}}

(examples_6)=
## Exercises 6: Properties of Continuous-Time LTI Systems

+++ {"slideshow": {"slide_type": "subslide"}}

(ex6_1)=
### Exercise 6.1 

The signals in {numref}`fig:ex6.1`(a) and (b) are the input $x(t)$ and the output $y(t)$, respectively, of a certain continuous-time LTI system. 

:::{figure-md} fig:ex6.1
<img src="pictures/ex6_1.png" alt="Input and output signals for a continuous-time LTI system" width="60%">

Input and output signals for a continuous-time LTI system
:::

+++ {"slideshow": {"slide_type": "subslide"}}

Sketch the output to the following inputs:

(a)$x(t-2)$;

(b) $\frac{1}{2}x(t)$.

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 2.9 in in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex6_2)=
### Exercise 6.2 

Consider a continuous-time LTI system whose step response is given by

$$y(t) = e^{-t}u_0(t)$$


Determine and sketch the output of the system to the input $x(t)$ shown in {numref}`fig:ex6.2`.

+++ {"slideshow": {"slide_type": "subslide"}}

:::{figure-md} fig:ex6.2
<img src="pictures/ex6_2.png" alt="Signal for Exercise 6.2" width="40%">

Signal for Exercise 6.2
:::

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 2.2 in in {cite}schaum.

```{code-cell}
---
slideshow:
  slide_type: subslide
---
syms t y(t) 
u_0(t) = heaviside(t);
y(t) = exp(-(t-1))*u_0(t-1) - exp(-(t-3))*u_0(t-3);
fplot(y(t),[0, 6]),ylim([-1,1.25]),grid,xlabel('t'),ylabel('y(t)')
```

+++ {"slideshow": {"slide_type": "subslide"}}

(ex6_3)=
### Exercise 6.3

```{note}
Interesting result but not examined further.
```

Consider a continuous-time LTI system system described by

$$y(t) = \mathbf{T}\left\{x(t)\right\} = \frac{1}{T}\int_{t-\frac{T}{2}}^{t+\frac{T}{2}}x(\tau)\,d\tau$$

(a) Find and sketch the impulse response $h(t)$ of the system.

(b) Is this system causal?

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, see the solved problem 2.11 in in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex6_4)=
### Exercise 6.4

```{note}
Interesting result but not examined further.
```


Let $y(t)$ be the output of a continuous-time LTI system with input $x(t)$. Find the output of the system if ths input is $x'(t)$, where $x'(t)$ is the first derivative of $x(t)$.

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the solved problem 2.12 in in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex6_5)=
### Exercise 6.5

```{note}
Interesting result but not examined further.
```

Verify the BIBO stability condition ({ref}`c_Stability`) for continuous-time LTI systems.

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, see the solved problem 2.13 in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex6_6)=
### Exercise 6.6

The system shown in {numref}`fig:ex6.6`(a) is formed by connecting two systems in *cascade*. The impulse responses of the two systems are $h_1(t)$ and $h_2(t)$, respectively, and

$$h_1(t) = e^{-2t}u_0(t)\quad h_2(t)=2e^{-t}u_0(t)$$

(a) Find the impulse response $h(t)$ of the overall system shown in {numref}`fig:ex6.2`(b).

(b) Determine if the overall system is BIBO stable.

+++ {"slideshow": {"slide_type": "subslide"}}

:::{figure-md} fig:ex6.6
<img src="pictures/ex6_6.png" alt="A cascade connection of two continuous-time LTI systems" width="50%">

A cascade connection of two continuous-time LTI systems
:::

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 2.14 in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "slide"}}

(examples_7)=
## Exercises 7: Eigenfunctions of Continuous-Time LTI systems

+++ {"slideshow": {"slide_type": "subslide"}}

(ex7_1)=
### Exercise 7.1

```{note}
This is a foretaste of the Laplace Transform.
```

Consider a continuous-time LTI system with the input-output relation given by

$$y(t)=\int_{-\infty}^{t}e^{-(t-\tau)}x(\tau)\,d\tau$$

(a) Find the impulse response $h(t)$ of this system.

(b) Show that the complex exponential $e^{st}$ is an eigenfunction of the system.

(c) Find the eigenvalue of the system corresponding to $e^{st}$ using the impulse response $h(t)$ obtained in part (a).

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 2.15 in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex7_2)=
### Exercise 7.2

```{note}
Interesting result which will not be examined.
```

Consider the continuous-time LTI system described by

$$y(t) = \frac{1}{T}\int_{t-\frac{T}{2}}^{t+\frac{T}{2}}x(\tau)\,d\tau$$

(a) Find the eigenvalue of the system corresponding to the eigenfunction $e^{st}$.

(b) Repeat part (a) by using the impulse response $h(t)$ of the system.

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, see the solved problem 2.16 in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex7_3)=
### Exercise 7.3

```{note}
Interesting result that is a foretaste of the Fourier transform which will not be examined.
```


Consider a stable continuous-time LTI system with impulse response $h(t)$ that is real and even. Show that $\cos \omega t$ and $\sin \omega t$ are eigenfunctions of this system with the same eigenvalue.

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, see the solved problem 2.17 in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "notes"}}

## Summary

We have continued our introdiuction the continuous-time LTI systems by considering

* {ref}`Properties_of_Continuous_Time_LTI_Systems`
* {ref}`eigenfunctions_of_continuous_time_LTI_systems`

(unit3.2:takeaways)=
### Unit 3.2: Take aways

#### Properties of continuous-time LTI systems

The input to an LTI system is $x(t)$, the impulse response of the LTI system is $h(t)$ and the output is $y(t)$.

The output of any LTI system is computed from the convolution of $h(t)$ with $x(t)$:

$$y(t) = \int_{-\infty}^{\infty} x(\tau)h(t-\tau)\,d\tau = \int_{-\infty}^{\infty} h(\tau)x(t-\tau)\,d\tau$$

The only LTI system that has no memory is the simple gain $y(t) = Kx(t)$ for which the impulse response $h(t) = K\delta(t)$.

Causal LTI systems have an impulse response $h(t)$ that satisfies $h(t) = 0$ $t < 0$. Therefore, for a causal LTI system the output is given by the convolution integral with adjsuted limits:

$$y(t) = \int_{-\infty}^t x(\tau)h(t-\tau)\,d\tau$$

An LTI system is BIBO stable if it's impulse response is integrable. That is:

$$\int_{-\infty}^{\infty}\left|h(\tau)\right|\,d\tau \lt \infty$$

Linear systems in series can be combined by convolution.

#### Eignenfunctions of continuous-time LTI systems

The exponential signal $x(t) = e^{st}$ (where $s$ is a complex variable, $s = \sigma + j\omega$) is an *eigenfunction* of a continuous-time LTI system with impulse response $h(t)$. The eigenvalue of the system is

$$H(s) = \int_{-\infty}^{\infty} h(\tau)e^{-s\tau}\,d\tau.$$

From the equation $y(t) = H(s)e^{st}$, $H(s) = y(0)$.

As we will see in {ref}`unit4.1`, $H(s)$ is called the *Laplace transform* of $h(t)$. It is also known as the *transfer function* of the continuous-time LTI system that has impulse response $h(t)$.

By a similar argument, we can show that if $s = j\omega$, then $e^{j\omega}$ is also an eigenfunction of $h(t)$, and the frequency response of an LTI system is

$$H(j\omega) = \int_{-\infty}^{\infty} h(\tau)e^{-j\omega\tau}\,d\tau.$$

This is called the *Fourier transform* and we will return to it in **EG-247 Digital Signal Processing**.

+++ {"slideshow": {"slide_type": "slide"}}

## Next Time

We will conclude our look at continuous-time LTI systems by considering

* {ref}`Systems_Described_by_Differential_Equations`

## References

```{bibliography}
:filter: docname in docnames
```
