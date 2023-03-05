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

(unit4.5)=
# Unit 4.5: Using Laplace Transforms for Circuit Analysis

+++ {"slideshow": {"slide_type": "notes"}}

The preparatory reading for this section is [Chapter 4](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=3384197&ppg=101) {cite}`karris` which presents examples of the applications of the Laplace transform for electrical solving circuit problems. Much of the same material is covered in [Section 3.7 D](https://www.accessengineeringlibrary.com/content/book/9781260454246/toc-chapter/chapter3/section/section36) of {cite}`schaum`.

+++ {"slideshow": {"slide_type": "notes"}}

## Agenda

We look at applications of the Laplace Transform for circuit analysis. In particular we will consider

* {ref}`circuit_transforms`

* {ref}`complex_impedance`

* {ref}`complex_admittance`

* {ref}`examples12`

+++ {"slideshow": {"slide_type": "subslide"}}

Follow along at [cpjobling.github.io/eg-150-textbook/laplace_transform/5/circuit_analysis](https://cpjobling.github.io/eg-150-textbook/laplace_transform/5/circuit_analysis)

![QR Code for this lecture](pictures/qrcode_laplace5.png)

```{code-cell}
---
slideshow:
  slide_type: subslide
---
% initialize MATLAB
clearvars
syms t L R C i_R(t) v_R(t) i_L(t) v_L(t) v_C(t) i_C(t)
```

+++ {"slideshow": {"slide_type": "slide"}}

(circuit_transforms)=
## Circuit Transformation from Time to Complex Frequency

+++ {"slideshow": {"slide_type": "subslide"}}

(resistive_network}=
### Time Domain Model of a Resistive Network

Consider {numref}`fig:res_circ_t`

:::{figure-md} fig:res_circ_t

<img src="pictures/resistive_time.png" alt="Time Domain Model of a Resistive Network." width="60%">

Time Domain Model of a Resistive Network.
:::

+++ {"slideshow": {"slide_type": "subslide"}}

#### In the time domain

In {numref}`fig:res_circ_t` the voltage across the resistor $v_R(t)$ is proportional to the current flowing through the resistor $i_R(t)$

$$v_R(t) = R i_R(t)$$ (eq:vrt)

```{code-cell}
---
slideshow:
  slide_type: fragment
---
eqvrt = v_R(t) == R * i_R(t)
```

+++ {"slideshow": {"slide_type": "subslide"}}

The current flowing through the resistor is inversely proportional to the voltage across the resistor. This is easily confirmed by rewriting {eq}`eq:vrt` to isolate $i_R(t)$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
eqirt = isolate(eqvrt,i_R(t))
```

+++ {"slideshow": {"slide_type": "fragment"}}

Rewritten nicely as

$$i_R(t) = \frac{v_R(t)}{R}$$ (eq:irt)

+++ {"slideshow": {"slide_type": "subslide"}}

From these results, which of the following equations represent the Laplace transform of the current flowing through, and the voltage across, the resistor $R$?

+++ {"slideshow": {"slide_type": "fragment"}}

$$V_R(s) = RI_R(s)$$

$$I_R(s) + \frac{V_R(s)}{R}$$
    
$$V_R(s) = \frac{I_R(s)}{R}$$
    
$$I_R(s) = RV_R(s)$$

+++ {"slideshow": {"slide_type": "fragment"}}

**-> Open poll**

+++ {"slideshow": {"slide_type": "notes"}}

#### In the complex frequency domain

We take the Laplace transforms of {eq}`eq:vrt` and {eq}`eq:irt` to obtain

$$V_R(s) = R I_R(s)$$ (eq:Vrs)

$$I_R(s) = \frac{V_R(s)}{R}$$ (eq:Irs)

which we illustrate in {numref}`fig:res_circ_s`.

```{note}
The current and voltage are transformed but the resitance is unchanged by the transformation.
```

+++ {"slideshow": {"slide_type": "subslide"}}

(complex_resistive_network)=
###  Complex Frequency Domain Model of a Resistive Circuit

:::{figure-md} fig:res_circ_s
<img src="pictures/resistive_freq.png" alt="Complex Frequency Domain Model of a Resistive Circuit" width="60%">

Complex Frequency Domain Model of a Resistive Circuit
:::

+++ {"slideshow": {"slide_type": "subslide"}}

(inductive_network)=
###  Time Domain Model of an Inductive Network

Consider {numref}`fig:res_circ_t`

:::{figure-md} fig:res_circ_t

<img src="pictures/resistive_time.png" alt="Time Domain Model of a Resistive Network." width="60%">

Time Domain Model of a Resistive Network.
:::

![Inductive Network - Time Domain](pictures/inductive_time.png)

+++ {"slideshow": {"slide_type": "subslide"}}

#### In the time domain

The voltage across the inductor $i_L(t)$ is proportional to the rate of change of the current $i_L(t)$ flowing through the inductor 

$$v_L(t) = L \frac{d}{dt} i_L(t) $$ (eq:vlt)

```{code-cell}
---
slideshow:
  slide_type: fragment
---
eqvlt = v_L(t) == L*diff(i_L(t))
```

+++ {"slideshow": {"slide_type": "subslide"}}

The current flowing through the inductor is inversely proportional to the integral of the voltage across the inductor which is easily confirmed by taking the integral of both sides of {eq}`eq:vlt` and rewriting the equation to isolate $i_L(t)$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
int(lhs(eqvlt)) == int(rhs(eqvlt));
eqilt = isolate(ans,i_L(t))
```

+++ {"slideshow": {"slide_type": "fragment"}}

Rewritten nicely as

$$i_L(t) = \frac{1}{L}\int_{-\infty}^{t} v_L(t)\, dt$$ (eq:ilt)

+++ {"slideshow": {"slide_type": "subslide"}}

From these results, which of the following equations represent the Laplace transform of the current flowing through, and the voltage across, the inductor $L$?

+++ {"slideshow": {"slide_type": "fragment"}}

$$I_L(s)=sLV_L(s) - Lv_L(0^-)$$

$$I_L(s)=\frac{V_L(s)}{sL} + \frac{v_L(0^-)}{s}$$

$$V_L(s) = sLI_L(s) - Li_L(0^-)$$

$$V_L(s)=\frac{I_L(s)}{sL} + \frac{i_L(0^-)}{s}$$

+++ {"slideshow": {"slide_type": "fragment"}}

**-> Open poll**

+++ {"slideshow": {"slide_type": "subslide"}}

(complex_inductive_network)=
### Complex Frequency Domain Model of an Inductive Network 

Consider {numref}`fig:res_circ_t`

:::{figure-md} fig:res_circ_t

<img src="pictures/resistive_time.png" alt="Time Domain Model of a Resistive Network." width="60%">

Time Domain Model of a Resistive Network.
:::

![Inductive Network - Complex Frequency Domain](pictures/inductive_freq.png)

+++ {"slideshow": {"slide_type": "notes"}}

#### In the complex frequency domain

We take the Laplace transforms of {eq}`eq:vlt` and {eq}`eq:ilt` to obtain

$$V_L(s) = s L I_L(s) - Li_L(0^-)$$ (eq:Vls)

$$I_L(s) = \frac{V_L(s)}{sL} + \frac{i_L(0^-)}{s}$$ (eq:Ils)

```{note}
The current and voltage are transformed but so is the inductance. The complex frequency representation has used the derivative property for the voltage across the inductor and the integration properties for the current through the inductor. The use of the dervative and integration transforms has introduced a term that depends on the initial current flowing through the inductor. Therefore, the initial current would need to be considered in computing the actual voltage and current in the complex frequency domain.
```

+++ {"slideshow": {"slide_type": "subslide"}}

(capacitive_network)=
### Time Domain Model of a Capacitive Network

Consider {numref}`fig:res_circ_t`

:::{figure-md} fig:res_circ_t

<img src="pictures/resistive_time.png" alt="Time Domain Model of a Resistive Network." width="60%">

Time Domain Model of a Resistive Network.
:::

![Capacitive Network - Time Domain](pictures/capacitive_time.png)

+++ {"slideshow": {"slide_type": "subslide"}}

#### In the time domain

The current flowing into the capacitor is proportional to the change in voltage across the capacitor

$$i_C(t) = C \frac{d}{dt} v_C(t) $$ (eq:ict)

```{code-cell}
---
slideshow:
  slide_type: fragment
---
eqict = i_C(t) == C * diff(v_C(t))
```

+++ {"slideshow": {"slide_type": "subslide"}}

The voltage across the capacitor is inversely proportional to the integral of the current flowing into the capacitor which is easily confirmed by taking the integral of both sides of {eq}`eq:ict` and rewriting the equation to isolate $v_C(t)$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
int(lhs(eqict)) == int(rhs(eqict));
eqvct = isolate(ans,v_C(t))
```

+++ {"slideshow": {"slide_type": "fragment"}}

Which can be rwritten nicely as 

$$v_C(t) = \frac{1}{C}\int_{-\infty}^{t} i_C(t)\, dt$$ (eq:vct)

+++ {"slideshow": {"slide_type": "subslide"}}

From the previous results, which of the following equations represent the Laplace transform of the current flowing into, and the voltage across, the capacitor $C$?

+++ {"slideshow": {"slide_type": "fragment"}}

$$V_c(s)=sCI_C(s) - Ci_C(0^-)$$

$$I_c(s) = sCV_C(s) - Cv_C(0^-)$$

$$V_c(s) = \frac{I_C(s)}{sC} + \frac{i_C(0^-)}{s}$$

$$I_c(s)=\frac{V_C(s)}{sC} + \frac{v_C(0^-)}{s}$$

+++ {"slideshow": {"slide_type": "fragment"}}

**-> Open poll**

+++ {"slideshow": {"slide_type": "notes"}}

#### In the complex frequency domain

We take the Laplace transforms of {eq}`eq:ict` and {eq}`eq:vct` to obtain

$$I_C(s) = s C V_C(s) - C v_C(0^-)$$ (eq:Ics)

$$V_C(s) = \frac{I_C(s)}{sC} + \frac{v_C(0^-)}{s}$$ (eq:Vcs)


```{note}
The current and voltage are transformed but so is the capacitance. The complex frequency representation has used the derivative property for the voltage across the capacitor and the integration property for the current flowing into the capacitor. The use of the dervative and integration transforms has introduced a term that depends on the initial voltage (initial charge) across the capacitor. Therefore, the initial voltage would need to be considered in computing the actual voltage and current introduced by the capacitor in the complex frequency domain.
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Complex Frequency Domain of a Capacitive Network

Consider {numref}`fig:res_circ_t`

:::{figure-md} fig:res_circ_t

<img src="pictures/resistive_time.png" alt="Time Domain Model of a Resistive Network." width="60%">

Time Domain Model of a Resistive Network.
:::

![Capacitive Network - Complex Frequency Domain](pictures/capacitive_freq.png)

+++ {"slideshow": {"slide_type": "slide"}}

(complex_impedance)=
## Complex Impedance $Z(s)$

+++ {"slideshow": {"slide_type": "subslide"}}

$$sL$$

$$1/R$$

$$sC$$

$$\frac{1}{sC}$$

$$\frac{1}{sL}$$

$$R$$

+++ {"slideshow": {"slide_type": "slide"}}

(complex_impedance_comps)=
### Complex impedance of components

For the resistance $R$$\Omega$, inductance $L$H and capacitance $C$F, which of the following represent the complex impedance of the components?

+++ {"slideshow": {"slide_type": "fragment"}}

**-> Open Poll**

+++ {"slideshow": {"slide_type": "slide"}}

Consider the $s$-domain RLC series circuit shown in {numref}`fig:complex_imp`, where the initial conditions are assumed to be zero.

:::{figure-md} fig:res_circ_t

<img src="pictures/impedence.png" alt="RLC series circuit." width="60%">

RLC series circuit
:::

+++ {"slideshow": {"slide_type": "subslide"}}

For this circuit, the sum

$$R + sL + \frac{1}{sC}$$ 

represents that total opposition to current flow.

+++ {"slideshow": {"slide_type": "fragment"}}

Then,

$$I(s) = \frac{V_s(s)}{R + sL + 1/(sC)}$$

+++ {"slideshow": {"slide_type": "subslide"}}

and defining the ratio $V_s(s)/I(s)$ as $Z(s)$, we obtain

$$Z(s) = \frac{V_s(s)}{I(s)} = R + sL + \frac{1}{sC}$$

+++ {"slideshow": {"slide_type": "subslide"}}

The $s$-domain current $I(s)$ can be found from 

$$I(s) = \frac{V_s(s)}{Z(s)}$$

where

$$Z(s) = R + sL + \frac{1}{sC}.$$

+++ {"slideshow": {"slide_type": "fragment"}}

Since $s = \sigma + j\omega$ is a complex number, $Z(s)$ is also complex and is known as the *complex input impedance* of this RLC series circuit.

+++ {"slideshow": {"slide_type": "slide"}}

(complex_admittance)=
## Complex Admittance $Y(s)$

+++ {"slideshow": {"slide_type": "subslide"}}

(complex_component_admittance)=
### Complex admittance of components

+++ {"slideshow": {"slide_type": "subslide"}}

For the resistor $R$Ω, inductor $L$H and capacitance $C$F, which of the following represent the complex admittance of the components?

$$sL$$

$$1/R$$

$$sC$$

$$\frac{1}{sC}$$

$$\frac{1}{sL}$$

$$R$$

+++ {"slideshow": {"slide_type": "fragment"}}

**-> Open Poll**

+++ {"slideshow": {"slide_type": "slide"}}

Consider the $s$-domain GLC parallel circuit shown in {numref}`fig:comp_adm` where the initial conditions are zero.

:::{figure-md} fig:comp_adm

<img src="pictures/admittance.png" alt="A GLC parallel circuit" width="60%">

A GLC parallel circuit
:::

+++ {"slideshow": {"slide_type": "subslide"}}

For this circuit

$$GV(s)+ \frac{1}{sL}V(s) + sCV(s) = I_s(s)$$

+++ {"slideshow": {"slide_type": "fragment"}}

$$\left(G+ \frac{1}{sL} + sC\right)V(s) = I_s(s)$$

+++ {"slideshow": {"slide_type": "subslide"}}

Defining the ratio $I_s(s)/V(s)$ as $Y(s)$ we obtain

$$Y(s)=\frac{I_s(s)}{V(s)} = G+ \frac{1}{sL} + sC = \frac{1}{Z(s)}$$

+++ {"slideshow": {"slide_type": "subslide"}}

The $s$-domain voltage $V(s)$ can be found from 

$$V(s) = \frac{I_s(s)}{Y(s)}$$

where

$$Y(s) = G + \frac{1}{sL} + sC.$$

+++ {"slideshow": {"slide_type": "fragment"}}

$Y(s)$ is complex and is known as the *complex input admittance* of this GLC parallel circuit.

+++ {"slideshow": {"slide_type": "subslide"}}

(examples12)=
## Examples 12

We will work through these in class.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex:12.1)=
### Example 12.1

Use the Laplace transform method and apply Kirchoff's Current Law (KCL) to find the voltage $v_c(t)$ across the capacitor for the circuit below given that $v_c(0^-) = 6$ V.

![Circuit for Example 1](pictures/example1_2.png)

+++ {"slideshow": {"slide_type": "notes"}}

**OneNote Class Notebook Scratch Pad**

<pre style="border: 2px solid blue">










































</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

(ex:12.2)=
### Example 12.2

Use the Laplace transform method and apply Kirchoff's Voltage Law (KVL) to find the voltage $v_c(t)$ across the capacitor for the circuit below given that $v_c(0^-) = 6$ V.

![Circuit for Example 2](pictures/example1_2.png)

+++ {"slideshow": {"slide_type": "notes"}}

**OneNote Class Notebook Scratch Pad**

<pre style="border: 2px solid blue">










































</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

(ex:12.3)=
### Example 12.3

In the circuit below, switch $S_1$ closes at $t=0$, while at the same time, switch $S_2$ opens. Use the Laplace transform method to find $v_{\mathrm{out}}(t)$ for $t > 0$.

![Circuit for Example 3](pictures/example3.png)

+++ {"slideshow": {"slide_type": "subslide"}}

We can show how with the assistance of MATLAB (See [solution3.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/solution3.m)) that the solution is

$$V_{\mathrm{out}}=\left(1.36e^{-6.57t}+0.64e^{-0.715t}\cos 0.316t - 1.84e^{-0.715t}\sin 0.316t\right)u_0(t)$$

and we can plot the result (see {ref}`sol:mat12.3`)

+++ {"slideshow": {"slide_type": "subslide"}}

(sol:12.3)=
#### Solution to Example 12.3

We will use a combination of pen-and-paper and MATLAB to solve this.

+++ {"slideshow": {"slide_type": "subslide"}}

##### 1. Equivalent Circuit

Draw equivalent circuit at $t=0$

+++ {"slideshow": {"slide_type": "notes"}}

**OneNote Class Notebook Scratch Pad**

<pre style="border: 2px solid blue">




























</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

##### 2. Transform model

Convert to transforms

+++ {"slideshow": {"slide_type": "notes"}}

**OneNote Class Notebook Scratch Pad**


<pre style="border: 2px solid blue">




























</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

##### 3. Determine equation

Determine equation for $V_{\rm out}(s)$.

+++ {"slideshow": {"slide_type": "notes"}}

**OneNote Class Notebook Scratch Pad**

<pre style="border: 2px solid blue">























</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

(sol:mat12.3)=
#### 4. Complete solution in MATLAB

In the lecture we showed that after simplification for Example 3

$$V_{\mathrm{out}}(s)=\frac{2s(s+3)}{s^3 + 8s^2 + 10s + 4}$$

We will use MATLAB to factorize the denominator $D(s)$ of the equation
into a linear and a quadratic factor.

+++ {"slideshow": {"slide_type": "subslide"}}

##### Find roots of Denominator D(s)

```{code-cell}
---
slideshow:
  slide_type: fragment
tags: [remove-output]
---
p = roots([1, 8, 10, 4])
```

+++ {"slideshow": {"slide_type": "subslide"}}

##### Find quadratic form

```{code-cell}
---
slideshow:
  slide_type: fragment
tags: [remove-output]
---
syms s t
y = expand((s - p(2))*(s - p(3)))
```

+++ {"slideshow": {"slide_type": "subslide"}}

##### Simplify coefficients of s

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
y = sym2poly(y)
```

+++ {"slideshow": {"slide_type": "subslide"}}

##### Complete the Square

**OneNote Class Notebook Scratch Pad**

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">























</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

##### Plot result

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
[r, p, k] = residue(2*conv([1,0],[1,3]),[1 8, 10,4])
yt=0:0.01:10;
Vout = 1.36.*exp(r(1).*t)...
   +0.64.*exp(real(r(2)).*t).*cos(imag(r(2)).*t)...
   -1.84.*exp(real(r(3)).*t).*sin(-imag(r(3)).*t);
plot(t, Vout); grid
title('Plot of Vout(t) for the circuit of Example 3')
ylabel('Vout(t) V'),xlabel('Time t s')
```

+++ {"slideshow": {"slide_type": "notes"}}

#### Worked Solution: Example 3


File Pencast: [example3.pdf](https://cpjobling.github.io/eg-247-textbook/laplace_transform/worked_examples/example3.pdf) - Download and open in Adobe Acrobat Reader.

The attached "PenCast" works through the solution to Example 3 by hand. It's quite a complex, error-prone (as you will see!) calculation that needs careful attention to detail. This in itself gives justification to my belief that you should use computers wherever possible.

Please note, the PenCast takes around 39 minutes (I said it was a complex calculation) but you can fast forward and replay any part of it.

+++ {"slideshow": {"slide_type": "subslide"}}

##### Alternative solution using transfer functions

```{code-cell}
---
slideshow:
  slide_type: fragment
tags: [remove-output]
---
Vout = tf(2*conv([1, 0],[1, 3]),[1, 8, 10, 4])
```

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
impulse(Vout)
```

+++ {"slideshow": {"slide_type": "subslide"}}

For this circuit, the sum

$$R + sL + \frac{1}{sC}$$ 

represents that total opposition to current flow. Then,

$$I(s) = \frac{V_s(s)}{R + sL + 1/(sC)}$$

and defining the ratio $V_s(s)/I(s)$ as $Z(s)$, we obtain

$$Z(s) = \frac{V_s(s)}{I(s)} = R + sL + \frac{1}{sC}$$

+++ {"slideshow": {"slide_type": "subslide"}}

The $s$-domain current $I(s)$ can be found from 

$$I(s) = \frac{V_s(s)}{Z(s)}$$

where

$$Z(s) = R + sL + \frac{1}{sC}.$$

Since $s = \sigma + j\omega$ is a complex number, $Z(s)$ is also complex and is known as the *complex input impedance* of this RLC series circuit.

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 12.4

Condider {numref}`fig:complex_imp` and give an expression for $V_c(s)$.

+++ {"slideshow": {"slide_type": "notes"}}

**OneNote Class Notebook Scratch Pad**

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

(ex:12.5)=
### Example 12.5

For the network shown in {numref}`fig:ex12.5`, all the complex impedance values are given in $\Omega$ (ohms). 

![Circuit for example 4](pictures/example4.png)

Find $Z(s)$ using:
    
1. nodal analysis
2. by successive application of parallel and series combination of impedences

+++ {"slideshow": {"slide_type": "notes"}}

#### 1. Solution by nodal analysis

**OneNote Class Notebook Scratch Pad**

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "notes"}}

#### 2. Solution by by successive application of parallel and series combination of impedences

**OneNote Class Notebook Scratch Pad**

<pre style="border: 2px solid blue">















</pre>

**Solutions**: Pencasts [ex4_1.pdf](https://cpjobling.github.io/eg-247-textbook/laplace_transform/worked_examples/ex4_1.pdf) and [ex4_2.pdf](https://cpjobling.github.io/eg-247-textbook/laplace_transform/worked_examples/ex4_2.pdf) &ndash; open in Adobe Acrobat.

+++ {"slideshow": {"slide_type": "subslide"}}

(ex:12.6)=
### Example 12.6 - Do It Yourself

Compute $Z(s)$ and $Y(s)$ for the circuit shown below. All impedence values are in $\Omega$ (ohms). Verify your answers with MATLAB.

![Circuit for Example 5](pictures/example5.png)

+++ {"slideshow": {"slide_type": "notes"}}

####  Solution 12.6 

**OneNote Class Notebook Scratch Pad**
<pre style="border: 2px solid blue">
























</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

#### Answer 12.6

$$Z(s) = \frac{65s^4 + 490s^3 + 528s^2 + 400s + 128}{s(5s^2 + 30s + 16)}$$

$$Y(s) = \frac{1}{Z(s)} = \frac{s(5s^2 + 30s + 16)}{65s^4 + 490s^3 + 528s^2 + 400s + 128}$$

Matlab verification: [solution5.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/solution5.m)

+++ {"slideshow": {"slide_type": "subslide"}}

(mat:12.6)=
#### Example 5: Verification of Solution

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
syms s;

z1 = 13*s + 8/s;
z2 = 5*s + 10;
z3 = 20 + 16/s;
```

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
z = z1 + z2 * z3 /(z2 + z3)
```

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
z10 = simplify(z)
```

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
pretty(z10)
```

##### Admittance

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
y10 = 1/z10;
pretty(y10)
```

## Lab Work

In MATLAB Lab 5, we will explore the tools provided by MATLAB for solving circuit analysis problems.

+++

## Summary

In this section we have looked at the application of the Laplace transform to circuit analysis.

* {ref}`circuit_transforms`

* {ref}`complex_impedance`

* {ref}`complex_admittance`

* {ref}`examples12`

## Take Aways

+++ {"slideshow": {"slide_type": "subslide"}}

## Next time

We move on to consider 

* {ref}`unit4.6`

## References

```{bibliography}
:filter: docname in docnames
```

+++ {"slideshow": {"slide_type": "slide"}}

(matlab_solutions12)=
## Matlab Solutions

For convenience, single script MATLAB solutions to the examples are provided and can be downloaded from the accompanying [MATLAB](https://github.com/cpjobling/eg-247-textbook/tree/master/laplace_transform/matlab) folder in the [GitHub repository](https://github.com/cpjobling/eg-247-textbook).

* Solution 3 [[solution3.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/solution3.m)]
* Solution 5 [[solution5.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/solution5.m)]
