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
# Properties and Eigenfunctions of Continuous-Time LTI Systems

This section is based on Sections 2.3 and 2.4 of {cite}`schaum` 

+++ {"slideshow": {"slide_type": "slide"}}

## Subjects to be covered

* {ref}`Properties_of_Continuous_Time_LTI_Systems`
* {ref}`eigenfunctions_of_continuous_time_LTI_systems`
* {ref}`examples_6`

+++ {"slideshow": {"slide_type": "slide"}}

(Properties_of_Continuous_Time_LTI_Systems)=
## Properties of Continuous-Time LTI Systems

* {ref}`a_systems_with_and_without_memory`
* {ref}`b_causality`
* {ref}`c_Stability`

+++ {"slideshow": {"slide_type": "slide"}}

(a_systems_with_and_without_memory)=
### A. Systems with or without memory

+++ {"slideshow": {"slide_type": "fragment"}}

Since the output $y(t)$ of a memoryless system depends only on the current input $x(t)$, then, if the system is also linear and time-invariant, this relationship can only be of the form

$$y(t) = Kx(t)$$

where $K$ is a (gain) constant. 

+++ {"slideshow": {"slide_type": "subslide"}}

Thus the corresponding impulse response $h(t)$ is simply

$$h(t) = K\delta(t)$$

+++ {"slideshow": {"slide_type": "fragment"}}

Therefore, if $h(t_0) \neq 0$ for $t_0 \neq 0$, then the continuous-time LTI system has memory.

+++ {"slideshow": {"slide_type": "slide"}}

(b_causality)=
### B. Causality

+++ {"slideshow": {"slide_type": "slide"}}

(c_Stability)=
### C. Stability

+++ {"slideshow": {"slide_type": "slide"}}

(eigenfunctions_of_continuous_time_LTI_systems)=
## Eigenfunctions of Continuous-Time LTI Systems

+++ {"slideshow": {"slide_type": "slide"}}

(examples_6)=
## Examples 6

+++ {"slideshow": {"slide_type": "subslide"}}

(ex6_1)=
### Example 6.1 

Verify the following properties of the convolution integral; that is,

(a) $x(t)*h(t) = h(t)*x(t)$

(b) $\left\{x(t) * h_1(t)\right\} * h_2(t) = x(t)*\left\{h_1(t) * h_2(t)\right\}$

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 2.1 in in {cite}schaum.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex6_2)=
### Example 6.2

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 2.2 in in {cite}schaum.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex6_3)=
### Example 6.3

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 2.3 in in {cite}schaum.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex6_4)=
### Example 6.4

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 2.4 in in {cite}schaum.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex6_5)=
### Example 6.5

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 2.5 in {cite}schaum.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex6_6)=
### Example 6.6

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 2.6 in {cite}schaum.

+++ {"slideshow": {"slide_type": "slide"}}

## Summary

In this lecture we have started our look at LTI systems.

In particular we have looked at

* {ref}`Response_of_a_Continuous_Time_LTI_System_and_the_Convolution_Integral`

+++ {"slideshow": {"slide_type": "slide"}}

## Summary

* {ref}`Properties_of_Continuous_Time_LTI_Systems`
* {ref}`eigenfunctions_of_continuous_time_LTI_systems`

+++ {"slideshow": {"slide_type": "slide"}}

## Next Time

* {ref}`Systems_Described_by_Differential_Equations`

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
* {ref}`examples_5_Responses_of_a_Continuous-Time_LTI_System_and_Convolution)`
* {ref}`Properties_of_Continuous_Time_LTI_Systems`
* {ref}`eigenfunctions_of_continuous_time_LTI_systems`
* {ref}`Systems_Described_by_Differential_Equations`
