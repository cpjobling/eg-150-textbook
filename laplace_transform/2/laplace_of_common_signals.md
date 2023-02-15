---
jupytext:
  formats: md:myst,ipynb
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.14.4
kernelspec:
  display_name: MATLAB
  language: matlab
  name: imatlab
---

+++ {"nbpresent": {"id": "90f3c07d-3646-44b0-a549-7020fc10d16f"}, "slideshow": {"slide_type": "slide"}}

# Unit 4.2: Laplace Transform of Some Common Signals

The preparatory reading for this section is Chapter 2.2 of {cite}`karris` and Chapter 3.4 of {cite}`schaum`.

+++ {"nbpresent": {"id": "90f3c07d-3646-44b0-a549-7020fc10d16f"}, "slideshow": {"slide_type": "notes"}}

Follow along at [cpjobling.github.io/eg-150-textbook/laplace_transform/2/laplace_of_common_signals](https://cpjobling.github.io/eg-150-textbook/laplace_transform/2/laplace_of_common_signals)

![QR Code for this lecture](pictures/qrcode_laplace_2.png)

+++ {"nbpresent": {"id": "f651cafb-8c2b-4d27-aec9-3491dbcce1aa"}, "slideshow": {"slide_type": "slide"}}

## Agenda

+++ {"nbpresent": {"id": "cdff914d-604d-4ae8-a8e6-8e5caf8bd41e"}, "slideshow": {"slide_type": "fragment"}}

* {ref}`lap2:impulse`

+++ {"nbpresent": {"id": "74c922da-bfb7-4f82-808d-a89b61bd1ab6"}, "slideshow": {"slide_type": "fragment"}}

* {ref}`lap2:delayed_impulse`

+++ {"nbpresent": {"id": "e7e4ac91-07af-41a4-98e4-6027ac34b41e"}, "slideshow": {"slide_type": "fragment"}}

* {ref}`lap2:unit_step`

+++ {"nbpresent": {"id": "11a99664-2fdb-4eff-8389-043965b5a6a5"}, "slideshow": {"slide_type": "subslide"}}

* {ref}`lap2:exp`

+++ {"nbpresent": {"id": "a2796ec3-fd12-49d3-99b8-fdc640f0af04"}, "slideshow": {"slide_type": "fragment"}}

* {ref}`lap2:xform_table`

+++

* {ref}`lap2:matlab`

+++ {"nbpresent": {"id": "b8f02dd9-8876-4679-89fd-038772c205b9"}, "slideshow": {"slide_type": "slide"}}

(lap2:impulse)=
## A. Unit impulse function $\delta(t)$

+++ {"slideshow": {"slide_type": "fragment"}}

$$\mathcal{L}\left\{\delta(t)\right\}=\int_{-\infty}^{\infty}\delta(t)e^{-st}\,dt$$

+++ {"slideshow": {"slide_type": "fragment"}}

Using the sifting property of the Dirac delta function

+++ {"slideshow": {"slide_type": "fragment"}}

$$\mathcal{L}\left\{\delta(t)\right\}=\int_{-\infty}^{\infty}\delta(t)e^{-st}\,dt = e^{-s(0)}=1\quad \mathrm{all}\ s$$

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

where $0^{+}=\lim_\epsilon\to 0(0+\epsilon)$.

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

+++ {"nbpresent": {"id": "e58f747d-f0a8-464d-b62f-f7bb9ce8b605"}, "slideshow": {"slide_type": "slide"}}

(lap2:others)=
## E. Laplace Transform Pairs for Other Common SIgnals

We can continue to derive the Laplace transforms of the most commonly encoutered signals, and in some cases, e.g. unit ramp $r(t)=u_1(t)=tu_0(t)$, $u_n(t)=t^nu_0(t)$, $t^ne^{-at}u_0(t)$, $\cos \omega t u_0(t)$, $\sin \omega t u_0(t)$ and many others, that we use often, the mathematics can tricky.

Luckily for us, most of the most useful transforms have already been calculated for us and gathered together into tables.

Here are a couple that are on the net for your reference

* Laplace transform [(Wikipedia)](https://en.wikipedia.org/wiki/Laplace_transform)
* Laplace Transform [(Wolfram Alpha)](https://mathworld.wolfram.com/LaplaceTransform.html)

Every textbook that covers Laplace transforms will provide tables of properties (see {doc}`laplace_transfer_properties`) and the most commonly encountered transforms. You will find such tables in  Tables 2.1 and 2.2 of {cite}`karris` and Table 3.1 and Table 3.3 of {cite}`schaum`. 

We reproduce Table 3.1 of {cite}`schaum` below. You will find a table of Laplace transform properties in the next chapter.

+++ {"nbpresent": {"id": "2a56e188-1891-420a-a66b-be808a1a11e2"}, "slideshow": {"slide_type": "slide"}}

(lap:xform_table)=
## F. Transforms of Common Signals


| &nbsp;  | $f(t)$                                         | $F(s)$                                              | ROC |
|---------|------------------------------------------------|-----------------------------------------------------|-----|
| 1       | $\displaystyle \delta(t)$                      | $\displaystyle 1$                                   | All $s$ |
| 2       | $\displaystyle \delta(t-a)$                    | $\displaystyle e^{-as}$                             | All $s$ |
| 3       | $\displaystyle u_0(t)$                         | $\displaystyle \frac{1}{s}$ | Re($s$) > 0 |
| 4       | $\displaystyle t u_0(t)$                       | $\displaystyle \frac{1}{s^2}$   | Re($s$) > 0 | 
| 5       | $\displaystyle t^n u_0(t)$                     | $\displaystyle \frac{n!}{s^{n+1}}$ | Re($s$) > 0 | 
| 6       | $\displaystyle e^{-at}u_0(t)$                  | $\displaystyle \frac{1}{s+a}$ | Re($s$) > $-$Re($a$) | 
| 7       | $\displaystyle t^n e^{-at} u_0(t)$             | $\displaystyle \frac{n!}{(s+a)^{n+1}}$              |  Re($s$) > $-$Re($a$) | 
| 8       | $\displaystyle \sin (\omega t) u_0(t)$         | $\displaystyle \frac{\omega}{s^2 + \omega^2}$       | Re($s$) > 0 | 
| 9       | $\displaystyle \cos (\omega t) u_0(t)$         | $\displaystyle \frac{s}{s^2 + \omega^2}$            | Re($s$) > 0 | 
| 10      | $\displaystyle e^{-at} \sin (\omega t) u_0(t)$ | $\displaystyle \frac{\omega}{(s + a)^2 + \omega^2}$ | Re($s$) > $-$Re($a$) |
| 11      | $\displaystyle e^{-at}\cos (\omega t) u_0(t)$  | $\displaystyle \frac{s+a}{(s+a)^2 + \omega^2}$      | Re($s$) > $-$Re($a$) |

+++ {"nbpresent": {"id": "2a56e188-1891-420a-a66b-be808a1a11e2"}, "slideshow": {"slide_type": "notes"}}

Refer to the Chapter 2.3 of {cite}`karris` if you want to study the proofs of these transforms.

+++ {"nbpresent": {"id": "0deac4e0-df0c-4513-a0ae-81ed56e94aec"}, "slideshow": {"slide_type": "subslide"}}

### Don't panic

Tables of Laplace transform properties and transforms will be included with the exam paper.

+++ {"slideshow": {"slide_type": "slide"}}

(lap2:matlab)=
## G. MATLAB Examples

Let's use the MATLAB Symbolic Math Toolbox to prove some of these transforms.

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
syms s t a omega
assume(a>0)
assume(omega>0)
u0(t) = heaviside(t);
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Impulse $\delta(t)$

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
laplace(dirac(t))
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Delayed impulse $\delta(t-a)$

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
laplace(dirac(t-a))
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Unit step $u_0(t)$

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
laplace(u0(t))
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Unit ramp $u_1(t)=tu_0(t)$

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
laplace(t*u0(t))
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Powers of $t$

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
syms n integer
assume(n > 1)
laplace(t^n*u0(t))
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Exponentials

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
laplace(exp(-a*t)*u0(t))
laplace(t*exp(-a*t)*u0(t))
laplace(t^n*exp(-a*t)*u0(t))
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Sinusoids

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
laplace(cos(omega*t)*u0(t))
laplace(sin(omega*t)*u0(t))
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Decaying sinusoids

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
laplace(exp(-a*t)*cos(omega*t)*u0(t))
laplace(exp(-a*t)*sin(omega*t)*u0(t))
```

+++ {"nbpresent": {"id": "4f9f0fa3-84d5-45c3-a6fd-78f84f94388c"}, "slideshow": {"slide_type": "slide"}}

## Next Time

We move on to consider 

* {doc}`../3/laplace_properties.md`

## References

```{bibliography}
:filter: docname in docnames
```
