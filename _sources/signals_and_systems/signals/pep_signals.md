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

# Periodic, Energy and Power Signals

We continue with our survey of [Signals and Classification of Signals](index.md) by looking at {ref}`p_n_np` and {ref}`e_n_p`Periodic Signals 

This section is based on Section 1.2 of {cite}`schaum`.

+++ {"slideshow": {"slide_type": "slide"}}

(p_n_np)=
## Periodic and Nonperiodic Signals

+++ {"slideshow": {"slide_type": "subslide"}}

:::{figure-md} periodic-signal
<img src="./pictures/periodic.png" alt="An example of a periodic signal." width="75%">

An example of a periodic signal.
:::

+++ {"slideshow": {"slide_type": "subslide"}}

We can use the periodicity to synthesize a periodic signal such as that shown in Fig. {numref}`periodic-signal`.

+++ {"slideshow": {"slide_type": "fragment"}}

Let's first define the signal over one period. We will use MATLAB and the symbolic toolbox for this example:

+++ {"slideshow": {"slide_type": "fragment"}}

Let one period of periodic signal be defined by

$$x\left(t\right)=\left\lbrace \begin{array}{ll}
t & 0\le t\le 1\\
0 & \mathrm{otherwise}
\end{array}\right.$$

+++ {"slideshow": {"slide_type": "fragment"}}

We can use the Heaviside function (unit step) (MATLAB function `heaviside`: see {ref}`heaviside`) to sythesise this signal.

```{code-cell}
---
slideshow:
  slide_type: subslide
---
syms t
T = 1; % period of periodic signal
x(t) = t*(heaviside(t)-heaviside(t-T));
fplot(x(t)),ylim([0 2]),grid,title('A Single period of x(t)')
```

+++ {"slideshow": {"slide_type": "slide"}}

Now we use a loop and the definition of periodic function to repeat this signal multiple times

```{code-cell}
---
slideshow:
  slide_type: fragment
---
periodic_signal = 0;
for n = -5:5
    periodic_signal = periodic_signal + x(t + n*T);
end
periodic_signal
```

+++ {"slideshow": {"slide_type": "subslide"}}

Now we plot the result

```{code-cell}
---
slideshow:
  slide_type: fragment
---
fplot(periodic_signal,'g-',"LineWidth",2),...
    grid,ylabel('x(t)'),xlabel('t'),title('T = 1')
xlim([-3.00 3.00])
ylim([0.00 2.00])
```

+++ {"slideshow": {"slide_type": "slide"}}

(e_n_p)=
## Energy and Power Signals

+++ {"slideshow": {"slide_type": "slide"}}

## Examples

1). A continuous-time signal $x(t)$ is shown in Fig. {numref}`example1`. 

:::{figure-md} example1
<img src="pictures/example1.png" alt="The signal for example 1" width="60%">

The signal for example 1
:::

+++ {"slideshow": {"slide_type": "subslide"}}

Sketch and label each of the following signals.

a). $x(t-2)$;

+++ {"slideshow": {"slide_type": "fragment"}}

b). $x(2t)$;

+++ {"slideshow": {"slide_type": "fragment"}}

c). $x(2/t)$;

+++ {"slideshow": {"slide_type": "fragment"}}

d). $x(-t)$.

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 1.1 in {cite}`schaum`

+++ {"slideshow": {"slide_type": "subslide"}}

2). Given the continuous-time signal specified by

$$x\left(t\right)=\left\lbrace \begin{array}{ll}
1-\left|t\right| & -1\le t\le 1\\
0 & \mathrm{otherwise}
\end{array}\right.$$

determine the discrete-time sequence obtained by uniform sampling of $x(t)$ with a sampling intervale of

+++ {"slideshow": {"slide_type": "fragment"}}

a). 0.25 s

+++ {"slideshow": {"slide_type": "fragment"}}

b). 0.5 s, and

+++ {"slideshow": {"slide_type": "fragment"}}

c). 1 s.

+++ {"slideshow": {"slide_type": "subslide"}}

For the answer, refer to the lecture recording or see solved problem 1.3 in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

3). Sketch and label the even and odd components of the signals shown in Fig. {numref}`example3`.


:::{figure-md} example3
<img src="pictures/example3.png" alt="Signals for Example 3." width="75%">

Signals for Example 3.
:::

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 1.5 in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

4). Find the odd and even components of $x(t) = e^{jt}$.

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 1.6 in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

5). Show that the product of two even signals or of two odd signals is an even signal and that the product of an even signal and an odd signal is an odd signal.

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 1.7 in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

6). Show that 

a). If $x(t)$ is even 

$$\int_{-a}^{a} x(t)\, dt = 2 \int_0^a x(t)\, dt.$$

+++ {"slideshow": {"slide_type": "fragment"}}

b). If $x(t)$ is odd 

$$x(0) = 0$$

$$\int_{-a}^{a} x(t)\, dt = 0.$$

```{code-cell}

```

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 1.8 in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "notes"}}

## Summary

In this lecture we have started our look at signals and the classification of signals. 

In particular we have looked at

* {ref}`ct_n_dt`
* {ref}`a_n_d`
* {ref}`r_n_c`
* {ref}`det_n_rand`
* {ref}`even_n_odd`

+++ {"slideshow": {"slide_type": "notes"}}

## Next Time

* {ref}`p_n_np`
* {ref}`e_n_p`
