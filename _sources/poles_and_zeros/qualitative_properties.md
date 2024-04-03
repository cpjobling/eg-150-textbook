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

:::figure-md fig:pz:2
<img src="pictures/example1.png" width="50%"
     alt="A figure quantifying the response for exp(sigma t)cos(omega t): rows for omega = 30, 15, 0; columns for \sigma = -1.5, 0.75, 0, 0.75, 1.5." />

Quantifying the response for $f(t) = e^{\sigma t}\cos\left(\omega t\right)$: rows $\omega = 30, 15, 0$; columns: $\sigma = -1.5, 0.75, 0, 0.75, 1.5$
:::

+++ {"slideshow": {"slide_type": "notes"}}

MATLAB code to reproduce this figure [example1.mlx](matlab/example1.mlx)

```{code-cell}
---
slideshow:
  slide_type: notes
---
format compact
cd matlab
open example1
```

+++ {"slideshow": {"slide_type": "slide"}}

(unit5.1.3)=
## Damping and quality factor

+++ {"slideshow": {"slide_type": "fragment"}}

(unit5.1.4)=
## Stability of autonomous LCCODEs

+++ {"slideshow": {"slide_type": "fragment"}}

(unit5.1.5)=
## Initial value and final value theorems

```{code-cell}

```

+++ {"slideshow": {"slide_type": "notes"}}

## References

```{bibliography}
:filter: docname in docnames
```
