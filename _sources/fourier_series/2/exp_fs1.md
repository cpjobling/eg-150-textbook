---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.14.4
kernelspec:
  display_name: Matlab
  language: matlab
  name: matlab
---

+++ {"slideshow": {"slide_type": "slide"}}

(unit5.2)=
# Unit 5.2: Exponential Fourier Series

The preparatory reading for this section is [Chapter 7](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=3384197&ppg=213) of  {cite}`karris` and [Chapter 5](https://www.accessengineeringlibrary.com/content/book/9781260454246/toc-chapter/chapter5/section/section1) of {cite}`schaum`.

+++ {"slideshow": {"slide_type": "slide"}}

Follow along at [cpjobling.github.io/eg-150-textbook/fourier_series/2/exp_fs1](https://cpjobling.github.io/eg-150-textbook/fourier_series/2/exp_fs1)

![QR Code for this lecture](pictures/qrcode_fs2.png)

+++ {"slideshow": {"slide_type": "notes"}}

Trigonometric Fourier series uses integration of a periodic signal multiplied by sines and cosines at the fundamental and harmonic frequencies. If performed by hand, this can a painstaking process. Even with the simplifications made possible by exploiting waveform symmetries, there is still a need to integrate cosine and sine terms, be aware of and able to exploit the trigonometrc identities, and the properties of *orthogonal functions* before we can arrive at the simplified solutions. This is why I concentrated on the properties and left the computation to a computer.

However, by exploiting the exponential function $e^{at}$, we can derive a method for calculating the coefficients of the harmonics that is much easier to calculate by hand and convert into an algorithm that can be executed by computer. 

The result is called the *Exponential Fourier Series*.

+++ {"slideshow": {"slide_type": "slide"}}

## Agenda

* {ref}`fs2:expsignals`
* {ref}`fs2:exp_fs`
* {ref}`fs2:symmetry`
* {ref}`fs2:eg`
* {ref}`fs2:matlab`
* {ref}`examples17`

+++ {"slideshow": {"slide_type": "slide"}}

(fs2:expsignals)=
## Exponential Signals $x(t) = e^{at}$

* You should already be familiar with the exponential function $e^{at}$ because it appears in the solution of differential equations.

+++ {"slideshow": {"slide_type": "fragment"}}

* It is also a function that appears in the definition of the Laplace and inverse Laplace transform.

+++ {"slideshow": {"slide_type": "fragment"}}

* It pops up again and again in tables and properies of the Laplace transform.

+++ {"slideshow": {"slide_type": "subslide"}}

(fs2:a_real)=
### Case when $a$ is real.

When $a$ is real the signal $x(t) = e^{at}$ will take one of the three forms illustrated below:

```{code-cell}
---
slideshow:
  slide_type: subslide
---
%% The decaying exponential
t=linspace(-1,2,1000);
plot(t,exp(t),t,exp(0.*t),t,exp(-t)),...
    axis([-1,2,-1,8]),...
    title([texlabel('x(t) = e^{at}'),' -- a real']),...
    xlabel('t (s)'),...
    ylabel('x(t)'),...
    legend(texlabel('x(t) = e^t'),texlabel('x(t) = e^0'),texlabel('x(t)=e^{-t}')),...
    grid
```

+++ {"slideshow": {"slide_type": "notes"}}

You can regenerate this image generated with this MATLAB script: [expon.m](https://cpjobling.github.io/eg-150-textbook/fourier_series/matlab/expon.m).

+++ {"slideshow": {"slide_type": "subslide"}}

* When $a < 0$ the response is a decaying exponential (yellow line in plot)

+++ {"slideshow": {"slide_type": "fragment"}}

* When $a = 0$, $e^{at} = 1$ the response is a constant (DC) (red line in plot)

+++ {"slideshow": {"slide_type": "fragment"}}

* When $a > 0$ the response is an *unbounded* increasing exponential (blue line in plot)

+++ {"slideshow": {"slide_type": "subslide"}}

(fs2:a_imag)=
### Case when $a$ is imaginary

When $a = j\omega$ we have the periodic signal $x(t) = e^{j\omega t} = \cos\omega t + j\sin\omega t$ visualised in {numref}`fig:fs2:1`

+++ {"slideshow": {"slide_type": "subslide"}}

:::{figure-md} Fig:fs2:1
<img src="pictures/euler.png" alt="The periodic signal exp(jomega t)" width="80%">

The periodic signal $x(t) = e^{j\omega t}$
:::

+++ {"slideshow": {"slide_type": "notes"}}

This is the case that helps us simplify the computation of sinusoidal Fourier series.

It was [Leonhard Euler](https://en.wikipedia.org/wiki/Leonhard_Euler) who discovered the [formula](https://en.wikipedia.org/wiki/Euler%27s_formula) visualized above.

+++ {"slideshow": {"slide_type": "subslide"}}

(fs2:a_complex)=
### Case where $a$ is complex

In this case $a = \sigma + j\omega$ and

$$x(t) = e^{\left(\sigma + j\omega\right)t}$$

which can be written as

$$x(t) = e^{\sigma t}e^{j\omega t} = e^{\sigma t}\left(\cos\omega t+j\sin\omega t\right)$$ (eq:fs2:1)

This will be a periodic signal, the shape of which depends on the sign of $\sigma$.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Case where $\sigma < 0$

Let us visualize this with the help of MATLAB

```{code-cell}
syms t
sigma = -0.5; omega = 5;
xr(t) = exp(sigma*t)*cos(omega*t); % real part
xi(t) = exp(sigma*t)*sin(omega*t); % imaginary part
subplot(211)
fplot(xr(t),[-2,2]),grid,ylabel('Re x(t)'),xlabel('t')
hold on
fplot(exp(sigma*t),[-2,2],'LineStyle','--','Color','red')
hold off
subplot(212)
fplot(xi(t),[-2,2]),grid,ylabel('Im x(t) '),xlabel('t')
hold on
fplot(exp(sigma*t),[-2,2],'LineStyle','--','Color','red')
hold off
sgtitle('x(t) = exp(\sigma + j\omega t), \sigma < 0')
```

+++ {"slideshow": {"slide_type": "subslide"}}

#### Case where $\sigma > 0$

```{code-cell}
sigma = 0.5; omega = 5;
xr(t) = exp(sigma*t)*cos(omega*t); % real part
xi(t) = exp(sigma*t)*sin(omega*t); % imaginary part
subplot(211)
fplot(xr(t),[-2,2]),grid,ylabel('Re x(t)'),xlabel('t')
hold on
fplot(exp(sigma*t),[-2,2],'LineStyle','--','Color','red')
hold off
subplot(212)
fplot(xi(t),[-2,2]),grid,ylabel('Im x(t) '),xlabel('t')
hold on
fplot(exp(sigma*t),[-2,2],'LineStyle','--','Color','red')
hold off
sgtitle('x(t) = exp(\sigma + j\omega t), \sigma > 0')
```

+++ {"slideshow": {"slide_type": "notes"}}

Then signal $x(t)$ in Eq. {eq}`eq:fs2:1` is known as a general complex exponential signal whose real part $e^{\sigma t}\sin\omega t$ and imaginary part $e^{\sigma t}\sin \omega t$ are exponentially increasing ($σ > 0$) or decreasing ($σ < 0$) sinusoidal signals .

+++ {"slideshow": {"slide_type": "subslide"}}

#### Case where $\sigma = 0$

When $\sigma = 0$, $e^{\sigma t} = 1$ and the the signal is the {ref}`fs2:a_imag` already discussed.

+++ {"slideshow": {"slide_type": "notes"}}

### A note on poles and stability

The variable $s$ in the Laplace Transform 

$$\int_{0}^{\infty} f(t)e^{-st} dt$$

is a *complex exponential*.

The poles of a rational polynomial in $s$ will exhibit one of the properties discussed above. Therefore, for any system whose poles are known, we can reason about the likely response of the system. 

For stable systems, the real part of the pole will be negative so the response will be a linear combination of exponential delays or exponentially decaying sinusoids.

The overall response of a system will depend on the relative size of the real part of the real or complex poles and the frequency of the imaginary parts of the complex poles and is also influenced by the size of the partial fraction residues.

The combined behaviour of the poles have particular significance in the development of system stability theories and in control systems analysis and design. Look out for them in **EG-243 Control Systems**

+++ {"slideshow": {"slide_type": "subslide"}}

### Two Other Important Properties

By use of trig. identities, it is relatively straight forward to show that:

+++ {"slideshow": {"slide_type": "fragment"}}

$$\cos \omega t = \frac{e^{j\omega t} + e^{-j\omega t}}{2}$$ (eq:fs2:2)

+++ {"slideshow": {"slide_type": "fragment"}}

and 

$$\sin \omega t = \frac{e^{j\omega t} - e^{-j\omega t}}{j2}$$ (eq:fs2:3)

+++ {"slideshow": {"slide_type": "notes"}}

We can use this result to convert the *Trigonometric Fourier Series* into an *Exponential Fourier Series* which has only one integral term to solve per harmonic.

+++ {"slideshow": {"slide_type": "slide"}}

(fs2:exp_fs)=
## The Exponential Fourier Series

As [as stated in the notes on the Trigonometric Fourier Series](../1/trig_fseries) any periodic waveform $f(t)$ can be represented as

$$\begin{gathered}
  f(t) = \frac{1}{2}{a_0} + {a_1}\cos \Omega_0 t + {a_2}\cos 2\Omega_0 t +  \cdots  \\ 
   + {b_1}\sin \Omega_0 t + {b_2}\sin 2\Omega_0 t +  \cdots  \\ 
\end{gathered} $$ (ex:fs2:4)

+++ {"slideshow": {"slide_type": "subslide"}}

If we replace the $\cos$ and $\sin$ terms with their imaginary exponential equivalents:

$$\begin{gathered}
  f(t) = \frac{1}{2}{a_0} + {a_1}\left(\frac{e^{j\Omega_0 t} + e^{-j\Omega_0 t}}{2}\right) + {a_2}\left(\frac{e^{j2\Omega_0 t} + e^{-j2\Omega_0 t}}{2}\right) +  \cdots  \\ 
   + {b_1}\left(\frac{e^{j\Omega_0 t} - e^{-j\Omega_0 t}}{j2}\right) + {b_2}\left(\frac{e^{j2\Omega_0 t} - e^{-j2\Omega_0 t}}{j2}\right) +  \cdots  \\ 
\end{gathered} $$ (ex:fs2:5)

+++ {"slideshow": {"slide_type": "subslide"}}

### Grouping terms with same exponents

$$f(t) = \cdots + \left(\frac{a_2}{2}-\frac{b_2}{j2}\right)e^{-j2\Omega_0 t} + \left(\frac{a_1}{2}-\frac{b_1}{j2}\right)e^{-j\Omega_0 t} + \frac{1}{2}{a_0} + \left(\frac{a_1}{2}+\frac{b_1}{j2}\right)e^{j\Omega_0 t} + \left(\frac{a_2}{2}+\frac{b_2}{j2}\right)e^{j2\Omega_0 t} +\cdots $$ ((ex:fs2:5)

+++ {"slideshow": {"slide_type": "subslide"}}

### New coefficients

The terms in parentheses are usually denoted as

$$C_{-k} = \frac{1}{2}\left(a_k-\frac{b_k}{j}\right) = \frac{1}{2}\left(a_k+j b_k\right)$$ (ex:fs2:6)

$$C_{k} = \frac{1}{2}\left(a_k+\frac{b_k}{j}\right) = \frac{1}{2}\left(a_k-j b_k\right)$$ (ex:fs2:7)

$$C_0 = \frac{1}{2}a_0$$ (ex:fs2:8)

+++ {"slideshow": {"slide_type": "subslide"}}

The Exponential Fourier Series is

$$f(t) = \cdots + C_{-2}e^{-j2\Omega_0 t} + C_{-1}e^{-j\Omega_0 t} + C_0 + C_{1}e^{j\Omega_0 t} + C_{2}e^{j2\Omega_0 t} +\cdots $$

or more compactly

$$f(t) = \sum_{k=-n}^{n}C_{k}e^{jk \Omega_0  t}$$ (ex:fs2:9)

+++ {"slideshow": {"slide_type": "notes"}}

**Important**

The $C_k$ coefficents, except for $C_0$ are *complex* and appear in conjugate pairs so

$$C_{-k} = C_k^*$$ (ex:fs2:10)

+++ {"slideshow": {"slide_type": "subslide"}}

### Evaluation of the complex coefficients

The coefficients are obtained from the following expressions<sup>*</sup>:

$$C_k = \frac{1}{2\pi}\int_{0}^{2\pi}f(\Omega_0 t)e^{-jk(\Omega_0 t)}\,d(\Omega_0 t)$$ (ex:fs2:11)

or

$$C_k = \frac{1}{T}\int_{0}^{T}f(t)e^{-jk\Omega_0 t}\,dt$$ (ex:fs2:12)

+++ {"slideshow": {"slide_type": "notes"}}

These are much easier to derive and compute than the equivalent trigonemetric Fourier series coefficients. 


<sup>*</sup> The analysis that leads to this result is provided between pages [7-31 and 7-32](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?ppg=243&docID=3384197&tm=1518704101461) of the text book {cite}`karris`. It is not a difficult proof, but we are more interested in the result.

+++ {"slideshow": {"slide_type": "subslide"}}

### Trigonometric Fourier Series from Exponential Fourier Series

By substituting $C_{-k}$ and $C_{k}$ back into the original expansion

$$C_k+C_{-k} = \frac{1}{2}\left(a_k-jb_k + a_k+jb_k\right)$$

so

$$a_k = C_k + C_{-k}$$ (ex:fs2:13)

+++ {"slideshow": {"slide_type": "subslide"}}

Similarly

$$C_k-C_{-k} = \frac{1}{2}\left(a_k-jb_k - a_k-jb_k\right)$$

so

$$b_k = j\left(C_k - C_{-k}\right)$$ (ex:fs2:14)

Thus we can easily go back to the Trigonetric Fourier series if we want to.

+++ {"slideshow": {"slide_type": "slide"}}

(fs2:symmetry)=
## Symmetry in Exponential Fourier Series

Since the coefficients of the Exponential Fourier Series are complex numbers, we can use symmetry to determine the form of the coefficients and thereby simplify the computation of series for wave forms that have symmetry.

+++ {"slideshow": {"slide_type": "subslide"}}

### Even Functions

For even functions, all coefficients $C_k$ are real.

+++ {"slideshow": {"slide_type": "notes"}}

**Proof**

Recall 

$$C_{-k} = \frac{1}{2}\left(a_k-\frac{b_k}{j}\right) = \frac{1}{2}\left(a_k+jb_k\right)$$

and

$$C_k = \frac{1}{2}\left(a_k+\frac{b_k}{j}\right) = \frac{1}{2}\left(a_k-jb_k\right)$$

From knowledge of the trig. fourier series, even functions have no sine terms so the $b_k$ coefficients are 0. Therefore both $C_{-k}$ and $C_k$ are real.

+++ {"slideshow": {"slide_type": "subslide"}}

### Odd Functions

For odd functions, all coefficients $C_k$ are imaginary.

+++ {"slideshow": {"slide_type": "subslide"}}

By a similar argument, all odd functions have no cosine terms so the $a_k$ coefficients are 0. Therefore both $C_{-k}$ and $C_k$ are imaginary.

+++ {"slideshow": {"slide_type": "subslide"}}

### Half-wave symmetry

If there is *half-wave symmetry*, $C_k = 0$ for $k$ even.

For the proof see the notes.

+++ {"slideshow": {"slide_type": "notes"}}

**Proof**

From Trigonometric Fourier Series, if there is half-wave symmetry, all even harnonics are zero, thus both $a_k$ and $b_k$ are zero for $k$ even. Hence $C_{-k}$ and $C_k$ are also zero when $k$ is even.

+++ {"slideshow": {"slide_type": "subslide"}}

### No symmetry

If there is no symmetry the exponential Fourier series of $f(t)$ is complex.

+++ {"slideshow": {"slide_type": "subslide"}}

### Relation of $C_{-k}$ to $C_{k}$

$C_{-k} = C_{k}^*$ **always**

+++ {"slideshow": {"slide_type": "subslide"}}

(fs2:eg)=
## Computating the Exponential Fourier Series

Compute the exponential Fourier series (EFS) for the square wave shown in {numref}`fig:ex:17.1` assuming that $\omega = 1$

:::{figure-md} Fig:ex:17.1
<img src="pictures/sqw.png" alt="Squarewave with odd-symmetry" width="60%">

Squarewave with odd-symmetry
:::

+++ {"slideshow": {"slide_type": "subslide"}}

### Will be Solved in in Class

It will be shown that 

$${C_k \atop {k=\mathrm{even}}} =  0$$

$${C_k \atop {k=\mathrm{odd}}} =  \frac{2A}{j\pi k}$$


See {ref}`ex:17.1` and solution in {ref}`sol:17.1`.

+++ {"slideshow": {"slide_type": "notes"}}

### Exponential Fourier series for the square wave with odd symmetry

From the definition of the exponential Fourier series

$$f(t) = \cdots + C_{-2}e^{-j2\Omega_0 t} + C_{-1}e^{-j\Omega_0 t} + C_{0} + C_{1}e^{j\Omega_0 t} + C_{2}e^{j2\Omega_0 t} + \cdots$$

the *exponential Fourier series for the square wave with odd symmetry* is

$$f(t) = \frac{2A}{j\pi}\left(\cdots - \frac{1}{3}e^{-j3\Omega_0 t} - e^{-j\Omega_0 t} + e^{j\Omega_0 t} + \frac{1}{3}e^{j3\Omega_0 t} + \cdots\right) = \frac{2A}{j\pi}\sum_{k = \mathrm{odd}} \frac{1}{k}e^{jk\Omega_0 t}$$

+++ {"slideshow": {"slide_type": "notes"}}

Note sign change in first two terms. This is due to the fact that $C_{-k} = C_k^*$. 

E.g. since $C_3 = 2A/j3\pi$, $C_{-3} = C_3^* = -2A/j3\pi$

+++ {"slideshow": {"slide_type": "notes"}}

### Trig. Fourier Series from Exponential Fourier Series

Since

$$f(t) = \frac{2A}{j\pi}\left(\cdots - \frac{1}{3}e^{-j3\Omega_0 t} - e^{-j\Omega_0 t} + e^{j\Omega_0 t} + \frac{1}{3}e^{j3\Omega_0 t} + \cdots\right) $$

gathering terms at each harmonic frequency gives

$$\begin{eqnarray*}
f(t) &=& \frac{4A}{\pi}\left(\cdots + \left(\frac{e^{j\Omega_0 t} - e^{-j\Omega_0 t}}{2j}\right)  + \frac{1}{3}\left(\frac{e^{j3\Omega_0 t} - e^{-j3\Omega_0 t}}{2j}\right)  +  \cdots\right) \\
&=& \frac{4A}{\pi}\left(\sin \Omega_0 t + \frac{1}{3}\sin 3\Omega_0 t + \cdots\right)\\
&=& \frac{4A}{\pi} \sum_{k=\mathrm{odd}} \frac{1}{k}\sin k\Omega_0 t.\end{eqnarray*}$$

+++ {"slideshow": {"slide_type": "subslide"}}

(fs2:matlab)=
## Computing coefficients of Exponential Fourier Series in MATLAB

+++ {"slideshow": {"slide_type": "subslide"}}

Verify the result of the Example using MATLAB.

+++ {"slideshow": {"slide_type": "notes"}}

### Solution

Solution calculates the Exponential Fourier for a Square Wave with Odd Symmetry.: See [efs_sqw.m](https://cpjobling.github.io/eg-150-textbook/fourier_series/matlab/efs_sqw.m).

```{code-cell}
---
slideshow:
  slide_type: subslide
---
cd ../matlab
format compact
open efs_sqw
```

+++ {"slideshow": {"slide_type": "subslide"}}

Set up parameters

```{code-cell}
---
slideshow:
  slide_type: subslide
---
syms t A;

tau = 1;
T0 = 2*pi; % w = 2*pi*f -> t = 2*pi/omega
k_vec = [-5:5];
```

+++ {"slideshow": {"slide_type": "subslide"}}

Define f(t)

**IMPORTANT**: the signal definition must cover [0 to T0]

```{code-cell}
---
slideshow:
  slide_type: subslide
---
xt = A*(heaviside(t)-heaviside(t-T0/2)) - A*(heaviside(t-T0/2)-heaviside(t-T0));
```

+++ {"slideshow": {"slide_type": "subslide"}}

Compute EFS

```{code-cell}
---
slideshow:
  slide_type: subslide
---
[X, w] = FourierSeries(xt, T0, k_vec)
```

+++ {"slideshow": {"slide_type": "subslide"}}

Plot the numerical results from MATLAB calculation.

Convert symbolic to numeric result

```{code-cell}
---
slideshow:
  slide_type: subslide
---
Xw = subs(X,A,1);
```

+++ {"slideshow": {"slide_type": "subslide"}}

Plot

```{code-cell}
---
slideshow:
  slide_type: subslide
---
subplot(211)
stem(w,abs(Xw), 'o-');
title('Exponential Fourier Series for Square Waveform with Odd Symmetry')
xlabel('Hamonic frequencies: k\Omega_0 (rad/sec)');
ylabel('|c_k|');
subplot(212)
stem(w,angle(Xw), 'o-');
xlabel('Hamonic frequencies: k\Omega_0 (rad/sec)'); 
ylabel('\angle c_k [radians]');
```

+++ {"slideshow": {"slide_type": "slide"}}

(examples17)=
# Examples 17

+++ {"slideshow": {"slide_type": "subslide"}}

(ex:17.1)=
### Example 17.1: Some important values of $\omega t$

Give the following:
* $e^{j\omega t}$ when $\omega t = 0$
* $e^{j\omega t}$ when $\omega t = \pi/2$
* $e^{j\omega t}$ when $\omega t = \pi$
* $e^{j\omega t}$ when $\omega t = 3\pi/2$
* $e^{j\omega t}$ when $\omega t = 2\pi$

+++ {"slideshow": {"slide_type": "notes"}}

These are useful when simplifying expressions that result from integrating functions that involve the imaginary exponential.

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "slide"}}

(ex17.2)
## Example 17.2

Compute the Exponential Fourier Series for the square wave shown below in {numref}`fig:ex:17.1` that $\omega = 1$

+++ {"slideshow": {"slide_type": "subslide"}}

### Some questions for you

* Square wave is an [**odd/even/neither**] function?
* DC component is [**zero/non-zero**]?
* Square wave [**has/does not have**] half-wave symmetry?

+++ {"slideshow": {"slide_type": "subslide"}}

Hence

* $C_0 = $[**?**]
* Coefficients $C_k$ are [**real/imaginary/complex**]?
* Subscripts $k$ are [**odd only/even only/both odd and even**]?
* What is the integral that needs to be solved for $C_k$?

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">















</pre>

+++

Solve the problem
<pre style="border: 2px solid blue">
























</pre>

+++ {"slideshow": {"slide_type": "notes"}}

<sup>*</sup> You may want to verify that $C_0 = 0$ and 

$${C_k \atop {k=\mathrm{even}}} = 0.$$

+++ {"slideshow": {"slide_type": "notes"}}

## Summary

* {ref}`fs2:expsignals`
* {ref}`fs2:exp_fs`
* {ref}`fs2:symmetry`
* {ref}`fs2:eg`
* {ref}`fs2:matlab`
* {ref}`examples17`

### Take Aways

+++ {"slideshow": {"slide_type": "notes"}}

## Next Time

We move on to consider 

* {ref}`unit5.3`

## References

```{bibliography}
:filter: docname in docnames
```

+++ {"slideshow": {"slide_type": "notes"}}

## Homework

+++ {"slideshow": {"slide_type": "notes"}}

(solutions17)=
## Solutions to examples 17

+++ {"slideshow": {"slide_type": "notes"}}

(sol:17.1)=
### Solution to Example 17.1: Some important values of $\omega t$

* When $\omega t = 0$: $e^{j\omega t} = e^{j0} = 1$
* When $\omega t = \pi/2$: $e^{j\omega t} = e^{j\pi/2} = j$
* When $\omega t = \pi$: $e^{j\omega t} = e^{j\pi} = -1$
* When $\omega t = 3\pi/2$: $e^{j\omega t} = e^{j3\pi/2} = -j$
* When $\omega t = 2\pi$: $e^{j\omega t} = e^{j2\pi} = e^{j0}= 1$

It is also worth being aware that $n\omega t$, when $n$ is an integer, produces rotations that often map back to the simpler cases given above. For example see $e^{j2\pi}$ above.

+++ {"slideshow": {"slide_type": "notes"}}

(sol:17.1)=
### Solution to Example 17.2

* Square wave is an **odd** function!
* DC component is **zero**!
* Square wave **has** half-wave symmetry!

Hence

* $C_0 = 0$
* Coefficients $C_k$ are **imaginary**!
* Subscripts $k$ are **odd only**!
* What is the integral that needs to be solved for $C_k$?

$$C_k = \frac{1}{2\pi}\int_{0}^{2\pi} f(\Omega_0 t)e^{-jk(\Omega_0 t)}\, d(\Omega_0 t) = \frac{1}{2\pi}\left[\int_{0}^{\pi} Ae^{-jk(\Omega_0 t)}\, d(\Omega_0 t) + \int_{\pi}^{2\pi} (-A)e^{-jk(\Omega_0 t)}\, d(\Omega_0 t)\right]$$

+++ {"slideshow": {"slide_type": "notes"}}

### Computation of $C_k$

$$\frac{1}{2\pi}\left[\int_{0}^{\pi} Ae^{-jk(\Omega_0 t)}\, d(\Omega_0 t) + \int_{\pi}^{2\pi} (-A)e^{-jk(\Omega_0 t)}\, d(\Omega_0 t)\right] = \frac{1}{2\pi}\left[\left.\frac{A}{-jk}e^{-jk(\Omega_0 t)}\right|_0^\pi+\left.\frac{-A}{-jk}e^{-jk(\Omega_0 t)}\right|_\pi^{2\pi}\right]$$

$$ = \frac{1}{2\pi}\left[\frac{A}{-jk}\left(e^{-jk\pi} - 1\right)+\frac{A}{jk}\left(e^{-j2k \pi}-e^{-jk\pi}\right)\right] =
\frac{A}{2j\pi k}\left(1 - e^{-jk\pi}+ e^{-j2k \pi}-e^{-jk\pi}\right)$$

$$\frac{A}{2j\pi k}\left(e^{-j2k \pi} - 2e^{-jk\pi} -1 \right) = \frac{A}{2j\pi k}\left(e^{-jk\pi}-1\right)^2$$

For $k$ odd*, $e^{-jk\pi} = -1$. Therefore

$${C_k \atop {k=\mathrm{odd}}} = \frac{A}{2j\pi k}\left(e^{-jk\pi}-1\right)^2 = \frac{A}{2j\pi k}\left(-1-1\right)^2 = \frac{A}{2j\pi k}\left(-2\right)^2 = \frac{2A}{j\pi k}$$
