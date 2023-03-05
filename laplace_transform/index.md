---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.14.4
kernelspec:
  display_name: Matlab (Connection)
  language: matlab
  name: matlab_connect
---

+++ {"slideshow": {"slide_type": "slide"}}

(laplace)=

# Unit 4: Laplace Transforms and their Applications

+++ {"slideshow": {"slide_type": "subslide"}}

## Motivating example

In {ref}`ex4.1` we presented the RC Circuit shown in {numref}`RC_circuit_L`

:::{figure-md} RC_circuit_L
<img src="pictures/RC_circuit.png" alt="An RC Circuit" width="60%">

An RC Circuit
:::

+++ {"slideshow": {"slide_type": "subslide"}}

We showed that voltage across the capacitor $v_c(t)$ is determined by the first-order differential equation 

$$\frac{1}{RC}v_s(t) = \frac{d}{dt}v_c(t) + \frac{1}{RC}v_c(t)$$

+++ {"slideshow": {"slide_type": "fragment"}}

Assuming that the input voltage is applied by operating a switch, that is $v_s(t)$ is the step function $V_s u_0 (t)$ what would the output $v_c(t)$ look like?

+++ {"slideshow": {"slide_type": "subslide"}}

We will sketch the solution in our OneNote notebook

+++ {"slideshow": {"slide_type": "subslide"}}

## About the Laplace Transformation

The Laplace Transformation (named after [Pierre-Simon Laplace](https://en.wikipedia.org/wiki/Pierre-Simon_Laplace)) is a useful mathematical tool that is used in many branches of engineering including signals and systems theory, control theory, communications, mechanical engineering, etc.

+++ {"slideshow": {"slide_type": "fragment"}}

Its principle benefits are: 

* it enables us to represent differential equations that model the behaviour of systems in the time domain as polynomials in $s$ which facilitates their solution as we will now demonstrate.

+++ {"slideshow": {"slide_type": "fragment"}}

* it converts time convolution (which is how we determine the time-response of a system to a given signal) into a simple multiplication in the $s$ domain.

+++ {"slideshow": {"slide_type": "fragment"}}

* it allows us to model linear time-invariant (LTI) system components using transfer functions and systems by block diagrams.

+++ {"slideshow": {"slide_type": "fragment"}}

* block diagram analysis allows us to readily compute system responses to complex signals and facilitates system simulation and system analysis.

+++ {"slideshow": {"slide_type": "fragment"}}

The only downside is that time $t$ is a real value whereas the Laplace transformation operator $s$ is a complex exponential $s = \sigma + j\omega$.

+++ {"slideshow": {"slide_type": "notes"}}

## Table of Contents

In this section of the course we will cover:

* {ref}`unit4.1`
* {ref}`unit4.2`
* {ref}`unit4.3`
* {ref}`unit4.4`
* {ref}`unit4.5`
* {ref}`unit4.6`
* {ref}`unit4.7`
* {ref}`unit4.8`
