---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.14.0
kernelspec:
  display_name: Matlab
  language: matlab
  name: matlab
---

+++ {"slideshow": {"slide_type": "slide"}}

(lti_systems)=
# Linear Time-Invariant Systems

Based on Chapter 2 of {cite}`schaum` 


## Introduction

Two most important attributes of systems are linearity and time invariance. In this chapter we develop the fundamental input-output relationship for systems having these attributes. It will be shown that the input output-relationship for LTI systems is described in terms of a convolution operation. The importance of the convolution operation in LTI systems stems from the fact that the knowledge of the system response and LTI system to the unit impulse response allows us to find its output to any input signals. Specifying the input-output relationships for LTI systems by differential equations will also be discussed.

+++ {"slideshow": {"slide_type": "notes"}}

We will discuss specifying the input-output relationsships for discrete-time systems will be covered in **EG-247 Digital Signal Processing** next year.

+++ {"slideshow": {"slide_type": "slide"}}

## Subjects to be covered

* {ref}`Response_of_a_Continuous_Time_LTI_System_and_the_Convolution_Integral`
* {ref}`Properties_of_Continuous_Time_LTI_Systems`
* {ref}`eigenfunctions_of_continuous_time_LTI_systems`
* {ref}`Systems Described by Differential Equations`

+++ {"slideshow": {"slide_type": "slide"}}

(Response_of_a_Continuous_Time_LTI_System_and_the_Convolution_Integral)=
## Response of a Continuous-Time LTI System and the Convolution Integral

+++ {"slideshow": {"slide_type": "fragment"}}

(impulse_reponse)=
### A. Impulse Response

The *impulse response* $h(t)$ of a continuous-time LTI system (represented by $\mathbf{T}$) is defined as the response of the system when the input is $\delta(t)$, that is,

$$h(t) = \mathbf{T}\left\{\delta(t)\right\}$$

+++ {"slideshow": {"slide_type": "subslide"}}

(abitrary_signal_response)=
### B. Response to an Arbitrary Input

From the {ref}`sifting_property)` 

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
### C. Convolution Integral

The equation

$$y(t) = \int_{-\infty}^{\infty}x(t)h(t-\tau)\,d\tau$$ defines the *convolution* of two continuous-time signals $x(t)$ and $h(t)$ denoted by

$$y(t) = x(t) * h(t) = \int_{-\infty}^{\infty}x(t)h(t-\tau)\,d\tau$$

+++ {"slideshow": {"slide_type": "subslide"}}

The equation 

$$y(t) = x(t) * h(t) = \int_{-\infty}^{\infty}x(t)h(t-\tau)\,d\tau$$

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
### D. Properties of the Convolution Integral

The convolution integral has the following properties.

+++ {"slideshow": {"slide_type": "fragment"}}

#### 1. Commutative:

$$x(t) * h(t) = h(t) * x(t)$$

+++ {"slideshow": {"slide_type": "fragment"}}

#### 2. Associative:

$$\left\{x(t) * h_1(t)\right\} * h_2(t) = x(t) * \left\{h_1(t) * h_2(t)\right\}$$

+++ {"slideshow": {"slide_type": "fragment"}}

#### 3. Distributive:

$$x(t)*\left\{h_1(t) + h_2(t)\right\} = x(t)*h_1(t) + x(t)*h_2(t)$$

+++ {"slideshow": {"slide_type": "subslide"}}

### E. Convolution Integral Operation

+++ {"slideshow": {"slide_type": "subslide"}}

### F. Step Response

+++ {"slideshow": {"slide_type": "slide"}}

(Properties_of_Continuous_Time_LTI_Systems)=
## Properties of Continuous-Time LTI Systems

+++ {"slideshow": {"slide_type": "slide"}}

(eigenfunctions_of_continuous_time_LTI_systems)=
## Eigenfunctions of Continuous-Time LTI Systems

+++ {"slideshow": {"slide_type": "slide"}}

(Systems_Described_by_Differential_Equations)=
## Systems Described by Differential Equations

+++ {"slideshow": {"slide_type": "slide"}}

## Worked Solutions

+++ {"slideshow": {"slide_type": "slide"}}

## Homework Problems

+++ {"slideshow": {"slide_type": "slide"}}

## Lab Exercises

+++ {"slideshow": {"slide_type": "slide"}}

## Summary

In this lecture we have started our look at LTI systems.

In particular we have looked at

* {ref}`Response_of_a_Continuous_Time_LTI_System_and_the_Convolution_Integral`
* {ref}`Properties_of_Continuous_Time_LTI_Systems`
* {ref}`eigenfunctions_of_continuous_time_LTI_systems`
* {ref}`Systems Described by Differential Equations`

+++ {"slideshow": {"slide_type": "slide"}}

## Next Time

{ref}`Laplace Transforms and their Applications`
