---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.16.7
kernelspec:
  display_name: MATLAB Kernel
  language: matlab
  name: jupyter_matlab_kernel
---

+++ {"slideshow": {"slide_type": "slide"}}

(unit2.2)=
# Unit 2.2: Periodic, Energy and Power Signals

We continue with our survey of [Signals and Classification of Signals](index.md) by looking at {ref}`p_n_np` and {ref}`e_n_p`.

This section is based on Section 1.2 of {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

Follow along at [cpjobling.github.io/eg-150-textbook/signals_and_systems/signals/pep_signals](https://cpjobling.github.io/eg-150-textbook/signals_and_systems/signals/pep_signals)

![QR Code](pictures/qrcode_unit2.2.png)

+++ {"slideshow": {"slide_type": "slide"}}

(p_n_np)=
## Periodic and Nonperiodic Signals

+++ {"slideshow": {"slide_type": "fragment"}}

(periodic_signals)=
### Periodic signals

A continuous-time signal $x(t)$ is said to be *periodic* with *period* $T$ if there is a positive nonzero value of $T$ for which

$$x(t + T) = x(t)\;\mathrm{all}\;t$$

An example of such a signal is given in {numref}`periodic-signal`.

+++ {"slideshow": {"slide_type": "subslide"}}

:::{figure-md} periodic-signal
<img src="./pictures/periodic.png" alt="An example of a periodic signal." width="75%">

An example of a periodic signal.
:::

+++ {"slideshow": {"slide_type": "subslide"}}

We can use the periodicity to synthesize a periodic signal such as that shown in {numref}`periodic-signal`.

+++ {"slideshow": {"slide_type": "fragment"}}

Let's first define the signal over one period. We will use MATLAB and the *symbolic math toolbox* for this example:

+++ {"slideshow": {"slide_type": "fragment"}}

Let one period of the periodic signal be defined by

$$x\left(t\right)=\left\lbrace \begin{array}{ll}
t & 0\le t\le 1\\
0 & \mathrm{otherwise}
\end{array}\right.$$

+++ {"slideshow": {"slide_type": "subslide"}}

We can use the Heaviside function (unit step) (MATLAB function `heaviside`: see {ref}`heaviside`) to sythesise this signal.

+++ {"slideshow": {"slide_type": "fragment"}}

Define a $t$ as a *symbolic variable* `t`

```{code-cell}
---
slideshow:
  slide_type: fragment
---
syms t
```

+++ {"slideshow": {"slide_type": "fragment"}}

Define the period $T$ of the periodic signal (you might want to play with this value)

```{code-cell}
---
slideshow:
  slide_type: fragment
---
T = 1; % period of periodic signal
```

+++ {"slideshow": {"slide_type": "subslide"}}

Now define the signal using the *Heaviside* function to limit the range of the signal.

```{code-cell}
---
slideshow:
  slide_type: fragment
---
x(t) = t * (heaviside(t) - heaviside(t-T));
```

+++ {"slideshow": {"slide_type": "subslide"}}

Now plot one period of the signal $x(t)$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
fplot(x(t)),ylim([0 1.2]),grid,title('A Single period of x(t)'),xlabel('t')
```

+++ {"slideshow": {"slide_type": "subslide"}}

One period earlier:

$$x(t + T)$$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
signal1 = x(t + T)
```

```{code-cell}
---
slideshow:
  slide_type: subslide
---
fplot(signal1),ylim([0 1.2]),grid,title('A Single period of x(t+T)')
```

+++ {"slideshow": {"slide_type": "subslide"}}

Two periods later:

$$x(t - 2T)$$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
signal2 = x(t-2*T)
```

```{code-cell}
---
slideshow:
  slide_type: subslide
---
fplot(signal2),ylim([0 1.2]),grid,title('A Single period of x(t)')
```

+++ {"slideshow": {"slide_type": "subslide"}}

It follows that

$$x(t + mT) = x(t)$$

for all $t$ and any integer $m$.

+++ {"slideshow": {"slide_type": "subslide"}}

Now we use a loop and the definition of periodic function to repeat this signal multiple times

```{code-cell}
---
slideshow:
  slide_type: fragment
---
periodic_signal = 0;
for m = 5:-1:-5
    periodic_signal = periodic_signal + x(t + m*T);
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
ylim([0 1.2])
```

+++ {"slideshow": {"slide_type": "slide"}}

(fundemental_period)=
### Fundamental period

The *fundamental period* $T_0$ of $x(t)$ is the smallest value of $T$ for which $x(t + mT) = x(t)$ holds.

+++ {"slideshow": {"slide_type": "notes"}}

For the previous example this was $T_0=1$.

+++ {"slideshow": {"slide_type": "subslide"}}

(dc_signal)=
### DC signals
Note that the definition of the *fundamental period*  does not hold for a constant signal $x(t)$ (known as a DC signal).

+++ {"slideshow": {"slide_type": "fragment"}}

For a constant signal $x(t) = c$ the fundamental period is undefined since $x(t)$ is periodic for any choice of $T$ (and so there is no smallest postive value). See {numref}`fig:dc_signal`.

+++ {"slideshow": {"slide_type": "subslide"}}

:::{figure-md} fig:dc_signal
<img src="pictures/dc_signal.png" alt="A DC signal" width="75%">

A DC signal
:::

+++ {"slideshow": {"slide_type": "notes"}}

```{note}
   Note that the sum of two continuous time signals may not be periodic (Example {ref}`ex2.1`)
```

+++ {"slideshow": {"slide_type": "subslide"}}

(nonperiodic_signals)=
### Nonperiodic signals

Any continuous-time signal which is not periodic is called a *nonperiodic* (or *aperiodic*) signal. For example see {numref}`aperiodic_signal`

+++ {"slideshow": {"slide_type": "subslide"}}

:::{figure-md} aperiodic_signal
<img src="pictures/aperiodic_signal.png" alt="A nonperiodic signal" width="50%">

A nonperiodic signal
:::

+++ {"slideshow": {"slide_type": "slide"}}

(e_n_p)=
## Energy and Power Signals

Consider $v(t)$ to be the voltage across a resistor $R$ producing a current $i(t)$. ({numref}`resistor_circuit`)

+++ {"slideshow": {"slide_type": "subslide"}}

:::{figure-md} resistor_circuit
<img src="pictures/res_circuit.png" alt="A simple resistor circuit." width="40%">

A simple resistor circuit.
:::

+++ {"slideshow": {"slide_type": "subslide"}}

The instantaneous power $p(t)$ per ohm is defined as

$$p(t) = \frac{v(t)i(t)}{R} = i(t)^2$$

+++ {"slideshow": {"slide_type": "fragment"}}

Total energy $E$ and average power $P$ on a per-ohm basis are

+++ {"slideshow": {"slide_type": "fragment"}}

$$E = \int_{-\infty}^{\infty}i(t)^2\,dt\quad\mathrm{joules}$$

+++ {"slideshow": {"slide_type": "fragment"}}

$$P = \lim_{T\to \infty}\frac{1}{T}\int_{-T/2}^{T/2}i(t)^2\;dt\quad\mathrm{watts}$$

+++ {"slideshow": {"slide_type": "subslide"}}

(normalised_energy_content_of_a_signal)=
### Normalised energy content of a signal

+++ {"slideshow": {"slide_type": "fragment"}}

For an arbitrary continuous-time signal $x(t)$, the *normalised energy content* $E$ of $x(t)$ is defined as

$$E = \int_{-\infty}^{\infty}\left|x(t)\right|^2\,dt\quad\mathrm{J}$$

+++ {"slideshow": {"slide_type": "subslide"}}

(normalised_average_power_of_a_signal)=
### Normalised average power of a signal

+++ {"slideshow": {"slide_type": "fragment"}}

The *normalised average power* $P$ of $x(t)$ is defined as

$$P = \lim_{T\to \infty}\frac{1}{T}\int_{-T/2}^{T/2}\left|x(t)\right|^2\;dt\quad\mathrm{W}$$

+++ {"slideshow": {"slide_type": "subslide"}}

(energy_and_power_signals)=
### Energy and power signals
Based on the previous definitions, the following classes of signals can be defined:

+++ {"slideshow": {"slide_type": "fragment"}}

* $x(t)$ is said to be an *energy signal* if and only if $0 < E < \infty$, and so $P = 0$.

+++ {"slideshow": {"slide_type": "fragment"}}

* $x(t)$ is said to be an *power signal* if and only if $0 < P < \infty$, thus implying that $E = \infty$.

+++ {"slideshow": {"slide_type": "fragment"}}

* Signals that satisfy neither property are referred to as *neither* energy signals *nor* power signals.

+++ {"slideshow": {"slide_type": "notes"}}

Note that a periodic signal is a power signal if its energy content per period is finite, and then the average power of this signal need only be calulated over a period ({ref}`ex:1.18`).

+++ {"slideshow": {"slide_type": "slide"}}

(other_measures_of_signal_size)=
## Other Measures of Signal Size

There are other measures of signal size that are used:

+++ {"slideshow": {"slide_type": "subslide"}}

### Mean value

$$M_x = \lim_{T\to \infty}\frac{1}{T}\int_{-T/2}^{T/2}x(t)\,dt$$

+++ {"slideshow": {"slide_type": "fragment"}}

For periodic signals with fundamental period $T_0$

$$M_x = \frac{1}{T_0}\int_{-T_0/2}^{T_0/2}x(t)\,dt$$

+++ {"slideshow": {"slide_type": "fragment"}}

The mean value is also known as the *dc value*.

+++ {"slideshow": {"slide_type": "notes"}}

**Observations**

* the mean value corresponds to the arithmetic average

* the signal $x(t) - M_x$ has zero mean

+++ {"slideshow": {"slide_type": "subslide"}}

### Measures of spread

+++ {"slideshow": {"slide_type": "fragment"}}

#### Root-mean square (RMS)

$$\mathrm{RMS}_x = \sqrt{P}$$

+++ {"slideshow": {"slide_type": "fragment"}}

E.g. the power of $x(t) = A\sin\left(\omega t + \theta\right)$ is $A^2/2$ hence its RMS value is $A/\sqrt{2}$.

+++ {"slideshow": {"slide_type": "fragment"}}

#### Peak value

$$\left|x\right|_\mathrm{peak} = \max_t \left|x(t)\right|$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Crest factor (CF)

$$\mathrm{CF}_x = \frac{\left|x\right|_\mathrm{peak}}{\mathrm{RMS}_x}\ge 1$$

+++ {"slideshow": {"slide_type": "fragment"}}

#### Peak-to-average power ratio (PAPR)

$$\mathrm{PAPR}_x = \frac{\left|x\right|_\mathrm{peak}^2}{P}$$

+++ {"slideshow": {"slide_type": "notes"}}

**Observations**

* CF and PAPR measure the dispersion of a signal about its average power.

* To express CF or PAPR we often use decibels (dB). To obtain a measure of the quantity $y$ in dB use $20\log_{10}(y)$.

+++ {"slideshow": {"slide_type": "slide"}}

(worked_examples_2)=
## Exercises 2

+++ {"slideshow": {"slide_type": "fragment"}}

(ex2.1)=
### Example 2.1: Sum of two periodic signals

Let $x_1(t)$ and $x_2(t)$ be periodic signals with fundamental periods $T_1$ and $T_2$ respectively. Under which conditions is the sum $x(t) = x_1(t) + x_2(t)$ periodic, and what is the fundamental period of $x(t)$ if it is periodic?

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 1.14 in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex2.2)=
### Exercise 2.2: Periodic signals

`````{admonition} MATLAB Example
:class: tip
We will solve this example by hand and then give the solution in the MATLAB lab.
`````

+++ {"slideshow": {"slide_type": "fragment"}}

Determine whether or not each of the following signals is periodic. If a signal is periodic, determine its fundamental period.

a). $x(t)=\cos\left(t + \frac{\pi}{4}\right)$;

+++ {"slideshow": {"slide_type": "fragment"}}

b). $x(t)=\sin\frac{2\pi}{3}t$;

+++ {"slideshow": {"slide_type": "fragment"}}

c). $x(t)=\cos\frac{\pi}{3}t+\sin\frac{\pi}{4}t$;

+++ {"slideshow": {"slide_type": "fragment"}}

d). $x(t)=\cos t + \sin\sqrt{2}t$;

+++ {"slideshow": {"slide_type": "fragment"}}

e). $x(t)=\sin^2t$;

+++ {"slideshow": {"slide_type": "fragment"}}

f). $x(t)=e^{j\left[(\pi/2)t-1\right]}$;

+++ {"slideshow": {"slide_type": "notes"}}

For the answers, refer to the lecture recording or see solved problem 1.16 in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex2.3)=
### Exercise 2.3: Integral properties of periodic signals

Show that if $x(t + T) = x(t)$, then

$$\int_\alpha^\beta x(t)\,dt=\int_{\alpha+T}^{\beta+T} x(t)\,dt$$

$$\int_0^T x(t)\,dt=\int_{a}^{a+T} x(t)\,dt$$

for any real $\alpha$, $\beta$ and $a$.

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 1.17 in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex2.4)=
### Exercise 2.4: Power in a periodic signal

Show that if $x(t)$ is periodic with fundamental period $T_0$, then the normalized average power $P$ of $x(t)$ defined by

$$P = \lim_{T\to \infty}\frac{1}{T}\int_{-T/2}^{T/2}\left|x(t)\right|^2\;dt$$

is the same as the average power $x(t)$ over any interval of length $T_0$, that is,

$$P = \frac{1}{T_0}\int_{0}^{T_0}\left|x(t)\right|^2\;dt$$

+++ {"slideshow": {"slide_type": "notes"}}

For the answer, refer to the lecture recording or see solved problem 1.18 in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex2.5)=
### Exercise 2.5: Power and energy signals

`````{admonition} MATLAB Example
:class: tip
We will solve this example by hand and then give the solution in the MATLAB lab.
`````

+++ {"slideshow": {"slide_type": "fragment"}}

Determine whether the following signals are energy signals, power signals, or neither.

+++ {"slideshow": {"slide_type": "fragment"}}

a). $x(t)=e^{-at}u_0(t)$, $a > 0$;

+++ {"slideshow": {"slide_type": "fragment"}}

b). $x(t)=A\cos\left(\omega_0 t + \theta\right)$

+++ {"slideshow": {"slide_type": "fragment"}}

c). $x(t)=t u_0(t)$

+++ {"slideshow": {"slide_type": "subslide"}}

Note $u_0(t)$ is the unit step (or Heaviside) function formally introduced in the next lecture. For the answer, refer to the lecture recording or see solved problem 1.20 in {cite}`schaum`.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex2.6)=
### Exercise 2.6: Power in domestic mains electricty

Domestic mains power in the UK is delivered as a sinusoidal signal $x(t)=A\cos(\omega_0 t + \theta)$ with frequency of $50\mathrm{Hz}$ and RMS value of $240\mathrm{V}$. 

Calculate the fundamental period $T_0$, fundamental angular frequency $\omega_0$, average power $P$, peak voltage $A = x_\mathrm{peak}$, crest factor (CF) and peak-to-average power ratio (PAPR) of the power signal provided to the home. 

Express CF and PAPR in dB.

+++ {"slideshow": {"slide_type": "notes"}}

## Summary

In this lecture we completed our look at signals and the classification of signals. 

In particular we have looked at

* {ref}`p_n_np` 
* {ref}`e_n_p` of a signal $x(t)$
* {ref}`other_measures_of_signal_size`

(unit2.2:takeaways)=
### Unit 2.2: Take aways

* A signal is periodic, with period $T$ is $x(t + T) = x(t)\;\mathrm{all}\;t$
* Signal energy for a signal $x(t)$:

$$E_x = \int_{-\infty}^{\infty}\left|x(t)\right|^2\,dt\quad\mathrm{J}$$
        
* Signal power for a signal $x(t)$:
  
$$P_x = \lim_{T\to \infty}\frac{1}{T}\int_{-T/2}^{T/2}\left|x(t)\right|^2\;dt\quad\mathrm{W}$$
                
* $x(t)$ is said to be an *energy signal* if and only if $0 < E < \infty$, and so $P = 0$.
* $x(t)$ is said to be an *power signal* if and only if $0 < P < \infty$, thus implying that $E = \infty$.
* Signals that satisfy neither property are referred to as neither energy signals nor power signals.
* Signal mean (*average* or *DC value*):
  
$$M_x = \lim_{T\to \infty}\frac{1}{T}\int_{-T/2}^{T/2}x(t)\,dt.\quad\mathrm{For\, a\, periodic\, signal}\;M_x = \frac{1}{T_0}\int_{-T_0/2}^{T_0/2}x(t)\,dt$$
            
* Root mean square (RMS): $\sqrt{P_x}$;
* Peak value: $\left|x\right|_\mathrm{peak} = \max_t \left|x(t)\right|$;
* Crest factor:
  
$$\mathrm{CF}_x = \frac{\left|x\right|_\mathrm{peak}}{\mathrm{RMS}_x}\ge 1$$
        
* Peak-to-average power ratio (PAPR):

$$\mathrm{PAPR}_x = \frac{\left|x\right|_\mathrm{peak}^2}{P}$$
        
* Value of $y$ in decibel (dB) is $20\log_{10} y$.

+++ {"slideshow": {"slide_type": "notes"}}

## Next Time

{ref}`elementary_signals`

* {ref}`es:intro`
* {ref}`heaviside`
* {ref}`es:simple_signal_ops`
* {ref}`es:synthesis`
* {ref}`es:ramp`
* {ref}`es:dirac_delta`
* {ref}`es:unit_impulse`
* {ref}`es:delta_props`

+++ {"slideshow": {"slide_type": "notes"}}

## References

```{bibliography}
:filter: docname in docnames
```
