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

# Transfer Functions

+++ {"slideshow": {"slide_type": "notes"}}

The preparatory reading for this section is [Chapter 4.4](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=3384197&ppg=75#ppg=113) {cite}`karris` which discusses transfer function models of electrical circuits. We have also adapted content from [3.6 The System Function](https://www.accessengineeringlibrary.com/content/book/9781260454246/toc-chapter/chapter3/section/section28) from {cite}`schaum`.

+++

Follow along at [cpjobling.github.io/eg-150-textbook/laplace_transform/6/transfer_functions](https://cpjobling.github.io/eg-150-textbook/laplace_transform/6/transfer_functions)

![QR Code for this lecture](pictures/qrcode_laplace6.png)

+++ {"slideshow": {"slide_type": "notes"}}

## Agenda

* {ref}`system_function`

* {ref}`char_LTI_systems`

* {ref}`tf_for_LCCODE`

* {ref}`block_diagrams`

* {ref}`examples13`

+++ {"slideshow": {"slide_type": "slide"}}

(system_function)=
## The Transfer Function

In {ref}`Response_of_a_Continuous_Time_LTI_System_and_the_Convolution_Integral` we showed that the output $y(t)$ of a continuous-time LTI system equals the convolution of the input $x(t)$ with the impulse response $h(t)$; that is,

$$y(t) = x(t) * h(t)$$ (eq:335)

+++ {"slideshow": {"slide_type": "subslide"}}

Applying the {ref}`lap3:conv` property, we obtain

$$Y(s) = X(s)H(s)$$ (eq:336)

where $Y(s)$, $X(s)$, and $H(s)$ are the Laplace transforms of $y(t)$, $x(t)$, and $h(t)$, respectively.

+++ {"slideshow": {"slide_type": "fragment"}}

Equation {eq}`eq:336` can be expressed as

$$H(s) = \frac{Y(s)}{X(s)}$$ (eq:337)

+++ {"slideshow": {"slide_type": "subslide"}}

The laplace transform $H(s)$ of $h(t)$ is called the *transfer function* (or *system function*) of the system.

+++ {"slideshow": {"slide_type": "fragment"}}

By {eq}`eq:337`, the transfer function $H(s)$ can also be defined as the ratio of the Laplace transforms of the output $y(t)$ and the input $x(t)$.

+++ {"slideshow": {"slide_type": "fragment"}}

The transfer function $H(s)$ completely characterizes the system because the impulse response $h(t)$ completely characterizes the system.

+++ {"slideshow": {"slide_type": "subslide"}}

{numref}`fig:3-7` illustrates the relationship of Equations {ex}`eq:335` and {ex}`eq:336`.

:::{figure-md} fig:3-7
<img src="pictures/system_function.png" alt="Impulse response and system function." width="60%">

Impulse response and system function
:::

+++ {"slideshow": {"slide_type": "notes"}}

(char_LTI_systems)=
## Characterization of LTI Systems

```{note}
This section is for reference only and is not examinable.
```

Many properties of continuous-time LTI systems can be closely associated with the characteristics of $H(s)$ in the $s$-plane and in particular with the pole locations and the region of convergence (ROC).

(hs_casuality)=
### Causality

Fot a causal continuous-time LTI system, we have

$$h(t) = 0\qquad t<0$$

Since $h(t)$ is a right-sided signal, the corresponding requirement on $H(s)$ is that the ROC of $H(s)$ must be of the form

$$\mathrm{Re}(s) > \sigma_\mathrm{max}$$

That is, the ROC is the region in the $s$-plane to the right of all the system poles. Similarly, if the system is anticausal, then

$$h(t) = 0\qquad t>0$$

and $h(t)$ is left-sided. Thus, the ROC of $H(s)$ must be of the form 

$$\mathrm{Re}(s) < \sigma_\mathrm{max}$$

That is, the ROC is the region in the $s$-plane to the left of all the system poles.

(hs_stability)=
### Stability

In {ref}`c_Stability` we stated that a continuous-time LTI system is BIBO stable if and only if [Eq. {eq}`eq:221`]

$$\int_{-\infty}^{\infty}\left|h(\tau)\right|\,d\tau \lt \infty$$

The corresponding requirement on $H(s)$ is that the ROC of $H(s)$ contains the $j\omega$ axis (that is $s = j\omega). This is key result, proved in Prob. 3.26 in {ref}`schaum`, that is fundamental to systems and control theory. 

(hs_causal_and_stable)=
### Causal and stable systems
If a system is both causal and stable then all the poles must be in the left-half of the $s$-plane: that is they all have negative real parts because the ROC is of the form $\mathrm{Re}(s) > \sigma_\mathrm{max}$ and since the $j\omega$ axis is included in the ROC, we must have $\sigma_\mathrm{max} < 0$.

The conditions for which the closed-loop poles in continuous-time LTI systems with feedback are stable is a key underlyting principle of the control theory to be studied in **EG-243 Control Systems** next year.

+++ {"slideshow": {"slide_type": "slide"}}

(tf_for_LCCODE)=

## Transfer functions for LTI system described by Linear Constant-Coefficient Ordinary Differential Equations

In {ref}`Systems_Described_by_Differential_Equations` we considered a continuous-time LTI systemfor which input $x(t)$ and $y(t)$ satisfy the general linear constant-coefficient ordinary differential equation (LCCODE) of the form

$$\sum_{k=0}^N a_k \frac{d^k}{dt^k} y(t)=\sum_{k=0}^M b_k \frac{d^k}{dt^k} x(t)$$ (eq:338)

+++ {"slideshow": {"slide_type": "subslide"}}

Applying the Laplace transform and using the {ref}`lap:diff_prop` of the Laplace transform, we obtain

$$\sum_{k=0}^N a_k s^k Y(s)=\sum_{k=0}^M b_k s^k X(s)$$

+++ {"slideshow": {"slide_type": "fragment"}}

or

$$Y(s) \sum_{k=0}^N a_k s^k = X(s) \sum_{k=0}^M b_k s^k $$ (eq:339)

+++ {"slideshow": {"slide_type": "subslide"}}

Thus,

$$H(s) = \frac{Y(s)}{X(s)} = \frac{\displaystyle \sum_{k=0}^M b_k s^k}{\displaystyle\sum_{k=0}^N a_k s^k}$$ (eq:340)

+++ {"slideshow": {"slide_type": "subslide"}}

Expanding {eq}`eq:340`, $H(s)$ can be written in the more familiar form

$$H(s) = \frac{Y(s)}{X(s)} = \frac{b_M s^M + b_{M-1}s^{M-1}+ \cdots + b_1 s + b_0}{a_{N} s^N + b_{N-1}s^{N-1}+ \cdots + a_1 s + a_0}$$ (eq:341)

+++ {"slideshow": {"slide_type": "fragment"}}

Hence, $H(s)$ is always a rational polynomial in $s$.

+++ {"slideshow": {"slide_type": "notes"}}

Note the ROC of $H(s)$ is not specified by {eq}`eq:340` but must be inferred with additional requirements on the system such as causality and stability.

+++ {"slideshow": {"slide_type": "slide"}}

(block_diagrams)=
## Block diagrams for Systems Interconnection

For two LTI systems (with $h_1(t)$ and $h_2(t)$, respectively) in cascade ({numref}`Fig:3-8`(a)), the overall impulse response is given

$$h(t) = h_1(t) * h_2(t)$$

+++ {"slideshow": {"slide_type": "fragment"}}

Thus, the corresponding transfer functions are related by the product

$$H(s) = H_1(s)H_2(s)$$ (eq:341)

This relationship is illustrated in {numref}`Fig:3-8`(b)

+++ {"slideshow": {"slide_type": "subslide"}}

:::{figure-md} Fig:3-8
<img src="pictures/bd1.png" alt="Two systems in cascade (a) Time-domain representation; (b) s-domain presentation." width="70%">

Two systems in cascade (a) Time-domain representation; (b) s-domain representation.
:::

+++ {"slideshow": {"slide_type": "slide"}}

(examples13)=
## Examples 13: Transfer functions

+++

## Homework

Attempt at least one of the end-of-chapter exercises from each question 1-7 of [Section 2.7](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=3384197&ppg=75#ppg=71) of {cite}`karris`. Don't look at the answers until you have attempted the problems.

If we have time, I will work through one or two of these in class.

+++

## Summary

In this section we have presented some of the most useful and commonly used properties of the Laplace transform, provided a table of Laplace Transform properties, and given examples of how properties and transform tables can be used to determine the Laplace transform of some useful aperiodic and periodic signals. 

### Take Aways


### Still to come

The use of the *derivative property* in the complete solution of continuous-time LTI systems will be covered in {ref}`unit4.6`!

+++

## Next time

We move on to consider 

* {ref}`unit4.7`

## References

```{bibliography}
:filter: docname in docnames
```
