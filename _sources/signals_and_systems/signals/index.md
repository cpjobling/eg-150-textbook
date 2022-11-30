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

If $t$ is a discrete variable&mdash;that is, $x(t)$ is defined at discrete times&mdash;then $x(t)$ is a *discrete-time* (DT) signal. For an example of a discrete-time signal, please see {ref}`dt-signal`.

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

### More on discrete-time signals

A discrete-time signal $x[n]$ may represent a phenomenon for which the independent variable is inherently discrete: e.g. daily stock market average prices.

+++ {"slideshow": {"slide_type": "fragment"}}

E.g. [FTSE 100](https://www.londonstockexchange.com/indices/ftse-100) 

:::{figure-md} ftse
<img src="pictures/Chart_FTSE_100.png" alt="An example of discrete data from the FTSE 100.">

An example of discrete data&mdash;the FTSE 100. Year from Dec. 2021 to Novemver 2022. (c) London Stock Exchange.
:::



+++ {"slideshow": {"slide_type": "subslide"}}

### Sampled data

In electronic engineering, we mostly use discrete-time signals to represent the *sampling* of continuous-time signals.

+++ {"slideshow": {"slide_type": "fragment"}}

For example, a discrete-time signal $x[n]$ may be obtained by *sampling* a continuous-time signal $x(t)$ such as

$$x(t_0), x(t_1), x(t_2),\ldots,x(t_n),\ldots$$

+++ {"slideshow": {"slide_type": "fragment"}}

or in a shorter form as

$$x[0], x[1], x[2],\ldots,x[n],\ldots$$

$$x_0,x_1, x_2,\ldots,x_n,\ldots$$

+++ {"slideshow": {"slide_type": "fragment"}}

where

$$x[n]_n = x[n] = x(t_n)$$

+++ {"slideshow": {"slide_type": "fragment"}}

The $x_n$'s are called *samples* and the time interval between them is called the *sampling interval*.

+++ {"slideshow": {"slide_type": "subslide"}}

### Uniform sampling

When the sampling intervals are equal (uniform sampling), then

$$x_n = x[n] = x(nT_s)$$

where the constant $T_s$ is the sampling interval.

+++ {"slideshow": {"slide_type": "subslide"}}

There is much more about discrete-time signals in Chapter 1 of {cite}`schaum` but we will leave it here for now. 

We will return to the study of discrete-time signals and discrete-time systems in **EG-247 Signals and Systems** next year.

+++ {"slideshow": {"slide_type": "slide"}}

## Analogue and Digital Signals

If a continuous-time signal $x(t)$ can take on any value in the continuous interval $(a,b)$, where $a$ may be $-\infty$ and $b$ may be $+\infty$, then the continuous-time signal $x(t)$ is called an *analogue* signal.

+++ {"slideshow": {"slide_type": "fragment"}}

If a discrete-time signal $x[n]$ can take on only a finite number of distinct values, then we call this signal a *digital signal*

+++ {"slideshow": {"slide_type": "fragment"}}

In modern electronics, most physical phenomena which we wish to deal are represented by analogue signals. But more often than not, we will process such data by sampling the signals and converting them into digital signals.

+++ {"slideshow": {"slide_type": "subslide"}}

## Real and Complex Signals

+++ {"slideshow": {"slide_type": "subslide"}}

## Deterministic and Random Signals

+++ {"slideshow": {"slide_type": "subslide"}}

## Even and Odd Signals

+++ {"slideshow": {"slide_type": "subslide"}}

## Energy and Power Signals
