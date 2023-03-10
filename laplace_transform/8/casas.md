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

(unit4.8)=
# Unit 4.8: Computer-Aided Systems Analysis and Simulation

+++ {"slideshow": {"slide_type": "subslide"}}

Follow along at [cpjobling.github.io/eg-150-textbook/laplace_transform/8/casas](https://cpjobling.github.io/eg-150-textbook/laplace_transform/8/casas)

![QR Code for this lecture](pictures/qrcode_lap8.png)

+++ {"slideshow": {"slide_type": "notes"}}

## Agenda

We conclude our introduction to the applications of the Laplace transform by demonstrating the facilties provided by the *Control Systems Toolbox* and the simulation tool *Simulink*. We will repeat {ref}`ex:14.2` using these tools and we will conclude by exploring some of the problems you have studied in **EG-152 Analogue Design** hopefully confirming some of the results you have obbserved in that lab.

* {ref}`circ_tf`
* {ref}`matlab_tf`
* (ref}`simulink_tf`
* {ref}`examples15`

```{code-cell}
---
slideshow:
  slide_type: subslide
---
% Initialize MATLAB
clearvars
cd ../matlab 
pwd
format compact
```

+++ {"slideshow": {"slide_type": "slide"}}

(matlab_tf)=
## Defining Transfer Functions in MATLAB

There are two forms of polynomial representation in MATLAB. The most obvious is the **expanded polynomial** form where the numerator and denominator of a transfer function would be entered as two row vectors with the polynomial coefficients entered in the order of **descending** powers of $s$.

+++ {"slideshow": {"slide_type": "subslide"}}

For example, if:

$$G(s) = \frac{a(s)}{b(s)} = \frac{s^2 +2s+3}{s^3 +4s^2 +5s+6}$$ (eq:8.1)

+++ {"slideshow": {"slide_type": "fragment"}}

The numerator and denominator polynomials from Eq. {eq}`eg:8.1` are entered in MATLAB as

```{code-cell}
---
slideshow:
  slide_type: fragment
---
b = [1, 2, 3];    % s^2 + 2s + 3
a = [1, 4, 5, 6]; % s^3 + 4s^2 + 5s + 6
```

+++ {"slideshow": {"slide_type": "subslide"}}

Missing coefficients must be entered as zero: so $q(s) = s^2 + 2s$ and $r(s) = s^4 + s^2 + 1$ are entered as

```{code-cell}
---
slideshow:
  slide_type: subslide
---
q = [1, 2, 0];
r = [1, 0, 2, 0, 1];
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Defining polynomials symbolically

We have already seen that we can use the symbolic math toolbox to define polynomials 
symbolically.

```{code-cell}
---
slideshow:
  slide_type: fragment
---
syms s
```

+++ {"slideshow": {"slide_type": "fragment"}}

Define a rational polynomial

```{code-cell}
---
slideshow:
  slide_type: fragment
---
G(s) = (s^2 + 2*s + 3)/(s^3 + 4*s^2 + 5*s + 6)
```

+++ {"slideshow": {"slide_type": "subslide"}}

Extract numerator and denominator polynomials

```{code-cell}
---
slideshow:
  slide_type: fragment
---
[Num,Den] = numden(G(s))
```

+++ {"slideshow": {"slide_type": "subslide"}}

Providing that the  the coefficients are numeric, we can convert back and forth between symbolic polynomials and numeric polynomials using the functions `sym2poly` and `poly2sym`:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
nNum = sym2poly(Num), nDen = sym2poly(Den)
```

+++ {"slideshow": {"slide_type": "subslide"}}

Convert from numerical polynomial to symbolic. Second argument is polynomial variable. The default is x.

```{code-cell}
---
slideshow:
  slide_type: fragment
---
poly2sym(r,s)
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Polynomials - Factorised form

If you know the *poles* amd *zeros* of a transfer function you can represent it in a factorized form.

$$G(s) = \frac{(s+1)(s+3)}{s(s+2)(s+4)}$$ (eq:8.2)

+++ {"slideshow": {"slide_type": "fragment"}}

The advantage of this formulation is that the zeros of the numerator and denominator polynomials are obvious by inspection. So it is often used in the preliminary analysis of the performance of a dynamic system.

+++ {"slideshow": {"slide_type": "fragment"}}

The poles of the transfer function Eq. {eq}`eq:8.2` are $s = 0,\,-1\,-4$ and the zeros are $s = -1,\,-3$

+++ {"slideshow": {"slide_type": "subslide"}}

In MATLAB, this form of transfer function is specified by a column vector of the zeros and a column vector of the poles:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
z = [-1; -3];
p = [0; -2; -4];
```

+++ {"slideshow": {"slide_type": "fragment"}}

A third parameter, the overall gain , completes the definition of the so called *pole-zero-gain* form of transfer function.

+++ {"slideshow": {"slide_type": "fragment"}}

In this case

```{code-cell}
---
slideshow:
  slide_type: fragment
---
K = 1;
```

+++ {"slideshow": {"slide_type": "subslide"}}

### The Linear Time Invariant (LTI) System Object

A few years ago, the Mathworks introduced a new data object for the creation and manipulation of system transfer functions.

+++ {"slideshow": {"slide_type": "fragment"}}

This object is called the *Linear Time Invariant (LTI) System Object*.

+++ {"slideshow": {"slide_type": "fragment"}}

It is used to gather the components of a transfer function into a single variable which can then easily be combined with other LTI system objects and passed to system analysis functions.

+++ {"slideshow": {"slide_type": "subslide"}}

To create a LTI system object representing the factored transfer function from Eq. {eq}`eq:8.2` the following command is issued:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
G = zpk(z,p,K)
```

+++ {"slideshow": {"slide_type": "subslide"}}

The expanded numerator and denominator form of the transfer function is readily obtained by using the *data extraction function* `tfdata`:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
[num,den]=tfdata(G,'v')
```

+++ {"slideshow": {"slide_type": "fragment"}}

LTI system objects can also be created from the expanded form of a transfer function directly:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
G2=tf(num,den)
```

+++ {"slideshow": {"slide_type": "subslide"}}

and the zeros and poles similarly extracted:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
[zeros,poles,gain]=zpkdata(G2,'v')
```

+++ {"slideshow": {"slide_type": "subslide"}}

LTI system objects can also be created from the expanded form of a transfer function directly:

```{code-cell}
G2=tf(num,den)
```

+++ {"slideshow": {"slide_type": "fragment"}}

and the zeros and poles similarly extracted:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
[zeros,poles,gain]=zpkdata(G2,'v')
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Setting LTI Properties

Numerous options are available to document the LTI system objects that you create. 

For example, suppose the transfer function `G` represents a servomechanism (discussed next year) with input `'Voltage'` and output `'Angular Position'` We can add this information to the LTI system as follows:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
set(G,'InputName','Voltage','OutputName','Angular Position')
```

+++ {"slideshow": {"slide_type": "subslide"}}

Such documentary information is probably best added when the LTI system object is created, for example as:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
G3=zpk(z,p,K,'InputName','Armature Voltage (V)',...
    'OutputName','Load Shaft Position (rad)',...
    'notes','An armature voltage controlled servomechanism')
```

+++ {"slideshow": {"slide_type": "subslide"}}

Once the LTI object has been documented, the documentation can be extracted using commands like:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
get(G3,'notes')
```

+++ {"slideshow": {"slide_type": "subslide"}}

One can also access the documentation using an *object reference* notation

```{code-cell}
---
slideshow:
  slide_type: fragment
---
in=G3.InputName, out=G3.OutputName
```

+++ {"slideshow": {"slide_type": "subslide"}}

All the documentation available on an LTI system object may be extracted with a single command:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
get(G3)
```

+++ {"slideshow": {"slide_type": "subslide"}}

### System Transformations

MATLAB supports the easy transformation of LTI system objects between expanded and factored forms. For example to convert a transfer function from expanded form to pole-zero-gain form the following command is used:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
G4 = zpk(G2)
```

+++ {"slideshow": {"slide_type": "subslide"}}

To convert from zero-pole-gain form to expanded form we use the function `tf`

```{code-cell}
---
slideshow:
  slide_type: fragment
---
G5 = tf(G)
```

+++ {"slideshow": {"slide_type": "notes"}}

Please note that these transformations are merely a convenience that allow you to work with your preferred form of representation. Most of the tools that deal with LTI system objects will work with any form. Furthermore, you can always use the data extraction functions `zpdata` and `tfdata` to extract the zero-pole-gain and numerator-denominator parameters from a LTI system, no matter in which form it was originally defined, without the need for an explicit conversion.

+++ {"slideshow": {"slide_type": "subslide"}}

### Combining LTI System Objects

A powerful feature of the LTI system object representation is the ease with which LTI objects can be combined.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Systems in series

For example, suppose we have two systems with transfer functions

$$G_1(s) = \frac{s + 1}{s+3}$$

and

$$G_2(s) = \frac{10}{s(s+2)}$$

+++ {"slideshow": {"slide_type": "subslide"}}

Then the series combination of the two transfer functions ($G_1(s)G_2(s)$) is obtained using the `*` (multiplication) operator:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
G1=tf([1 1],[1 3]);
G2=tf(10,conv([1 0],[1 2])); % conv is polynomial multiplication
Gs=G1*G2 % series connection of two LTI objects
```

+++ {"slideshow": {"slide_type": "subslide"}}

We can extract the poles and zeros of the combined systems using the `zpdata` function

```{code-cell}
---
slideshow:
  slide_type: fragment
---
[zeros,poles,K]=zpkdata(Gs,'v')
```

+++ {"slideshow": {"slide_type": "subslide"}}

#### Systems in parallel

The parallel connection of two LTI system objects corresponds to addition

```{code-cell}
---
slideshow:
  slide_type: fragment
---
Gp = G1 + G2
```

+++ {"slideshow": {"slide_type": "subslide"}}

#### Systems with feedback

The feedback connection of two LTI system objects is also supported.

+++ {"slideshow": {"slide_type": "fragment"}}

The function `feedback` is used for this.

+++ {"slideshow": {"slide_type": "subslide"}}

Let

$$G(s) = \frac{2s^2 + 5s + 1}{s^2 + 2s + 3}$$

be the forward transfer function of a system with feedback and

$$H(s) = \frac{5(s + 2)}{(s+10)}$$

be the feedback network. Then the closed-loop transfer function (assuming negative feedback) is

$$G_c(s) = \frac{G(s)}{1 + G(s)H(s)}$$

+++ {"slideshow": {"slide_type": "subslide"}}

In MATLAB:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
G = tf([2 5 1],[1 2 3],'inputname','torque',...
    'outputname','velocity');
H = zpk(-2,-10,5);
```

```{code-cell}
---
slideshow:
  slide_type: fragment
---
Gc = feedback(G,H) % negative feedback assumed
```

+++ {"slideshow": {"slide_type": "subslide"}}

### The Analysis of LTI System Objects

MATLAB uses the LTI system objects as parameters for the analysis tools such as `impulse`, `step`, `nyquist`, `bode` and `rlocus`. 

Some of these are immediately useful for signals and systems use. You will encounter the others in **EG-243 Control Systems**.

As an example of their use try each of following:

+++ {"slideshow": {"slide_type": "subslide"}}

#### Root locus

```{code-cell}
---
slideshow:
  slide_type: fragment
---
rlocus(G*H)
```

+++ {"slideshow": {"slide_type": "subslide"}}

#### Open-loop frequency response

```{code-cell}
---
slideshow:
  slide_type: fragment
---
bode(G*H)
```

+++ {"slideshow": {"slide_type": "subslide"}}

#### Closed-loop step response

```{code-cell}
---
slideshow:
  slide_type: fragment
---
step(Gc)
```

+++ {"slideshow": {"slide_type": "subslide"}}

#### Closed-loop frequency response

```{code-cell}
---
slideshow:
  slide_type: fragment
---
bode(Gc)
```

+++ {"slideshow": {"slide_type": "subslide"}}

#### Closed-loop impulse response

```{code-cell}
---
slideshow:
  slide_type: fragment
---
impulse(Gc)
```

+++ {"slideshow": {"slide_type": "subslide"}}

#### Nyquist diagram

```{code-cell}
---
slideshow:
  slide_type: fragment
---
nyquist(G*H)
```

+++ {"slideshow": {"slide_type": "notes"}}

MATLAB also provides two interactive graphical tools that work with LTI system objects

* `ltiview` is a graphical tool that can be used to analyze systems defined by LTI objects. It provides easy access to LTI objects and time and frequency response analysis tools. 
* `rltool` is an interactive tool for designing controllers using the root locus method.

Control engineers will find `sisotool` useful.

You are encouraged to experiment with these tools.

+++ {"slideshow": {"slide_type": "subslide"}}

### Partial Fraction Expansions

MATLAB provides a command called `residue` that returns the partial fraction expansion of a transfer function. That is, given

$$G(s)= \frac{s^m +b_{m-1}s^{m-1} + \cdots + b_1s+b_0}{s^n +a_{n-1}s^{n-1} + \cdots a_1s+a_0}$$

it returns

$$\frac{r_1}{s + p_1} + \frac{r_2}{s + p_2} + \cdots + \frac{R_n}{s + p_n} + K(s)$$

where $p_k$ are the poles of the transfer function, $r_k$ are the coefficients of the partial fraction terms (called the **residues of the poles**) and $K(s)$ is a remainder polynomial which empty unless the rational polynomial is *non-proper*.

+++ {"slideshow": {"slide_type": "subslide"}}

To use this, the starting point must be the expanded form of the transfer function in numerical polynomial form.

Thus given

$$C(s) = \frac{5(s + 2)}{s(s+3)(s+10)}$$

we obtain the partial fraction expansion using the MATLAB command sequence:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
k = 5; z = [-2]; p = [0; -3; -10]; % zero-pole-gain form
C = zpk(z,p,k);
[num,den] = tfdata(C,'v')
%
% (Note that the leading terms in num are zero).
```

```{code-cell}
---
slideshow:
  slide_type: subslide
---
[r,p,k] = residue(num,den)
```

+++ {"slideshow": {"slide_type": "subslide"}}

which we interpret to mean

$$C(s) = \frac{0.3333}{s} + \frac{0.2381}{s + 3} - \frac{0.5714}{s + 5}.$$

If $C(s)$ represents the step response of the system

$$G(s) = \frac{5(s + 2)}{(s + 3)(s + 10)}$$

then the step response is, by inverse Laplace Transform:

$$y(t) = \left( {0.3333 + 0.2381{e^{ - 3t}} - 0.5714{e^{ - 10t}}}
\right){u_0}(t).$$

+++ {"slideshow": {"slide_type": "subslide"}}

You can check this with the commands:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
newC = tf([5, 10],[1, 13, 30])
step(newC) % provides $u_0(t)$
```

```{code-cell}
---
slideshow:
  slide_type: subslide
---
t = 0:.05:1.5; % time vector
c = 0.3333 + 0.2381 * exp(-3*t) - 0.5714 * exp(-10*t);
plot(t,c)
```

+++ {"slideshow": {"slide_type": "notes"}}

Completing the problem using the Symbolic toolbox is left as an exercise for the reader.

+++ {"slideshow": {"slide_type": "notes"}}

There are numerous other documentation features provided for LTI system objects. Please consult the [on-line help](https://uk.mathworks.com/help/control/getstart/linear-lti-models.html) for full details.

+++ {"slideshow": {"slide_type": "slide"}}

(simulink_tf)=
## Using Transfer Functions in Simulink for System Simulation

+++ {"slideshow": {"slide_type": "fragment"}}

The Simulink transfer function (**`Transfer Fcn`**) block (see {numref}`fig:sim_tf`) implements a transfer function

+++ {"slideshow": {"slide_type": "fragment"}}

:::{figure-md} fig:sim_tf
<img src="pictures/sim_tf.png" alt="The LTI Block in Simulink">

The LTI Block in Simulink
:::

+++ {"slideshow": {"slide_type": "subslide"}}

The transfer function block represents a general input output function

$$G(s) = \frac{N(s)}{D(s)}$$

and is not specific nor restricted to circuit analysis.

+++ {"slideshow": {"slide_type": "fragment"}}

It can, however be used in modelling and simulation studies.

+++ {"slideshow": {"slide_type": "slide"}}

(example15)=
## Examples 15

+++ {"slideshow": {"slide_type": "slide"}}

(ex:15.1)=
### Example 15.1 

Recast {ref}`ex:14.2` as a MATLAB problem using the LTI Transfer Function block. 

For simplicity use parameters $R_1 = R_2 = R_3 = 1\; \Omega$, and $C_1 = C_2 = 1$ F.

Calculate the step response using the LTI functions and 

Verify the result with Simulink.

+++ {"slideshow": {"slide_type": "subslide"}}

#### MATLAB Solution
From a previous analysis ({ref}`ex:14.2`) the transfer function is:

$$G(s) = \frac{V_\mathrm{out}}{V_\mathrm{in}} = \frac{-1}{R_1\left[(1/R_1 + 1/R_2 + 1/R_3 + sC_1)(sR_3C_2) + 1/R_2\right]}$$

+++ {"slideshow": {"slide_type": "subslide"}}

so substituting the component values we get:

$$G(s) = \frac{V_{\mathrm{out}}}{V_{\mathrm{in}}} = \frac{-1}{s^2 + 3s + 1}$$

+++ {"slideshow": {"slide_type": "subslide"}}

We can find the step response by letting $v_{\mathrm{in}}(t) = u_0(t)$ so that
$V_{\mathrm{in}}(s)=1/s$ then 

$$V_{\mathrm{out}}(s) = \frac{-1}{s^2 + 3s + 1}.\frac{1}{s}$$

+++ {"slideshow": {"slide_type": "subslide"}}

We can solve this by partial fraction expansion and inverse Laplace transform
as is done in the text book with the help of MATLAB's `residue` function.

Here, however we'll use the LTI block.

+++ {"slideshow": {"slide_type": "subslide"}}

Define the circuit as a transfer function

```{code-cell}
---
slideshow:
  slide_type: fragment
---
G = tf([-1],[1 3 1])
```

+++ {"slideshow": {"slide_type": "subslide"}}

step response is then:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
step(G)
```

+++ {"slideshow": {"slide_type": "subslide"}}

#### Simulink model

See [example_8.slx](https://cpjobling.github.io/eg-150-textbook/laplace_transform/matlab/example_8.slx)

```{code-cell}
---
slideshow:
  slide_type: fragment
---
open example_8
```

+++ {"slideshow": {"slide_type": "notes"}}

![Simulink model](pictures/ex8_sim.png)

+++ {"slideshow": {"slide_type": "notes"}}

Result

![Simulation result](pictures/ex8_sim_result.png)

+++ {"slideshow": {"slide_type": "subslide"}}

Let's go a bit further by finding the frequency response:

```{code-cell}
---
slideshow:
  slide_type: subslide
---
bode(G)
```

+++ {"slideshow": {"slide_type": "notes"}}

**TODO** Add additional examples from EG-152

+++

## Lab 5

+++

## Summary

### Takeaways

+++

## Next time

We will complete this course with an introduction to Frequency response analysis of periodic signals via the Fourier series.

* {ref}`unit5`

## References

```{bibliography}
:filter: docname in docnames
```

+++

## Matlab Solutions

For convenience, single script MATLAB solutions to the examples are provided and can be downloaded from the accompanying [MATLAB](https://github.com/cpjobling/eg-150-textbook/tree/master/laplace_transform/matlab) folder.

* {ref}`ex:15.1` [[example_14.2.mlx](https://cpjobling.github.io/eg-150-textbook/laplace_transform/matlab/example_14.2.mlx)]
