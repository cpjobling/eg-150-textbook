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

* Circuit Analysis Using MATLAB LTI Transfer Function Block

* Circuit Simulation Using Simulink Transfer Function Block

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

A powerful feature of the LTI system object representation is the ease with which LTI objects can be combined. For example, suppose we have two systems with transfer functions

and

then the series combination of the two transfer functions

is obtained using the *? (multiplication) operator:
G1=tf([1 1],[1 3]);
G2=tf(10,conv([1 0],[1 2])); % conv is polynomial multiplication
Gs=G1*G2 % series connection of two LTI objects

[zeros,poles,K]=zpkdata(Gs,'v')
%

The parallel connection of two LTI system objects corresponds to addition

Gp = G1 + G2

+++

The feedback connection of two LTI system objects is also supported. The function feedback is used for this. Let

be the forward transfer function of a closed-loop system and

be the feedback network. Then the closed-loop transfer function (assuming negative feedback) is

In matlab:
G = tf([2 5 1],[1 2 3],'inputname','torque',...
    'outputname','velocity');
H = zpk(-2,-10,5);
Gc = feedback(G,H) % negative feedback assumed
%

The Analysis of LTI System Objects
Matlab uses the LTI system objects as parameters for the analysis tools such as impulse, step, nyquist, bode and rlocus. As an example of their use try each of following:
Root locus
rlocus(G*H)

open-loop frequency response
bode(G*H)

closed-loop step response
step(Gc)

closed-loop frequency response
bode(Gc)

+++

closed-loop impulse response
impulse(Gc)

Nyquist diagram
nyquist(G*H)

Matlab also provides two interactive graphical tools that work with LTI system objects. * ltiview is a graphical tool that can be used to analyze systems defined by LTI objects. It provides easy access to LTI objects and time and frequency response analysis tools. * rltool is an interactive tool for designing controllers using the root locus method.
Control engineers will find sisotool useful.
You are encouraged to experiment with these tools.
Partial Fraction Expansions
Matlab provides a command called residue that returns the partial fraction expansion of a transfer function. That is, given

it returns

where  are the poles of the transfer function,  are the coefficients of the partial fraction terms (called the residues of the poles) and  is a remainder polynomial which is usually empty.
To use this, the starting point must (rather perversely) be the expanded form of the transfer function in polynomial form.
Thus given

we obtain the partial fraction expansion using the Matlab command sequence:
k = 5; z = [-2]; p = [0; -3; -10]; % zero-pole-gain form
C = zpk(z,p,k);
[num,den] = tfdata(C,'v')
%
% (Note that the leading terms in num are zero).

+++

[r,p,k] = residue(num,den)

which we interpret to mean

If  represents the step response of the system

then the step response is, by Inverse Laplace Transform:

You can check this with the commands:
newC = tf([5, 10],[1, 13, 30])
step(newC) % provides $u_0(t)$

t = 0:.05:1.5; % time vector
c = 0.3333 + 0.2381 * exp(-3*t) - 0.5714 * exp(-10*t);
plot(t,c)

+++ {"slideshow": {"slide_type": "notes"}}

There are numerous other documentation features provided for LTI system objects. Please consult the [on-line help](https://uk.mathworks.com/help/control/getstart/linear-lti-models.html) for full details.

+++ {"slideshow": {"slide_type": "slide"}}

(examples14)=
## Examples 14

We will work through these and demonstrate the MATLAB solutions in class.

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 14.1

Derive an expression for the transfer function $G(s)$ for the circuit shown in {numref}`fig:ex14.1`. 

In this circuit $R_g$ represents the internal resistance of the applied (voltage) source $v_s$, and $R_L$ represents the resistance of the load that consists of $R_L$, $L$ and $C$.

+++ {"slideshow": {"slide_type": "subslide"}}

:::{figure-md} Fig:ex14.1
<img src="pictures/Example6.png" alt="Circuit for Example 14.1" width="50%">

Circuit for Example 14.1
:::

+++ {"slideshow": {"slide_type": "subslide"}}

#### Sketch of Solution for Example 14.1

+++ {"slideshow": {"slide_type": "fragment"}}

* Replace $v_s(t)$, $R_g$, $R_L$, $L$ and $C$ by their transformed (*complex frequency*) equivalents: $V_s(s)$, $R_g$, $R_L$, $sL$ and $1/(sC)$

+++ {"slideshow": {"slide_type": "fragment"}}

* Use the *Voltage Divider Rule* to determine $V_\mathrm{out}(s)$ as a function of $V_s(s)$

+++ {"slideshow": {"slide_type": "fragment"}}

* Form $G(s)$ by writing down the ratio $V_\mathrm{out}(s)/V_s(s)$

+++ {"slideshow": {"slide_type": "fragment"}}

Switch to virtual whiteboard in OneNote.

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">
Solve in OneNote


























</pre>

+++ {"slideshow": {"slide_type": "notes"}}

#### Worked solution for Example 14.1

Pencast: [ex6.pdf](https://cpjobling.github.io/eg-247-textbook/laplace_transform/worked_examples/ex6.pdf) - open in Adobe Acrobat Reader.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Answer for Example 14.1

$$G(s) = \frac{V_\mathrm{out}(s)}{V_s(s)} = \frac{R_L + sL + 1/sC}{R_g + R_L + sL + 1/sC}.$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 14.2

Compute the transfer function for the op-amp circuit shown in {numref}`fig:ex14.2` in terms of the circuit constants $R_1$, $R_2$, $R_3$, $C_1$ and $C_2$.

+++ {"slideshow": {"slide_type": "subslide"}}

:::{figure-md} Fig:ex14.2
<img src="pictures/example7.png" alt="OpAmp circuit for Example 14.2" width="60%">

OpAmp circuit for Example 14.2
:::

+++ {"slideshow": {"slide_type": "subslide"}}

Then replace the complex variable $s$ with $j\omega$, and the circuit constants with their numerical values and plot the magnitude

$$\left|G(j\omega)\right| = \frac{\left|V_{\mathrm{out}}(j\omega)\right|}{\left|V_{\mathrm{in}}(j\omega)\right|}$$

versus radian frequency $\omega$ rad/s.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Sketch of Solution for Example 14.2

+++ {"slideshow": {"slide_type": "fragment"}}

* Replace the components and voltages in the circuit diagram with their complex frequency equivalents

+++ {"slideshow": {"slide_type": "fragment"}}

* Use nodal analysis to determine the voltages at the nodes either side of the 50K resistor $R_3$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Sketch of Solution for Example 14.2 (continued)

+++ {"slideshow": {"slide_type": "fragment"}}

* Note that the voltage at the input to the op-amp is a virtual ground

+++ {"slideshow": {"slide_type": "fragment"}}

* Solve for $V_{\mathrm{out}}(s)$ as a function of $V_{\mathrm{in}}(s)$

+++ {"slideshow": {"slide_type": "fragment"}}

* Form the reciprocal $G(s) = V_{\mathrm{out}}(s)/V_{\mathrm{in}}(s)$

+++ {"slideshow": {"slide_type": "fragment"}}

Switch to virtual whiteboard in OneNote.

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">
Solve in OneNote






































</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

#### Answer for Example 14.2

$$G(s) = \frac{V_\mathrm{out}(s)}{V_\mathrm{in}(s)} = \frac{-1}{R_1\left(\left(1/R_1 + 1/R_2 + 1/R_3 + sC_1\right)\left(sC_2R_3\right)+1/R_2\right)}.$$ (ex:14.2)

+++ {"slideshow": {"slide_type": "notes"}}

#### Worked solution for Example 14.2

Pencast: [ex7.pdf](https://cpjobling.github.io/eg-247-textbook/laplace_transform/worked_examples/ex7.pdf) - open in Adobe Acrobat Reader.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Sketch of Solution for Example 14.2 (continued)

+++ {"slideshow": {"slide_type": "fragment"}}

* Use MATLAB to calculate the component values, then replace $s$ by $j\omega$.

+++ {"slideshow": {"slide_type": "fragment"}}

* Compute $\left|G(j\omega)\right|$ and plot on log-linear "paper".

+++ {"slideshow": {"slide_type": "subslide"}}

#### The Matlab Bit

+++ {"slideshow": {"slide_type": "fragment"}}

Set up the symbols we will be using. In this case just the Laplace complex frequency $s$.

```{code-cell}
---
slideshow:
  slide_type: fragment
---
syms s
```

+++ {"slideshow": {"slide_type": "subslide"}}

Now define the values of the components

```{code-cell}
---
slideshow:
  slide_type: fragment
---
R1 = 200*10^3; 
R2 = 40*10^3;
R3 = 50*10^3;

C1 = 25*10^(-9);
C2 = 10*10^(-9);
```

+++ {"slideshow": {"slide_type": "subslide"}}

Define the transfer function derived from analysis (Eq. {eq}`eg:ex14.2`)

```{code-cell}
---
slideshow:
  slide_type: fragment
---
den = R1*((1/R1+ 1/R2 + 1/R3 + s*C1)*(s*R3*C2) + 1/R2)
```

+++ {"slideshow": {"slide_type": "subslide"}}

Simplify coefficients of $s$ in the denominator. Note `sym2poly` converts a symbolic polynomial with numerical coeficients into a MATLAB polynomial.

```{code-cell}
---
slideshow:
  slide_type: subslide
---
format long
denG = sym2poly(den)
```

+++ {"slideshow": {"slide_type": "subslide"}}

Now define the denominator

```{code-cell}
---
slideshow:
  slide_type: fragment
---
numG = -1;
```

+++ {"slideshow": {"slide_type": "subslide"}}

**Plot the frequency response**

+++ {"slideshow": {"slide_type": "fragment"}}

For convenience, define coefficients $a$ and $b$:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
a = denG(1);
b = denG(2);
```

+++ {"slideshow": {"slide_type": "subslide"}}

$$G(j\omega) = \frac{-1}{a\omega^2 - jb\omega + 5}$$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
w = 1:10:10000;
Gw = -1./(a*w.^2 - j.*b.*w + denG(3));
```

+++ {"slideshow": {"slide_type": "subslide"}}

Plot $|G(j\omega)|$ against $\omega$ on log-lin "graph paper".

```{code-cell}
---
slideshow:
  slide_type: subslide
---
semilogx(w, abs(Gw))
xlabel('Radian frequency w (rad/s')
ylabel('|Vout/Vin|')
title('Magnitude Vout/Vin vs. Radian Frequency')
grid
```

+++ {"slideshow": {"slide_type": "notes"}}

Note that this is a low-pass filter. Sinusoids at low frequencies are passed with a gain of 0.2. For frequencies above around 100 ra/s, the filter starts to reduce the attenuation of the passed signal. At 10,000 rad/s, the attenuation is 1/10 of the attenuation at 1 rad/s.

+++ {"slideshow": {"slide_type": "slide"}}

## Using Transfer Functions in Simulink for System Simulation

+++ {"slideshow": {"slide_type": "fragment"}}

![Using Transfer Functions in Simulink for System Simulation](pictures/sim_tf.png)

+++ {"slideshow": {"slide_type": "fragment"}}

The Simulink transfer function (**`Transfer Fcn`**) block implements a transfer function

+++ {"slideshow": {"slide_type": "subslide"}}

The transfer function block represents a general input output function

$$G(s) = \frac{N(s)}{D(s)}$$

and is not specific nor restricted to circuit analysis.

+++ {"slideshow": {"slide_type": "fragment"}}

It can, however be used in modelling and simulation studies.

+++ {"slideshow": {"slide_type": "slide"}}

### Example

Recast Example 7 as a MATLAB problem using the LTI Transfer Function block. 

For simplicity use parameters $R_1 = R_2 = R_3 = 1\; \Omega$, and $C_1 = C_2 = 1$ F.

Calculate the step response using the LTI functions.

+++ {"slideshow": {"slide_type": "subslide"}}

Verify the result with Simulink.

The Matlab solution: [example8.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/example8.m)

+++ {"slideshow": {"slide_type": "subslide"}}

#### MATLAB Solution
From a previous analysis the transfer function is:

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

+++ {"slideshow": {"slide_type": "notes"}}

Simples!

+++ {"slideshow": {"slide_type": "subslide"}}

#### Simulink model

See [example_8.slx](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/example_8.slx)

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

## Reference 

See [Bibliography](/zbib).

## Agenda

* Transfer Functions

+++ {"slideshow": {"slide_type": "fragment"}}

* A Couple of Examples

+++ {"slideshow": {"slide_type": "fragment"}}

* Circuit Analysis Using MATLAB LTI Transfer Function Block

+++ {"slideshow": {"slide_type": "fragment"}}

* Circuit Simulation Using Simulink Transfer Function Block

```{code-cell}
---
slideshow:
  slide_type: skip
tags: [remove-output]
---
% Matlab setup
clear all
cd ../matlab 
pwd
format compact
```

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "slide"}}

## Transfer Functions for Circuits

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 6

Derive an expression for the transfer function $G(s)$ for the circuit below. In this circuit $R_g$ represents the internal resistance of the applied (voltage) source $v_s$, and $R_L$ represents the resistance of the load that consists of $R_L$, $L$ and $C$.

+++ {"slideshow": {"slide_type": "subslide"}}

<img title="Circuit for Example 6" src="pictures/example6.png" width="50%" />

+++ {"slideshow": {"slide_type": "subslide"}}

### Sketch of Solution for Example 6

* Replace $v_s(t)$, $R_g$, $R_L$, $L$ and $C$ by their transformed (*complex frequency*) equivalents: $V_s(s)$, $R_g$, $R_L$, $sL$ and $1/(sC)$
* Use the *Voltage Divider Rule* to determine $V_\mathrm{out}(s)$ as a function of $V_s(s)$ 
* Form $G(s)$ by writing down the ratio $V_\mathrm{out}(s)/V_s(s)$

+++ {"slideshow": {"slide_type": "notes"}}

### Worked solution for Example 6

Pencast: [ex6.pdf](https://cpjobling.github.io/eg-247-textbook/laplace_transform/worked_examples/ex6.pdf) - open in Adobe Acrobat Reader.

+++ {"slideshow": {"slide_type": "subslide"}}

### Answer for Example 6

$$G(s) = \frac{V_\mathrm{out}(s)}{V_s(s)} = \frac{R_L + sL + 1/sC}{R_g + R_L + sL + 1/sC}.$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 7

Compute the transfer function for the op-amp circuit shown below in terms of the circuit constants $R_1$, $R_2$, $R_3$, $C_1$ and $C_2$. Then replace the complex variable $s$ with $j\omega$, and the circuit constants with their numerical values and plot the magnitude

$$\left|G(j\omega)\right| = \frac{\left|V_{\mathrm{out}}(j\omega)\right|}{\left|V_{\mathrm{in}}(j\omega)\right|}$$

versus radian frequency $\omega$ rad/s.

+++ {"slideshow": {"slide_type": "subslide"}}

<img alt="Circuit for Example 7" src="pictures/example7.png" height="50%" />

+++ {"slideshow": {"slide_type": "subslide"}}

### Sketch of Solution for Example 7

* Replace the components and voltages in the circuit diagram with their complex frequency equivalents
* Use nodal analysis to determine the voltages at the nodes either side of the 50K resistor $R_3$
* Note that the voltage at the input to the op-amp is a virtual ground
* Solve for $V_{\mathrm{out}}(s)$ as a function of $V_{\mathrm{in}}(s)$
* Form the reciprocal $G(s) = V_{\mathrm{out}}(s)/V_{\mathrm{in}}(s)$
* Use MATLAB to calculate the component values, then replace $s$ by $j\omega$.
* Plot 
    $$\left|G(j\omega)\right|$$
  on log-linear "paper".

+++ {"slideshow": {"slide_type": "notes"}}

### Worked solution for Example 7

Pencast: [ex7.pdf](https://cpjobling.github.io/eg-247-textbook/laplace_transform/worked_examples/ex7.pdf) - open in Adobe Acrobat Reader.

+++ {"slideshow": {"slide_type": "subslide"}}

### Answer for Example 7

$$G(s) = \frac{V_\mathrm{out}(s)}{V_\mathrm{in}(s)} = \frac{-1}{R_1\left(\left(1/R_1 + 1/R_2 + 1/R_3 + sC_1\right)\left(sC_2R_3\right)+1/R_2\right)}.$$

+++ {"slideshow": {"slide_type": "subslide"}}

### The Matlab Bit

See attached script: [solution7.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/solution7.m).

+++ {"slideshow": {"slide_type": "subslide"}}

#### Week 3: Solution 7

```{code-cell}
---
slideshow:
  slide_type: fragment
tags: [remove-output]
---
syms s;
```

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
R1 = 200*10^3; % 200 kOhm 
R2 = 40*10^3; % 40 kOhm
R3 = 50*10^3; % 50 kOhm

C1 = 25*10^(-9); % 25 nF
C2 = 10*10^(-9); % 10 nF
```

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
den = R1*((1/R1+ 1/R2 + 1/R3 + s*C1)*(s*R3*C2) + 1/R2);
simplify(den)
```

+++ {"slideshow": {"slide_type": "subslide"}}

Result is: `100*s*((7555786372591433*s)/302231454903657293676544 + 1/20000) + 5`

+++ {"slideshow": {"slide_type": "subslide"}}

Simplify coefficients of s in denominator

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
format long
denG = sym2poly(ans)
```

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
numG = -1;
```

+++ {"slideshow": {"slide_type": "subslide"}}

Plot

For convenience, define coefficients $a$ and $b$:

```{code-cell}
:tags: [remove-output]

a = denG(1);
b = denG(2);
```

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
w = 1:10:10000;
```

+++ {"slideshow": {"slide_type": "subslide"}}

$$G(j\omega) = \frac{-1}{a\omega^2 - jb\omega + 5}$$

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
Gw = -1./(a*w.^2 - j.*b.*w + denG(3));
```

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
semilogx(w, abs(Gw))
xlabel('Radian frequency w (rad/s)')
ylabel('|Vout/Vin|')
title('Magnitude Vout/Vin vs. Radian Frequency')
grid
```

+++ {"slideshow": {"slide_type": "slide"}}

## Using Transfer Functions in Matlab for System Analysis

Please use the file [tf_matlab.m](https://cpjobling.github.io/eg-150-textbook/laplace_transform/matlab/tf_matlab.m) to explore the Transfer Function features provide by Matlab. Use the *publish* option to generate a nicely formatted document.

```{code-cell}
edit tf_matlab
```

+++ {"slideshow": {"slide_type": "slide"}}

## Using Transfer Functions in Simulink for System Simulation

![Using Transfer Functions in Simulink for System Simulation](pictures/sim_tf.png)

The Simulink transfer function (**`Transfer Fcn`**) block shown above implements a transfer function representing a general
input output function

$$G(s) = \frac{N(s)}{D(s)}$$

that it is not specific nor restricted to circuit analysis. It can, however be used in modelling and simulation studies.

+++ {"slideshow": {"slide_type": "subslide"}}

### Example

Recast Example 7 as a MATLAB problem using the LTI Transfer Function block. 

For simplicity use parameters $R_1 = R_2 = R_3 = 1\; \Omega$, and $C_1 = C_2 = 1$ F.

Calculate the step response using the LTI functions.

Verify the result with Simulink.

The Matlab solution: [example8.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/example8.m)

+++ {"slideshow": {"slide_type": "subslide"}}

#### MATLAB Solution
From a previous analysis the transfer function is:

$$G(s) = \frac{V_\mathrm{out}}{V_\mathrm{in}} = \frac{-1}{R_1\left[(1/R_1 + 1/R_2 + 1/R_3 + sC_1)(sR_3C_2) + 1/R_2\right]}$$

so substituting the component values we get:

$$G(s) = \frac{V_{\mathrm{out}}}{V_{\mathrm{in}}} = \frac{-1}{s^2 + 3s + 1}$$

We can find the step response by letting $v_{\mathrm{in}}(t) = u_0(t)$ so that
$V_{\mathrm{in}}(s)=1/s$ then 

$$V_{\mathrm{out}}(s) = \frac{-1}{s^2 + 3s + 1}.\frac{1}{s}$$
 
We can solve this by partial fraction expansion and inverse Laplace transform
as is done in the text book with the help of Matlab's `residue` function.

Here, however we'll use the LTI block that was introduced in the lecture.

+++ {"slideshow": {"slide_type": "subslide"}}

Define the circuit as a transfer function

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
G = tf([-1],[1 3 1])
```

+++ {"slideshow": {"slide_type": "subslide"}}

step response is then:

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
step(G)
```

+++ {"slideshow": {"slide_type": "subslide"}}

Simples!

+++ {"slideshow": {"slide_type": "subslide"}}

#### Simulink model

See [example_8.slx](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/example_8.slx)

```{code-cell}
---
slideshow:
  slide_type: fragment
tags: [remove-output]
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
tags: [remove-output]
---
%bode(G)
nyquist(G)
%rlocus(G)
```

## Matlab Solutions

For convenience, single script MATLAB solutions to the examples are provided and can be downloaded from the accompanying [MATLAB](https://github.com/cpjobling/eg-150-textbook/tree/master/laplace_transform/matlab) folder.

* {ref}`ex:14.2` [[example_14.2.mlx](https://cpjobling.github.io/eg-150-textbook/laplace_transform/matlab/example_14.2.mlx)]
* Example 8  [[example8.m](https://cpjobling.github.io/eg-150-textbook/laplace_transform/matlab/example8.m)]
* Simulink model [[example_8.slx](https://cpjobling.github.io/eg-150-textbook/laplace_transform/matlab/example_8.slx)]

+++

## Summary

In this unit we have presented the idea of a *transfer function* (or *system function*) that allows us to represent the impulse response $h(t)$ by the Laplace transform $H(s)$. We also looked at the characteristics of the Laplace transform, transform functions for LCCODEs and series and parallel combination of transfer functions. 

* {ref}`system_function`

* {ref}`char_LTI_systems`

* {ref}`tf_for_LCCODE`

* {ref}`block_diagrams`

* {ref}`examples13`

**My main message to you is that, as an engineer faced with a LCCODE to solve, you should use Laplace transforms!**


### Take Aways

#### Transfer function

The summary of the time-domain and s-domain transforms are illustrated in {numref}`fig:3-7`. The key result is $Y(s) = H(s)X(s)$ which simplifies the computation of the system response $y(t) = h(t)*x(t)$ which has to be done using time-convolution.

If we know $Y(s)$ and $X(s)$ we can determine $H(s)$ using

$$H(s) = \frac{Y(s)}{X(s)}$$

and $h(t) = \mathcal{L}^{-1}\left\{H(s)\right\}$

#### Characterization of LTI Systems

For continuous-time LTI systems the causality and stabilty of a system is guaranteed if all the poles of the transfer function are in the left-half of the $s$-plane and the $j\omega$ axis is included in the region of convergence. That is, if the poles of the system $H(s)$, $s_k$ have real part $-\sigma_k$, the system will be causal and stable if $\sigma_k < 0$ for all $k$.

#### Laplace transforms of LCCODEs

The linear constant coefficient ordinary differential equation (LLCODE) of a system involving input signal $x(t)$ and output signal $y(t)$ is given in {eq}`eq:338`. When we take Laplace transforms of this differential equation, ignoring initial conditions, we get the polynomial equation {eq}`eq:339` from which we can determine the transfer function:

$$H(s) = \frac{Y(s)}{X(s)} = \frac{b_M s^M + b_{M-1}s^{M-1}+ \cdots + b_1 s + b_0}{a_{N} s^N + b_{N-1}s^{N-1}+ \cdots + a_1 s + a_0}$$

This is a rational polynomial in $s$ and it can be solved for any input $x(t)$ that has a Laplace transform $X(s)$ by forming

$$Y(s) = H(s)X(s)$$

and taking inverse Laplace transforms using the Partial Fraction Expansion method discussed in {ref}`unit4.5`.

Several examples are given in {ref}`examples12` in which the problems given in {ref}`examples8` of {ref}`unit3.3` are redone as Laplace transform problems. 


#### Block diagrams

Complex systems can be broken down into subsystems which may be represented by block diagrams which have either series or parallel connections (see {numref}`Fig:3-8` and {numref}`Fig:3-9` and feedback (See {ref}`ex:13.8`)


### Still to come

We will use transfer functions to solve circuit problems in {ref}`unit4.7` and conclude our study of Laplace transforms in {ref}`unit4.8` with a look at the use of Transfer functions in the MATLAB control systems toolbox and the sumulation tool Simulink. We will also look at some of the problems you have studied in **EG-152 Analogue Design** hopefully confirming some of the results you have obbserved in the lab.

In **EG-247 Digital Signal Processing** we will start from the knowledge gained in {ref}`Unit 4` developing transform ideas further via the Fourier Transform, Z-Transform and the design of systems for signal processing. In **EG-243 Control Systems** you will model feedback control signals using block diagrams and transfer functions. You will also study how knowledge of poles and zeros can be exploited in the design of systems with stable responses.

```{code-cell}
:tags: [remove-output]

cd ../matlab
ls
open example_14_2
```

```{code-cell}

```
