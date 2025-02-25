---
jupytext:
  formats: md:myst,ipynb
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.16.6
kernelspec:
  display_name: MKernel
  language: matlab
  name: mkernel
---

+++ {"nbpresent": {"id": "90f3c07d-3646-44b0-a549-7020fc10d16f"}, "slideshow": {"slide_type": "slide"}}

(unit4.2)=
# Unit 4.2: Laplace Transform of Some Common Signals

The preparatory reading for this section is Chapter 2.2 of {cite}`karris` and Chapter 3.4 of {cite}`schaum`.

+++ {"nbpresent": {"id": "90f3c07d-3646-44b0-a549-7020fc10d16f"}, "slideshow": {"slide_type": "notes"}}

Follow along at [cpjobling.github.io/eg-150-textbook/laplace_transform/2/laplace_of_common_signals](https://cpjobling.github.io/eg-150-textbook/laplace_transform/2/laplace_of_common_signals)

![QR Code for this lecture](pictures/qrcode_laplace_2.png)

+++ {"nbpresent": {"id": "f651cafb-8c2b-4d27-aec9-3491dbcce1aa"}, "slideshow": {"slide_type": "notes"}}

In this unit, we will continue our introduction to the Laplace transform by presenting the transforms of the most commonly encountered common signals. In the cases {ref}`lap2:impulse`&mdash;{ref}`lap2:exp`, we will determine the transforms from the Laplace transform itself (see the OneNote Class Notebook and recording of the active session for these). For the remaining, we will present tables of transforms. We conclude by demonstrating that the Symbolic Math Toolbox "knows" these transforms.

## Agenda


* {ref}`lap2:impulse`

* {ref}`lap2:delayed_impulse`

* {ref}`lap2:unit_step`

* {ref}`lap2:exp`

* {ref}`lap:xform_table`

* {ref}`lap2:matlab`

+++ {"nbpresent": {"id": "b8f02dd9-8876-4679-89fd-038772c205b9"}, "slideshow": {"slide_type": "slide"}}

(lap2:impulse)=
## A. Unit impulse function $\delta(t)$

+++ {"slideshow": {"slide_type": "fragment"}}

$$\mathcal{L}\left\{\delta(t)\right\}=\int_{-\infty}^{\infty}\delta(t)e^{-st}\,dt$$

+++ {"slideshow": {"slide_type": "fragment"}}

Using the *sampling* and *sifting* property of the Dirac delta function

+++ {"slideshow": {"slide_type": "fragment"}}

$$\mathcal{L}\left\{\delta(t)\right\}=\int_{-\infty}^{\infty}e^{-st}\delta(t)\,dt = \int_{-\infty}^{\infty} e^{-s(0)}\delta(t)\,dt= \int_{-\infty}^{\infty}\delta(t)\,dt = 1\quad \mathrm{all}\ s$$

+++ {"slideshow": {"slide_type": "subslide"}}

Thus the Laplace transform pair is

$$\delta(t) \Leftrightarrow 1$$

for all $s$.

+++ {"nbpresent": {"id": "b8f02dd9-8876-4679-89fd-038772c205b9"}, "slideshow": {"slide_type": "slide"}}

(lap2:delayed_impulse)=
## B. Delayed impulse function $\delta(t-a)$

+++ {"nbpresent": {"id": "b8f02dd9-8876-4679-89fd-038772c205b9"}, "slideshow": {"slide_type": "fragment"}}

$$\mathcal{L}\left\{\delta(t-a)\right\}=\int_{-\infty}^{\infty}\delta(t-a)e^{-st}\,dt$$

+++ {"nbpresent": {"id": "b8f02dd9-8876-4679-89fd-038772c205b9"}, "slideshow": {"slide_type": "fragment"}}

Using the sifting property of the Dirac delta function again

$$\mathcal{L}\left\{\delta(t)\right\}=\int_{-\infty}^{\infty}\delta(t-a)e^{-st}\,dt = e^{-as}\quad \sigma > 0$$

+++ {"nbpresent": {"id": "b8f02dd9-8876-4679-89fd-038772c205b9"}, "slideshow": {"slide_type": "subslide"}}

Thus the Laplace transform pair is

$$\delta(t-a) \Leftrightarrow e^{-as}$$

for $\mathrm{Re}(s) > 0$.

+++ {"nbpresent": {"id": "b8f02dd9-8876-4679-89fd-038772c205b9"}, "slideshow": {"slide_type": "slide"}}

(lap2:unit_step)=
## C. Unit step function $u_0(t)$

+++ {"nbpresent": {"id": "b8f02dd9-8876-4679-89fd-038772c205b9"}, "slideshow": {"slide_type": "fragment"}}

$$\mathcal{L}\left\{u_0(t)\right\}=\int_{-\infty}^{\infty}u_0(t)e^{-st}\,dt = \int_{0^{+}}^{\infty}e^{-st}\,dt$$
$$X(s) = \left.-\frac{1}{s}e^{-st}\right|_{0^{+}}^{\infty}=\frac{1}{s}\quad\mathrm{Re}(s)\gt 0$$

+++ {"nbpresent": {"id": "b8f02dd9-8876-4679-89fd-038772c205b9"}, "slideshow": {"slide_type": "fragment"}}

where $0^{+}=\lim_{\epsilon\to 0}(0+\epsilon)$.

+++ {"nbpresent": {"id": "b8f02dd9-8876-4679-89fd-038772c205b9"}, "slideshow": {"slide_type": "subslide"}}

Thus the Laplace transform pair is

$$u_0(t) \Leftrightarrow \frac{1}{s}$$

for $\mathrm{Re}(s) > 0$.

+++ {"nbpresent": {"id": "b8f02dd9-8876-4679-89fd-038772c205b9"}, "slideshow": {"slide_type": "slide"}}

(lap2:exp)=
## D. Exponential function $x(t) = e^{-at}u_0(t)$

+++ {"nbpresent": {"id": "b8f02dd9-8876-4679-89fd-038772c205b9"}, "slideshow": {"slide_type": "fragment"}}

We already showed in {ref}`laplace:ex1` that

$$\mathcal{L}\left\{e^{-at}u_0(t)\right\} = \frac{1}{s+a}.$$

+++ {"nbpresent": {"id": "b8f02dd9-8876-4679-89fd-038772c205b9"}, "slideshow": {"slide_type": "subslide"}}

Thus the Laplace transform pair is

$$e^{-at}u_0(t) \Leftrightarrow \frac{1}{s+a}$$

for $\mathrm{Re}(s) > -a$.

+++ {"slideshow": {"slide_type": "subslide"}}

(lap2:ramp)=

## E. Unit ramp $x(t) = t u_0(t)$

+++ {"slideshow": {"slide_type": "fragment"}}

$$\mathcal{L}\left\{t u_0(t)\right\} = \int_0^\infty t e^{-st}\,dt$$

+++ {"slideshow": {"slide_type": "fragment"}}

From tables of integrals:

$$\int te^{-at}\ dt = -\left(\frac{at + 1}{a^2}\right)e^{-at} + C$$

+++ {"slideshow": {"slide_type": "subslide"}}

Or MATLAB

```{code-cell}
---
slideshow:
  slide_type: fragment
---
syms t a
int(t * exp(-a*t))
```

+++ {"slideshow": {"slide_type": "fragment"}}

so

$$\int_0^\infty t e^{-st}\,dt = -\left.\left(\frac{st + 1}{s^2}\right)e^{-st}\right|_0^\infty$$

+++ {"slideshow": {"slide_type": "fragment"}}

$$F(s) = -\frac{1}{s^2}\left(\left(st + 1\right)e^{-\infty} -\left( 0t + 1)\right)e^0\right) = \frac{1}{s^2}$$

+++

Thus the Laplace transform pair is

$$t u_0(t) \Leftrightarrow \frac{1}{s^2}$$

for $\mathrm{Re}(s) > 0$.

+++ {"nbpresent": {"id": "e58f747d-f0a8-464d-b62f-f7bb9ce8b605"}, "slideshow": {"slide_type": "slide"}}

(lap2:others)=
## F. Laplace Transform Pairs for Other Common SIgnals

We can continue to derive the Laplace transforms of the most commonly encoutered signals, and in some cases, e.g. unit ramp $r(t)=u_1(t)=tu_0(t)$, $u_n(t)=t^nu_0(t)$, $t^ne^{-at}u_0(t)$, $\cos \omega t u_0(t)$, $\sin \omega t u_0(t)$ and many others, that we use often, the mathematics can tricky.

Luckily for us, most of the most useful transforms have already been calculated for us and gathered together into tables.

Here are a couple that are on the net for your reference

* Laplace transform [(Wikipedia)](https://en.wikipedia.org/wiki/Laplace_transform)
* Laplace Transform [(Wolfram Alpha)](https://mathworld.wolfram.com/LaplaceTransform.html)

Every textbook that covers Laplace transforms will provide tables of properties (see {ref}`laplace_transfer_properties`) and the most commonly encountered transforms. You will find such tables in  Tables 2.1 and 2.2 of {cite}`karris` and Table 3.1 and Table 3.3 of {cite}`schaum`. 

We reproduce Table 3.1 of {cite}`schaum` in {ref}`laplace_transform_table`. You will find a table of Laplace transform properties in {ref}`laplace_table_of_props` in {ref}`unit4.3`.

+++ {"nbpresent": {"id": "2a56e188-1891-420a-a66b-be808a1a11e2"}, "slideshow": {"slide_type": "slide"}}

(lap:xform_table)=
## G. Laplace tranforms pairs for common signals

| &nbsp;  | $f(t)$                                         | $F(s)$                                              | ROC |
|---------|------------------------------------------------|-----------------------------------------------------|-----|
| 1       | $\displaystyle \delta(t)$                      | $\displaystyle 1$                                   | All $s$ |
| 2       | $\displaystyle \delta(t-a)$                    | $\displaystyle e^{-as}$                             | All $s$ |
| 3       | $\displaystyle u_0(t)$                         | $\displaystyle \frac{1}{s}$ | Re($s$) > 0 |
| 4       | $\displaystyle -u_0(-t)$                       | $\displaystyle \frac{1}{s}$ | Re($s$) < 0 |
| 5       | $\displaystyle t u_0(t)$                       | $\displaystyle \frac{1}{s^2}$   | Re($s$) > 0 | 
| 6       | $\displaystyle t^n u_0(t)$                     | $\displaystyle \frac{n!}{s^{n+1}}$ | Re($s$) > 0 | 
| 7       | $\displaystyle e^{-at}u_0(t)$                  | $\displaystyle \frac{1}{s+a}$ | Re($s$) > $-$Re($a$) 
| 8       | $\displaystyle -e^{-at}u_0(-t)$                | $\displaystyle \frac{1}{s+a}$ | Re($s$)< $-$Re($a$) 
| 9       | $\displaystyle t^n e^{-at} u_0(t)$             | $\displaystyle \frac{n!}{(s+a)^{n+1}}$              |  Re($s$) > $-$Re($a$) | 
| 10      | $\displaystyle -t^n e^{-at} u_0(-t)$             | $\displaystyle \frac{n!}{(s+a)^{n+1}}$              |  Re($s$) < $-$Re($a$) | 
| 11      | $\displaystyle \sin (\omega t) u_0(t)$         | $\displaystyle \frac{\omega}{s^2 + \omega^2}$       | Re($s$) > 0 | 
| 12      | $\displaystyle \cos (\omega t) u_0(t)$         | $\displaystyle \frac{s}{s^2 + \omega^2}$            | Re($s$) > 0 | 
| 13      | $\displaystyle e^{-at} \sin (\omega t) u_0(t)$ | $\displaystyle \frac{\omega}{(s + a)^2 + \omega^2}$ | Re($s$) > $-$Re($a$) |
| 14      | $\displaystyle e^{-at}\cos (\omega t) u_0(t)$  | $\displaystyle \frac{s+a}{(s+a)^2 + \omega^2}$      | Re($s$) > $-$Re($a$) |

+++ {"nbpresent": {"id": "2a56e188-1891-420a-a66b-be808a1a11e2"}, "slideshow": {"slide_type": "notes"}}

Refer to the Chapter 2.3 of {cite}`karris` if you want to study the proofs of these transforms.

+++ {"nbpresent": {"id": "0deac4e0-df0c-4513-a0ae-81ed56e94aec"}, "slideshow": {"slide_type": "subslide"}}

### Don't panic

Tables of Laplace transform properties and transforms will be included with the exam paper.

+++ {"slideshow": {"slide_type": "slide"}}

(lap2:matlab)=
## H. MATLAB Examples

Let's use the MATLAB Symbolic Math Toolbox to prove some of these transforms.

```{code-cell}
---
slideshow:
  slide_type: fragment
---
format compact
syms s t a omega
assume(a>0)
assume(omega>0)
u0(t) = heaviside(t);
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Impulse $\delta(t)$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
laplace(dirac(t))
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Delayed impulse $\delta(t-a)$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
laplace(dirac(t-a))
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Unit step $u_0(t)$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
laplace(u0(t))
```

+++ {"slideshow": {"slide_type": "subslide"}}

For some functions we need to define the ROC and use the integral directly

```{code-cell}
---
slideshow:
  slide_type: fragment
---
laplace(-u0(-t))
```

```{code-cell}
---
slideshow:
  slide_type: fragment
---
assume(real(s) < 0)
int(-u0(-t)*exp(-s*t),t,-inf,0)
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Unit ramp $u_1(t)=tu_0(t)$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
laplace(t*u0(t))
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Powers of $t$

$t^n u_0(t)$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
syms n integer
assume(n > 1)
laplace(t^n*u0(t))
```

+++ {"slideshow": {"slide_type": "notes"}}

What is the $\Gamma$ function `sym/gamma`?

```{code-cell}
---
slideshow:
  slide_type: notes
---
help sym/gamma
```

+++ {"slideshow": {"slide_type": "notes"}}

So, in this context, $\Gamma(n+1) = n!$

+++ {"slideshow": {"slide_type": "subslide"}}

### Exponentials

+++ {"slideshow": {"slide_type": "subslide"}}

#### $e^{-at}u_0(t)$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
laplace(exp(-a*t)*u0(t))
```

+++ {"slideshow": {"slide_type": "subslide"}}

#### $-e^{-at}u_0(-t)$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
laplace(-exp(-a*t)*u0(-t))
```

+++ {"slideshow": {"slide_type": "subslide"}}

Defining the ROC and using `int`

```{code-cell}
---
slideshow:
  slide_type: fragment
---
assume(s + a < 0)
int(-exp(-a*t)*u0(-t)*exp(-s*t),t,-inf,0)
```

+++ {"slideshow": {"slide_type": "subslide"}}

#### $te^{-at}u_0(t)$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
laplace(t*exp(-a*t)*u0(t))
```

#### $t^ne^{-at}u_0(t)$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
syms n integer
laplace(t^n*exp(-a*t)*u0(t))
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Sinusoids

+++ {"slideshow": {"slide_type": "fragment"}}

#### $\cos \left(\omega t\right) u_0(t)$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
laplace(cos(omega*t)*u0(t))
```

+++ {"slideshow": {"slide_type": "subslide"}}

#### $\sin \left(\omega t\right) u_0(t)$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
laplace(sin(omega*t)*u0(t))
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Decaying sinusoids

+++ {"slideshow": {"slide_type": "subslide"}}

#### $e^{-at}\cos\left(\omega t\right)u_0(t)$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
laplace(exp(-a*t)*cos(omega*t)*u0(t))
```

#### $e^{-at}\sin\left(\omega t\right)u_0(t)$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
laplace(exp(-a*t)*sin(omega*t)*u0(t))
```

+++ {"slideshow": {"slide_type": "notes"}}

lap2:homework
## Homework

For week 5, you should complete {ref}`ex:9.1` from {ref}`unit4.1` and study Solved Problems 3.2&mdash;3.6 of {cite}`schaum`.

If you want more practice, try to solve Supplementary Problems 3.43&mdash;3.46 of {cite}`schaum`.

+++ {"slideshow": {"slide_type": "notes"}}

(lap2:summary)=
## Summary

In this unit, we continued our introduction to the Laplace transform by presenting the transforms of the most commonly encoutered common signals. The topucs covered were:

* {ref}`lap2:impulse`

* {ref}`lap2:delayed_impulse`

* {ref}`lap2:unit_step`

* {ref}`lap2:exp`

* {ref}`lap:xform_table`

* {ref}`lap2:matlab`

(unit4.2:takeaways)=
### Unit 4.3: Takeaways

It is relatively easy to use the one-sided integral to compute the Laplace transform of commonly used signals. and you would be expected to be able to do this for any of the cases illustrated in this section.

In practice, we use tables of transform pairs $f(t)\Leftrightarrow F(s)$, such as that reproduced here in {ref}`lap:xform_table`. 

Such tables, or at least abstracts of such tables, will be provided in examinations and you will be provided with a copy of the **Tables for Examination Use** that will be used in this year's assessment via Canvas so that you can familiarise yourself with the tables as you work through the examples and exercises to come.

Integrals and Laplace transform pairs can easily be confirmed using the MATLAB Symbolic Math Toolbox functions `int` and `laplace`.

+++ {"nbpresent": {"id": "4f9f0fa3-84d5-45c3-a6fd-78f84f94388c"}, "slideshow": {"slide_type": "slide"}}

## Next Time

We move on to consider 

* {ref}`unit4.3`

## References

```{bibliography}
:filter: docname in docnames
```
