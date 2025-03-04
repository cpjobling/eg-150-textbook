---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.16.7
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

(unit6)=
# Unit 6: Frequency Response Analysis

If you have a LTI system $h(t)$ and your input $x(t) = a\sin(\omega t)$ is a sinusoid, the steady-state output $y(t)$, after any initial transient has died away, will be another sinusoid whose magitude and phase depends only on the frequency of the input signal and the poles and zeros of the system.

In other words,

$$Y(\omega) = H(\omega).$$

To find the stead-state frequency response of any LTI system, we simply make the substituition 

$$s = j\omega$$

In this final unit of EG-150 Signals and Systems we will explore this concept using MATLAB analysis and simulation and we will present a useful representation of the frequency response of a system called the Bode plot.

+++

## Table of Contents

* {ref}`unit6.1`
* {ref}`unit6.2`
