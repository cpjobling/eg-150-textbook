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
* {ref}`Systems Described by Differential Equations`

+++ {"slideshow": {"slide_type": "slide"}}

(Response_of_a_Continuous_Time_LTI_System_and_the_Convolution_Integral)=
## Response of a Continuous-Time LTI System and the Convolution Integral

### A. Impulse response

The *impulse response* $h(t)$ of a continuous-time LTI system (represented by $\mathbf{T}$) is defined as the response of the system when the input is $\delta(t)$, that is,

```{math}
:label: eq:impulse-response
h(t) = \mathbf{T}\left\{\delta(t)\right\}
```

+++ {"slideshow": {"slide_type": "slide"}}

(Properties_of_Continuous_Time_LTI_Systems)=
## Properties of Continuous-Time LTI Systems

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
* {ref}`Systems Described by Differential Equations`

+++ {"slideshow": {"slide_type": "slide"}}

## Next Time

{ref}`Laplace Transforms and their Applications`
