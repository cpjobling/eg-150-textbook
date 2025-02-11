---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.16.6
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

+++ {"slideshow": {"slide_type": "slide"}}

(lti_systems)=
# Unit 3: Linear Time-Invariant Systems

This chapter is based on on Chapter 2 of {cite}`schaum`

+++ {"slideshow": {"slide_type": "fragment"}}

Follow along at [cpjobling.github.io/eg-150-textbook/lti_systems](https://cpjobling.github.io/eg-150-textbook/lti_systems)

+++ {"slideshow": {"slide_type": "slide"}}

## Introduction

Two most important attributes of systems are linearity and time invariance. In this chapter we develop the fundamental input-output relationship for systems having these attributes. It will be shown that the input output-relationship for LTI systems is described in terms of a convolution operation. The importance of the convolution operation in LTI systems stems from the fact that the knowledge of the system response and LTI system to the unit impulse response allows us to find its output to any input signals. Specifying the input-output relationships for LTI systems by differential equations will also be discussed. on Chapter 2 of {cite}`schaum`

+++ {"slideshow": {"slide_type": "notes"}}

We will discuss specifying the input-output relationsships for discrete-time systems will be covered in **EG-247 Digital Signal Processing** next year.

+++ {"slideshow": {"slide_type": "slide"}}

## Contents of this chapter

* {ref}`Response_of_a_Continuous_Time_LTI_System_and_the_Convolution_Integral`
* {ref}`examples_5_Responses_of_a_Continuous_Time_LTI_System_and_Convolution`
* {ref}`Properties_of_Continuous_Time_LTI_Systems`
* {ref}`eigenfunctions_of_continuous_time_LTI_systems`
* {ref}`Systems_Described_by_Differential_Equations`
