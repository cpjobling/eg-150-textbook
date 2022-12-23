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

# Systems and Classification of Systems

This section is based on Section 1.5 of {cite}`schaum`.

+++ {"slideshow": {"slide_type": "notes"}}

## Subjects to be covered

* {ref}`system_representation`
* {ref}`deterministic_and_stochastic_systems`
* {ref}`continuous_time_and_discrete_time_systems`
* {ref}`aystems_with_memory_and_without_memory`
* {ref}`causal_and_non-causal_systems`
* {ref}`linear_systems_and_nonlinear_systems`
* {ref}`linear_time_invariant_systems`
* {ref}`stable_systems`
* {ref}`feedback_systems`

+++ {"slideshow": {"slide_type": "slide"}}

(system_representation)=
## System Representation

A *system* is a mathematical model of a physical process that relates the *input* (or *excitation*) signal to the *output* (or *response*) signal.

+++ {"slideshow": {"slide_type": "fragment"}}

Let $x$ and $y$ be the input and output signals, respectively, of a system. Then the system is viewed as a *transformation* (or *mapping*) of $x$ into $y$. The transformation is represented by the mathematical notation

$$y = \mathbf{T}x$$

where $\mathbf{T}$ is the *operator* representing some well defined rule by which $x$ is transformed into $y$.

+++ {"slideshow": {"slide_type": "notes"}}

The relationship is depicted graphically as shown in {numref}`fig:system`(a).

+++ {"slideshow": {"slide_type": "notes"}}

Multiple input and/or output ssystems are possible as shown in {numref}`fig:system`(b). In this module we will restrict our attention to the single-input, single-output case.

+++ {"slideshow": {"slide_type": "subslide"}}

:::{figure-md} fig:system
<img src="pictures/system.png" alt="System with single or multiple inputs and outputs" width="60%">

System with single or multiple inputs and outputs
:::

+++ {"slideshow": {"slide_type": "slide"}}

(deterministic_and_stochastic_systems)=
## Deterministic and Stochastic Systems

+++ {"slideshow": {"slide_type": "fragment"}}

If the input and output signals $x$ and $y$ are deterministic signals, then the system is called a deterministic system.

+++ {"slideshow": {"slide_type": "fragment"}}

If the input and output signals $x$ and $y$ are random signals, then the system is called a *stochastic* system.

+++ {"slideshow": {"slide_type": "slide"}}

(continuous_time_and_discrete_time_systems)=
## Continuous-Time and Discrete-Time Systems

+++ {"slideshow": {"slide_type": "fragment"}}

If the input and output signals  𝑥  and  𝑦  are continuous-time signals, then the system is called a *continuous-time system* ({numref}`fig:ct_n_dt_system`(a)).

+++ {"slideshow": {"slide_type": "fragment"}}

If the input and output signals  𝑥  and  𝑦  are discrete-time signals or sequences, then the system is called a *discrete-time system* ({numref}`fig:ct_n_dt_system`(b)).

+++ {"slideshow": {"slide_type": "fragment"}}

:::{figure-md} fig:ct_n_dt_system
<img src="pictures/ct_n_dt_system.png" alt="Continuous-time and discrete-time systems" width="60%">

(a) Continuous-time system; (b) discrete time system.
:::

+++ {"slideshow": {"slide_type": "notes"}}

 Note that in a continuous-time system the input $x(t)$ and $y(t)$ are often expressed as a differential equation (see Example 4.1) and in a discrete-time system $x[n]$ and $y[n]$ are often expressed by a difference equation.

+++ {"slideshow": {"slide_type": "slide"}}

(aystems_with_memory_and_without_memory)=
## Systems with Memory and without Memory

+++ {"slideshow": {"slide_type": "fragment"}}

A system is said to be *memoryless* if the output at any time only depends on the input at the same time.

+++ {"slideshow": {"slide_type": "fragment"}}

Otherwise the system is said to have *memory*.

+++ {"slideshow": {"slide_type": "subslide"}}

### A memoryless system

An example of a memoryless system is a resistor $R$ with and the input $x(t)$ taken as the current and the voltage taken as the output $y(t)$.

+++ {"slideshow": {"slide_type": "fragment"}}

:::{figure-md}  fig:resistor
<img src="pictures/resistor.png" alt="A resistor is an example of a memoryless system" width="50%">

A memoryless system: a resistor
:::

+++ {"slideshow": {"slide_type": "subslide"}}

The input-output relationship (Ohm's law) of a resistor is

$$y(t) = Rx(t)$$

+++ {"slideshow": {"slide_type": "subslide"}}

### A system with memory

An example of a system with memory is a capacitor $C$ with and the current as the input $x(t)$ taken as the current and the voltage as the output $y(t)$.

+++ {"slideshow": {"slide_type": "fragment"}}

::{figure-md}  fig:capacitor
<img src="pictures/capacitor.png" alt="A capacitor is an example of a system with memory" width="50%">

A system with memory: a capicitor
:::

Then:

+++ {"slideshow": {"slide_type": "subslide"}}

Then

$$y(t) = \frac{1}{C}\int_{-\infty}^{t}x(\tau)\,d\tau$$

+++ {"slideshow": {"slide_type": "slide"}}

(causal_and_non-causal_systems)=
## Causal and Non-Causal Systems

A system is called *causal* if its output at the present time depends only on the present and/or past values of the input. 

+++ {"slideshow": {"slide_type": "fragment"}}

Thus, in a causal system, it is not possible to obtain an output before and input is applied to the system. 

+++ {"slideshow": {"slide_type": "fragment"}}

A system is called *noncausal* (or *anticipative*) if its output at the present time depends on future values of the input. 

+++ {"slideshow": {"slide_type": "fragment"}}

An example of a noncausal system is

$$y(t) = x(t + 1)$$

+++ {"slideshow": {"slide_type": "notes"}}

Note that all memoryless systems are causal but not all *vice versa*.

+++ {"slideshow": {"slide_type": "slide"}}

(linear_systems_and_nonlinear_systems)=
## Linear Systems and Nonlinear Systems

If an operator $\mathbf{T}$ satisfies the following two conditions, then $\mathbf{T}$ is called a *linear operator* and the system represented by the linear operator $\mathbf{T}$ is called a *linear system*:

+++ {"slideshow": {"slide_type": "subslide"}}

### 1. Additivity

Given that $\mathbf{T}x_1 = y_1$ and  $\mathbf{T}x_2 = y_2$, 

+++ {"slideshow": {"slide_type": "fragment"}}

then

$$\mathbf{T}\left\{x_1 + x_2\right\} = y_1 + y_2$$

for any signals $x_1$ and $x_2$.

+++ {"slideshow": {"slide_type": "subslide"}}

### 2. Homogeneity (or *Scaling*)

$$\mathbf{T}\left\{\alpha x\right\} = \alpha y$$

for any signals $x$ and any scalar $\alpha$.

+++ {"slideshow": {"slide_type": "subslide"}}

### Nonliear systems

Any system that does not satisfy the additivity and homogeneity conditions is classified as a *nonlinear system*.

+++ {"slideshow": {"slide_type": "subslide"}}

### Superposition property

The additivity and homogeneity conditions can combined in a single condition (known as the *superposition property* as

$$\mathbf{T}\left\{\alpha_1 x_1 + \alpha_2 x_2 \right\} = \alpha_1 y_1 + \alpha_2 y_2$$

where $\alpha_1$ and $\alpha_2$ are arbitrary scalars.

+++ {"slideshow": {"slide_type": "subslide"}}

### Example linear systems

Examples of linear systems are the resistor and capacitor discussed earlier.

+++ {"slideshow": {"slide_type": "subslide"}}

### Example nonlinear systems

Examples of nonlinear systems are

$$y = x^2$$

$$y = \cos x$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Zero input property

Note that a consequence of the homegenity (or scaling) property of linear systems is that a *zero input yields a zero output*. This follows readilty by setting $\alpha = 0$ in the equation $\mathbf{T}\left\{\alpha x\right\} = \alpha y$. This is another important property of linear systems.

+++ {"slideshow": {"slide_type": "slide"}}

(linear_time_invariant_systems)=
## Linear Time-Invariant Systems

+++ {"slideshow": {"slide_type": "slide"}}

(stable_systems)=
## Stable Systems

+++ {"slideshow": {"slide_type": "slide"}}

(feedback_systems)=
## Feedback Systems

+++ {"slideshow": {"slide_type": "notes"}}

## Summary

In this lecture we have started our look at systems and the classification of systems.

In particular we have looked at

* {ref}`system_representation`
* {ref}`deterministic_and_stochastic_systems`
* {ref}`continuous_time_and_discrete_time_systems`
* {ref}`aystems_with_memory_and_without_memory`
* {ref}`causal_and_non-causal_systems`
* {ref}`linear_systems_and_nonlinear_systems`
* {ref}`linear_time_invariant_systems`
* {ref}`stable_systems`
* {ref}`feedback_systems`

+++ {"slideshow": {"slide_type": "notes"}}

## Next time

* {ref}`elementary_signals`
