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

(poles_and_zeros)=
# Unit 5: Pole-Zero Analysis

In {ref}`unit4.4` we introduced the idea of *poles and zeros* and in {ref}`unit4.6` we introduced the idea of a *transfer function* which represents the *impulse response* of a system $H(s)$. The transfer function $H(s)$ has a numerator $N(s)$ and a denominator $D(s)$:

$$H(s) = \frac{N(s)}{D(s)}$$ (eq:pz:1)

Both the numerator and the denominator can be factorised

$$H(s) = \frac{(s - z_1)\ldots(s - z_m)}{(s - p_1)\ldots(s - p_n)}$$ (eq:pz:2)

The $z_i$, which are the values for which $N(s)=0$ are called the *zeros* of $H(s)$. The values $p_i$ are the zeros of the denominator $D(s)$ at which $H(s) = \infty$. The zeros of $D(s)$ are called the *poles* of the system $H(s)$.  

In {ref}`unit4.4` we categorised the poles of the system into four cases:
* {ref}`ilap:distinct_real_poles`
* {ref}`case:complex_poles`
* {ref}`ilap:repeated_poles`
* {ref}`ilap:improper`

However, we didn't really discuss the implications of these cases. In this unit we aim to correct this omission. At the end of this unit, we hope that you will be able to discuss the qualitative behaviour of a system with any number of poles and zeros. This will be very useful going forward.

## Table of Contents

* {ref}`unit5.1`
* {ref}`unit5.2`

```{code-cell}

```
