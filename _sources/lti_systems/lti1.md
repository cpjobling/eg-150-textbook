---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.14.4
kernelspec:
  display_name: Matlab
  language: matlab
  name: matlab
---

+++ {"slideshow": {"slide_type": "slide"}}

(Response_of_a_Continuous_Time_LTI_System_and_the_Convolution_Integral)=
# Unit 3.1: Response of a Continuous-Time LTI System and the Convolution Integral

This section is based on Section 2.1 of {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

Follow along at [cpjobling.github.io/eg-150-textbook/lti_systems/lti1](https://cpjobling.github.io/eg-150-textbook/lti_systems/lti1)

![QR Code for this lecture](pictures/qrcode_lti1.png)

+++ {"slideshow": {"slide_type": "notes"}}

## Subjects to be Covered

* {ref}`impulse_reponse`
* {ref}`abitrary_signal_response`
* {ref}`convolution_integral`
* {ref}`props_of_con_integral`
* {ref}`convolution_operation`
* {ref}`step_response`
* {ref}`examples_5_Responses_of_a_Continuous_Time_LTI_System_and_Convolution`

+++ {"slideshow": {"slide_type": "subslide"}}

(impulse_reponse)=
## A. Impulse Response

The *impulse response* $h(t)$ of a continuous-time LTI system (represented by $\mathbf{T}$) is defined as the response of the system when the input is $\delta(t)$, that is,

$$h(t) = \mathbf{T}\left\{\delta(t)\right\}$$

+++ {"slideshow": {"slide_type": "subslide"}}

(abitrary_signal_response)=
## B. Response to an Arbitrary Input

From the {ref}`sifting_property` 

$$\int_{-\infty}^{\infty}f(t)\delta(t-\alpha)dt=f(\alpha)$$

+++ {"slideshow": {"slide_type": "fragment"}}

an arbitrary continuous-time input can be expressed in terms of the Dirac delta function as

$$x(\tau) = \int_{-\infty}^{\infty}x(\tau)\delta(t-\tau)d\tau = x(t)$$

+++ {"slideshow": {"slide_type": "subslide"}}

Since the system is linear, the response $y(t)$ of the system with arbitrary input $x(t)$ can be expressed as

$$y(t) = \mathbf{T}\left\{x(t)\right\} = \mathbf{T}\left\{\int_{-\infty}^{\infty}x(\tau)\delta(t-\tau)\,d\tau\right\}$$

+++ {"slideshow": {"slide_type": "fragment"}}

$$ = \int_{-\infty}^{\infty}x(t)\mathbf{T}\left\{\delta(t - \tau)\right\}$$

+++ {"slideshow": {"slide_type": "fragment"}}

Since the system is time-invariant, we have

$$h(t-\tau)=\mathbf{T}\left\{\delta(t-\tau)\right\}\,d\tau$$

+++ {"slideshow": {"slide_type": "subslide"}}

Substituting $h(t-\tau)$ into the equation for $y(t)$ gives

$$y(t) = \int_{-\infty}^{\infty}x(t)h(t-\tau)\,d\tau$$

+++ {"slideshow": {"slide_type": "fragment"}}

This equation indicates that a continuous-time LTI system is completely characterised by its impulse response $h(t)$.

+++ {"slideshow": {"slide_type": "subslide"}}

(convolution_integral)=
## C. Convolution Integral

The equation

$$y(t) = \int_{-\infty}^{\infty}x(\tau)h(t-\tau)\,d\tau$$ 

defines the *convolution* of two continuous-time signals $x(\tau)$ and $h(t)$ denoted by

$$y(t) = x(t) * h(t) = \int_{-\infty}^{\infty}x(\tau)h(t-\tau)\,d\tau$$

+++ {"slideshow": {"slide_type": "subslide"}}

The equation 

$$y(t) = x(t) * h(t) = \int_{-\infty}^{\infty}x(\tau)h(t-\tau)\,d\tau$$

is commonly called the *convolution integral*.

+++ {"slideshow": {"slide_type": "fragment"}}

Thus we have the fundamental result that:

+++ {"slideshow": {"slide_type": "fragment"}}

*the output of any continuous-time LTI system is the convolution of the input $x(t)$ with the impulse response $h(t)$ of the system*.

+++ {"slideshow": {"slide_type": "subslide"}}

{numref}`fig:ct_lti_system` illustrates the definition of the impulse response $h(t)$ and the convolution integral.

+++ {"slideshow": {"slide_type": "fragment"}}

:::{figure-md} fig:ct_lti_system
<img src="pictures/ct_lti_system.png" alt="Continuous-time LTI system" width="60%">

Continuous-time LTI system
:::

+++ {"slideshow": {"slide_type": "subslide"}}

(props_of_con_integral)=
## D. Properties of the Convolution Integral

The convolution integral has the following properties.

+++ {"slideshow": {"slide_type": "subslide"}}

### 1. Commutative:

$$x(t) * h(t) = h(t) * x(t)$$

+++ {"slideshow": {"slide_type": "fragment"}}

### 2. Associative:

$$\left\{x(t) * h_1(t)\right\} * h_2(t) = x(t) * \left\{h_1(t) * h_2(t)\right\}$$

+++ {"slideshow": {"slide_type": "fragment"}}

### 3. Distributive:

$$x(t)*\left\{h_1(t) + h_2(t)\right\} = x(t)*h_1(t) + x(t)*h_2(t)$$

+++ {"slideshow": {"slide_type": "subslide"}}

(convolution_operation)=
## E. Convolution Integral Operation

Applying the communitative propery of convolution to the convolution integral, we obtain

$$y(t) = h(t) * x(t) = \int_{-\infty}^{\infty}h(\tau)x(t-\tau)\,d\tau$$

+++ {"slideshow": {"slide_type": "notes"}}

which may at times be easier to evaluate than

$$y(t) = x(t) * h(t) = \int_{-\infty}^{\infty}x(t)h(t-\tau)\,d\tau$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Graphical Evaluation of the Convolution Integral

The convolution integral is most conveniently evaluated by a graphical evaluation. We give three examples (5.4&mdash;5.6) which we will demonstrate in class using a [graphical visualization tool](https://uk.mathworks.com/matlabcentral/fileexchange/25199-graphical-demonstration-of-convolution) developed by Teja Muppirala of the Mathworks and updated by Rory Adams.

The tool: [convolutiondemo.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/convolution_demo/convolutiondemo.m) (see [license.txt](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/convolution_demo/license.txt)).

We will then work through the examples again in the examples class.

```{code-cell}
---
slideshow:
  slide_type: fragment
---
clear all
cd matlab/convolution_demo
pwd
```

```{code-cell}
---
slideshow:
  slide_type: fragment
---
convolutiondemo % ignore warnings
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Summary of Steps

+++ {"slideshow": {"slide_type": "fragment"}}

1. The inpulse response $h(\tau)$ is time reversed (that is, reflected about the origin) to obtain $h(-\tau)$ and then shifted by $t$ to form $h(t-\tau) = h\left[-(\tau - t)\right]$, which is a function of $\tau$ with parameter $t$.

+++ {"slideshow": {"slide_type": "fragment"}}

2. The signal $x(\tau)$ and $h(t-\tau)$ are multiplied together for all values of $\tau$ with $t$ fixed at some value.

+++ {"slideshow": {"slide_type": "fragment"}}

3. The product $x(\tau)h(t-\tau)$ is integrated over all $\tau$ to produce a single output value $y(t)$.

+++ {"slideshow": {"slide_type": "fragment"}}

4. Steps 1 to 3 are repeated as $t$ varies over $-\infty$ to $\infty$ to produce the entire output $y(t)$.

+++ {"slideshow": {"slide_type": "notes"}}

Examples of the above convolution integral operation are given in Examples 5.4 to 5.6.

+++ {"slideshow": {"slide_type": "subslide"}}

### Example

We will do {ref}`ex5_4` in class 

+++ {"slideshow": {"slide_type": "subslide"}}

(step_response)=
## F. Step Response

The *step response* $s(t)$ of a continuous-time LTI system (represented by $\mathbf{T}$) is defined by the response of the system when the input is $u_0(t)$; that is,

$$s(t) = \mathbf{T}\left\{u_0(t)\right\}$$

+++ {"slideshow": {"slide_type": "fragment"}}

In many applications, the step response $s(t)$ is also a useful characterisation of the system. The step response can be easily determined using the convolution integral; that is,

$$s(t) = h(t)*u_0(t) = \int_{-\infty}^{\infty} h(\tau)u_0(t-\tau)\,d\tau = \int_{0}^{t} h(\tau)\,d\tau$$

+++ {"slideshow": {"slide_type": "fragment"}}

Thus the step response $s(t)$ can be obtained by integrating the impulse response $h(t)$.

+++ {"slideshow": {"slide_type": "subslide"}}

### Impulse response from step response

+++ {"slideshow": {"slide_type": "fragment"}}

Differentiating the step response with respect to $t$, we get

$$h(t) = s'(t) = \frac{ds(t)}{dt}$$

+++ {"slideshow": {"slide_type": "fragment"}}

Thus the impulse response $h(t)$ can be determined by differentiating the step response $s(t)$.

+++ {"slideshow": {"slide_type": "slide"}}

(examples_5_Responses_of_a_Continuous_Time_LTI_System_and_Convolution)=
## Examples 5: Responses of a Continuous-Time LTI System and Convolution

+++ {"slideshow": {"slide_type": "subslide"}}

(ex5_1)=
### Example 5.1 

Verify the following properties of the convolution integral; that is,

(a) $x(t)*h(t) = h(t)*x(t)$

(b) $\left\{x(t) * h_1(t)\right\} * h_2(t) = x(t)*\left\{h_1(t) * h_2(t)\right\}$

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 2.1 in in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex5_2)=
### Example 5.2

Show that

(a) $x(t) * \delta(t) = x(t)$

(b) $x(t) * \delta(t-t_0) = x(t - t_0)$

(c) $x(t)*u_0(t) = \int_{-\infty}^{t}x(\tau)\,d\tau$

(d) $x(t) * u_0(t - t_0) = \int_{-\infty}^{t_0}x(\tau)\,d\tau$

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 2.2 in in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex5_3)=
### Example 5.3

Let $y(t) = x(t) * h(t)$. Then show that

$$x(t-t_1)*h(t-t_2) = y(t - t_1 - t_2)$$

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 2.3 in in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex5_4)=
### Example 5.4

The input $x(t)$ and the impulse response $h(t)$ of a continuous-time LTI system are given by

$$x(t) = u_0(t)$$

$$h(t) = e^{-\alpha t}u_0(t),\;\alpha > 0$$

(a) Compute the output $y(t)$ by using the convolution integral

$$y(t) = x(t) * h(t) = \int_{-\infty}^{\infty}x(t)h(t-\tau)\,d\tau$$

(b) Compute the output $y(t)$ by using the convolution integral

$$y(t) = h(t) * x(t) = \int_{-\infty}^{\infty}h(\tau)x(t-\tau)\,d\tau$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Solutions

##### (a) Graphical 

Using the *convolutiondemo* tool chose a value for $\alpha$. I will use $\alpha = 1$.

+++ {"slideshow": {"slide_type": "fragment"}}

Then set `f(t)`, which represents $x(t)$, to `heaviside(t)` and `g(t)`. which represents $h(t)$ to `exp(-1*t)`

+++ {"slideshow": {"slide_type": "subslide"}}

##### Manual solution

For the manual solution, refer to the lecture recording or see solved problem 2.3 in in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

##### MATLAB Solution

We can also use the Symbolic Math Toolbox to solve the problem directly:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
syms t tau alpha
assume(alpha > 0)

x(t) = heaviside(t); % unit step function
subplot(211)
fplot(x(t)),title('x(t)'),ylim([0,1.25])
h(t) = exp(-alpha*t)*heaviside(t);
subplot(212)
fplot(subs(h(t),alpha,1)),title('h(t)')
```

+++ {"slideshow": {"slide_type": "subslide"}}

Compute $y(t)$ using the MATLAB function `int` to compute the convolution integral symbolically.

```{code-cell}
---
slideshow:
  slide_type: fragment
---
y(t) = int(x(tau)*h(t - tau),tau,-Inf,Inf)
```

Plot the result for $\alpha = 1$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
ya(t) = subs(y(t),alpha,1)
fplot(ya(t))
```

+++ {"slideshow": {"slide_type": "subslide"}}

##### (b) Graphical 

Reverse the settings for `f(t)`and `g(t)` in the *convolutiondemo* tool.

+++ {"slideshow": {"slide_type": "subslide"}}

##### Manual solution

For the manual solution, refer to the lecture recording or see solved problem 2.3 in in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

##### MATLAB Solution

Reverse the arguments to the `fplot` and `int` functions.

```{code-cell}
---
slideshow:
  slide_type: fragment
---
subplot(211)
fplot(subs(h(t),alpha,1)),title('h(t)'),ylim([0,1.25])
subplot(212)
fplot(x(t)),title('x(t)'),ylim([0,1.25])
```

```{code-cell}
---
slideshow:
  slide_type: fragment
---
y(t) = int(h(tau)*x(t - tau),tau,-Inf,Inf)
```

+++ {"slideshow": {"slide_type": "subslide"}}

Plot the result for $\alpha = 1$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
yb(t) = subs(y(t),alpha,1)
fplot(yb(t))
```

+++ {"slideshow": {"slide_type": "subslide"}}

Go back to {ref}`step_response`

+++ {"slideshow": {"slide_type": "subslide"}}

(ex5_5)=
### Example 5.5

Compute the output $y(t)$ for a continuous-time LTI system whose impulse response $h(t)$ and the input $x(t)$ are given by

$$h(t) = e^{-\alpha t}u_0(t)$$

$$x(t) = e^{\alpha t}u_0(-t)$$

$$\alpha > 0.$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Solutions

##### Manual solution

For the manual solution, refer to the lecture recording or see solved problem 2.3 in in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

##### MATLAB Solution

We can also use the Symbolic Math Toolbox to solve the problem directly:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
x(t) = exp(t)*heaviside(-t);
subplot(211)
fplot(x(t)),,title('x(t)')
h(t) = exp(-1*t)*heaviside(t);
subplot(212)
fplot(h(t)),title('h(t)')
```

+++ {"slideshow": {"slide_type": "subslide"}}

Compute $y(t)$ using the convolution integral

```{code-cell}
---
slideshow:
  slide_type: fragment
---
y(t) = int(x(tau)*h(t - tau),tau,-Inf,Inf)
```

+++ {"slideshow": {"slide_type": "fragment"}}

Plot the result for $\alpha = 1$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
fplot(y(t)),title('y(t) = x(t) * y(t)')
```

+++ {"slideshow": {"slide_type": "subslide"}}

(ex5_6)=
### Example 5.6

Evaluate $y(t) = x(t) * h(t)$, where $x(t)$ and $h(t)$ are shown in {numref}`fig:ex:5.6`, by an alalytical technique, and (b) by a graphical method.

:::{figure-md} fig:ex:5.6
<img src="pictures/ex5_6.png" alt="Signal and system for example 5.6" width="60%">

Signal and system for example 5.6
:::

+++ {"slideshow": {"slide_type": "subslide"}}

#### Solutions

##### (a) Analytical 

We first express $x(t)$ and $h(t)$ in functional form using the unit step (or *Heaviside* function)

$$x(t) = u_0(t) - u_0(t-3)$$

$$h(t) = u_0(t) - u_0(t-2)$$

+++ {"slideshow": {"slide_type": "fragment"}}

We will use the MATLAB Symbolic Math Toolbox:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
x(t) = heaviside(t)-heaviside(t-3);
h(t) = heaviside(t)-heaviside(t-2);
subplot(121)
fplot(x(t),[-3,6]),grid,ylim([0,3]),ylabel('x(t)'),xlabel('t')
subplot(122)
fplot(h(t),[-3,6]),grid,ylim([0,3]),ylabel('h(t)'),xlabel('t')
```

+++ {"slideshow": {"slide_type": "subslide"}}

Compute $y(t)$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
y(t) = int(x(tau)*h(t - tau),tau,-Inf,Inf)
```

Plot the result

```{code-cell}
---
slideshow:
  slide_type: fragment
---
fplot(y(t),[-3,6]),grid,ylim([0,2.5]),ylabel('h(t)'),xlabel('t')
```

+++ {"slideshow": {"slide_type": "subslide"}}

##### (b) Graphical 

Since both functions are unity between the limits set by the Heaviside function, graphical solution requires multiple applications of the definate integral

$$\int_{t_0}^{t_1}1\times 1\,d\tau = \int_{t_0}^{t_1}1\,d\tau$$

with different values for the limits $t_0$ and $t_1$. The *convolutiondemo* tool can help us discover the limits for the piecewise continuous signal $y(t)$.

+++ {"slideshow": {"slide_type": "notes"}}

For the complete solution to Example 5.2 refer to the lecture recording or see solved problem 2.6 in in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "slide"}}

## Summary

In this lecture we have looked at

* {ref}`impulse_reponse`
* {ref}`abitrary_signal_response`
* {ref}`convolution_integral`
* {ref}`props_of_con_integral`
* {ref}`convolution_operation`
* {ref}`step_response`

### Unit 3.1: Take Aways

* *Impulse response*: $h(t) = \mathbf{T}\left\{\delta(t)\right\}$
* *Arbitrary system response*: $y(t) = \int_{-\infty}^{\infty} x(t)h(t-\tau)\,d\tau$
* *Convolution itegral*: $y(t) = x(t)*h(t) = \int_{-\infty}^{\infty} x(t)h(t-\tau)\,d\tau = \int_{-\infty}^{\infty} x(t=\tau)h(t)\,d\tau$
* *Properties of the convolution integral:
  * *Communitative*: $x(t) * h(t) = h(t) * x(t)$
  * *Associative*: $\left\{x(t) * h_1(t) \right\} * h_2(t) = x(t)*\left\{h_1(t) * h_2(t) \right\}$
  * *Distributive*: $x(t)*\left\{h_1(t) + h_2(t)\right\} = x(t)*h_1(t) + x(t) * h_2(t)$
* The convolution integral can be computed graphically or analytically.

+++ {"slideshow": {"slide_type": "slide"}}

## Next Time

We continue our introduction to continuous-time LTI system by considering

* {ref}`Properties_of_Continuous_Time_LTI_Systems`
* {ref}`eigenfunctions_of_continuous_time_LTI_systems`

## References

```{bibliography}
:filter: docname in docnames
```
