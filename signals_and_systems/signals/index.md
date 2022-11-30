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

# Signals and Classification of Signals

This section is based on Section 1.2 of {cite}`schaum`.

A *signal* is a function representing a phyiscial quality of variable, and typically it comtains information about the behaviour or nature of the phenomenon. For instance, in an *RC* circuit the signal may represent the voltage across the capacitor or the current flowing in the resistor.

+++ {"slideshow": {"slide_type": "fragment"}}

* Mathematically, a signal is represented as a function of an independent variable, $t$. 

+++ {"slideshow": {"slide_type": "fragment"}}

* Usually $t$ represents time.

+++ {"slideshow": {"slide_type": "fragment"}}

* Thus a signal is denoted by $x(t)$.

+++ {"slideshow": {"slide_type": "subslide"}}

## Continuous-Time and Discrete-Time Signals

+++ {"slideshow": {"slide_type": "fragment"}}

A signal $x(t)$ is a *continuous-time* (CT) signal if $t$ is a continuous variable. For an example of a continuous-time signal, please see {ref}`ct-signal`.

+++ {"slideshow": {"slide_type": "fragment"}}

If $t$ is a discrete variable&mdash;that is, $x(t)$ is defined at discrete times&mdash;then $x(t)$ is a *discrete-time* (DT) signal. For an example of a discrete-time signal, please see {ref}`tt-signal`.

+++ {"slideshow": {"slide_type": "notes"}}

Since a discrete-time signal is defined at discrete times, a discrete-time is often defined as a *sequence* of numbers, donated by $x[n]$, where $n$ is an integer (mathematically: $n \in \mathbb{Z}$).

+++ {"slideshow": {"slide_type": "subslide"}}

:::{figure-md} ct-signal
<img src="./pictures/ct-signal.png" alt="Graphical representation of a continuous-time signal.">

Graphical representation of a continuous-time signal
:::

+++ {"slideshow": {"slide_type": "subslide"}}

:::{figure-md} dt-signal
<img src="./pictures/dt-signal.png" alt="Graphical representation of a discrete-time signal.">

Graphical representation of a discrete-time signal
:::

+++ {"slideshow": {"slide_type": "notes"}}

Because discrete-time signals are defined as sequences, it is easy to define and plot a sequence in MATLAB. For example, to redraw Fig. {ref}`dt-signal`, execute the following code.

```{code-cell}
---
slideshow:
  slide_type: notes
---
n = -5:6;
xn = [0,0,1,2,2,1,0,1,0,2,0,0];
stem(n,xn),title('Graphical representation of a discrete-time signal'),xlabel('n'),ylabel('x[n]')
```

+++ {"slideshow": {"slide_type": "subslide"}}

## Analogue and Digital Signals

+++ {"slideshow": {"slide_type": "subslide"}}

## Real and Complex Signals

+++ {"slideshow": {"slide_type": "subslide"}}

## Deterministic and Random Signals

+++ {"slideshow": {"slide_type": "subslide"}}

## Even and Odd Signals

+++ {"slideshow": {"slide_type": "subslide"}}

## Energy and Power Signals
