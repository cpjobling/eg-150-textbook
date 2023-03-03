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

(laplace_4_circs)=
# Using Laplace Transforms for Circuit Analysis

+++ {"slideshow": {"slide_type": "notes"}}

The preparatory reading for this section is [Chapter 4](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=3384197&ppg=101) {cite}`karris` which presents examples of the applications of the Laplace transform for electrical solving circuit problems. Much of the same material is covered in Section ... of {cite}`schaum`.

+++ {"slideshow": {"slide_type": "slide"}}

## Agenda

We look at applications of the Laplace Transform for

* {ref}`cicuit_transforms`

* {ref}`complex_impedance`

* {ref}`complex_admittance`

* {ref}`examples11`

+++ {"slideshow": {"slide_type": "slide"}}

(circuit_transforms)=
## Circuit Transformation from Time to Complex Frequency

+++ {"slideshow": {"slide_type": "subslide"}}

(resistive_network}=
### Time Domain Model of a Resistive Network

![Resistive Network: Time Domain](pictures/resistive_time.png)

+++ {"slideshow": {"slide_type": "notes"}}

#### In the time domain

The voltage across the resistor is 

$$v_R(t) = R i_R(t)$$ (eq:vrt)

$$i_R(t) = \frac{v_r(t)}{R}$$ (eq:irt)




+++ {"slideshow": {"slide_type": "subslide"}}

For the circuit shown, which of the following equations represent the Laplace transform of the current flowing through, and the voltage across, the resistor $R$?

+++ {"slideshow": {"slide_type": "fragment"}}

$$V_R(s) = RI_R(s)$$

$$I_R(s) + \frac{V_R(s)}{R}$$
    
$$V_R(s) = \frac{I_R(s)}{R}$$
    
$$I_R(s) = RV_R(s)$$

+++ {"slideshow": {"slide_type": "fragment"}}

**-> Open poll**

+++ {"slideshow": {"slide_type": "notes"}}

#### In the complex frequency domain

We take the Laplace transforms of {ref}`eq:vrt` and {ref}`eq:irt` to obtain

$$V_R(s) = R I_R(s)$$ (eq:Vrs)

$$I_R(t) = \frac{V_r(s)}{R}$$ (eq:Irs)

```{note}
The current and voltage are transformed but the resitance is unchanged by the transformation.
```




+++ {"slideshow": {"slide_type": "subslide"}}

(complex_resistive_network)=
###  Complex Frequency Domain Model of a Resistive Circuit

![Resistive Network - Complex Frequency Domain](pictures/resistive_freq.png)

+++ {"slideshow": {"slide_type": "subslide"}}

(inductive_network)=
###  Time Domain Model of an Inductive Network

![Inductive Network - Time Domain](pictures/inductive_time.png)

+++ {"slideshow": {"slide_type": "subslide"}}

For the circuit shown, which of the following equations represent the Laplace transform of the current flowing through, and the voltage across, the inductor $L$?

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

![Inductive Network - Complex Frequency Domain](pictures/inductive_freq.png)

+++ {"slideshow": {"slide_type": "subslide"}}

(capacitive_network)=
### Time Domain Model of a Capacitive Network

![Capacitive Network - Time Domain](pictures/capacitive_time.png)

+++ {"slideshow": {"slide_type": "subslide"}}

### Complex Frequency Domain of a Capacitive Network

![Capacitive Network - Complex Frequency Domain](pictures/capacitive_freq.png)

+++ {"slideshow": {"slide_type": "slide"}}

## Complex Impedance $Z(s)$

Consider the $s$-domain RLC series circuit, where the initial conditions are assumed to be zero.

![Complex Impedance $Z(s)$](pictures/impedence.png)

+++ {"slideshow": {"slide_type": "subslide"}}

For this circuit, the sum

$$R + sL + \frac{1}{sC}$$ 

represents that total opposition to current flow. Then,

$$I(s) = \frac{V_s(s)}{R + sL + 1/(sC)}$$

+++ {"slideshow": {"slide_type": "subslide"}}

and defining the ratio $V_s(s)/I(s)$ as $Z(s)$, we obtain

$$Z(s) = \frac{V_s(s)}{I(s)} = R + sL + \frac{1}{sC}$$

+++ {"slideshow": {"slide_type": "subslide"}}

The $s$-domain current $I(s)$ can be found from 

$$I(s) = \frac{V_s(s)}{Z(s)}$$

where

$$Z(s) = R + sL + \frac{1}{sC}.$$

+++ {"slideshow": {"slide_type": "subslide"}}

Since $s = \sigma + j\omega$ is a complex number, $Z(s)$ is also complex and is known as the *complex input impedance* of this RLC series circuit.

+++ {"slideshow": {"slide_type": "slide"}}

## Complex Admittance $Y(s)$

Consider the $s$-domain GLC parallel circuit shown below where the initial conditions are zero.

![Complex admittance $Y(s)$](pictures/admittance.png)

+++ {"slideshow": {"slide_type": "subslide"}}

For this circuit

$$GV(s)+ \frac{1}{sL}V(s) + sCV(s) = I_s(s)$$

$$\left(G+ \frac{1}{sL} + sC\right)V(s) = I_s(s)$$

+++ {"slideshow": {"slide_type": "subslide"}}

Defining the ratio $I_s(s)/V(s)$ as $Y(s)$ we obtain

$$Y(s)=\frac{I_s(s)}{V(s)} = G+ \frac{1}{sL} + sC = \frac{1}{Z(s)}$$

+++ {"slideshow": {"slide_type": "subslide"}}

The $s$-domain voltage $V(s)$ can be found from 

$$V(s) = \frac{I_s(s)}{Y(s)}$$

where

$$Y(s) = G + \frac{1}{sL} + sC.$$

+++ {"slideshow": {"slide_type": "subslide"}}

$Y(s)$ is complex and is known as the *complex input admittance* of this GLC parallel circuit.

## Reference

See [Bibliography](/zbib).

+++ {"slideshow": {"slide_type": "subslide"}}

(examples12)=
## Examples 12

We will work through these in class.

+++ {"slideshow": {"slide_type": "subslide"}}

###  Time Domain Model of an Inductive Network

![Inductive Network - Time Domain](pictures/inductive_time.png)

+++ {"slideshow": {"slide_type": "subslide"}}

### Time Domain Model of a Capacitive Network

![Capacitive Network - Time Domain](pictures/capacitive_time.png)

+++ {"slideshow": {"slide_type": "subslide"}}

For the circuit shown, which of the following equations represent the Laplace transform of the current flowing through, and the voltage across, the capacitor $C$?

+++ {"slideshow": {"slide_type": "fragment"}}

$$V_c(s)=sCI_C(s) - Ci_C(0^-)$$

$$I_c(s) = sCV_C(s) - Cv_C(0^-)$$

$$V_c(s) = \frac{I_C(s)}{sC} + \frac{i_C(0^-)}{s}$$

$$I_c(s)=\frac{V_C(s)}{sC} + \frac{v_C(0^-)}{s}$$

+++ {"slideshow": {"slide_type": "fragment"}}

**-> Open poll**

+++ {"slideshow": {"slide_type": "slide"}}

## Examples

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 1

Use the Laplace transform method and apply Kirchoff's Current Law (KCL) to find the voltage $v_c(t)$ across the capacitor for the circuit below given that $v_c(0^-) = 6$ V.

![Circuit for Example 1](pictures/example1_2.png)

+++ {"slideshow": {"slide_type": "skip"}}

<pre style="border: 2px solid blue">



























</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 2

Use the Laplace transform method and apply Kirchoff's Voltage Law (KVL) to find the voltage $v_c(t)$ across the capacitor for the circuit below given that $v_c(0^-) = 6$ V.

![Circuit for Example 2](pictures/example1_2.png)

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">




























</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 3

In the circuit below, switch $S_1$ closes at $t=0$, while at the same time, switch $S_2$ opens. Use the Laplace transform method to find $v_{\mathrm{out}}(t)$ for $t > 0$.

![Circuit for Example 3](pictures/example3.png)

+++ {"slideshow": {"slide_type": "subslide"}}

Show with the assistance of MATLAB (See [solution3.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/solution3.m)) that the solution is

$$V_{\mathrm{out}}=\left(1.36e^{-6.57t}+0.64e^{-0.715t}\cos 0.316t - 1.84e^{-0.715t}\sin 0.316t\right)u_0(t)$$

and plot the result.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Solution to Example 3

We will use a combination of pen-and-paper and MATLAB to solve this.

+++ {"slideshow": {"slide_type": "subslide"}}

##### 1. Equivalent Circuit

Draw equivalent circuit at $t=0$

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">




























</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

##### 2. Transform model

Convert to transforms

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">




























</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

##### 3. Determine equation

Determine equation for $V_{\rm out}(s)$.

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">























</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

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
  slide_type: subslide
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

+++ {"slideshow": {"slide_type": "slide"}}

## Complex Impedance $Z(s)$

For the resistance $R$$\Omega$, inductance $L$H and capacitance $C$F, which of the following represent the complex impedance of the components?

+++ {"slideshow": {"slide_type": "notes"}}

$$sL$$

$$1/R$$

$$sC$$

$$\frac{1}{sC}$$

$$\frac{1}{sL}$$

$$R$$

+++ {"slideshow": {"slide_type": "fragment"}}

**-> Open Poll**

+++ {"slideshow": {"slide_type": "subslide"}}

Consider the $s$-domain RLC series circuit, wehere the initial conditions are assumed to be zero.

![Complex Impedance $Z(s)$](pictures/impedence.png)

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

### Exercise

Use the previous result to give an expression for $V_c(s)$

+++ {"slideshow": {"slide_type": "skip"}}

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 4

For the network shown below, all the complex impedance values are given in $\Omega$ (ohms). 

![Circuit for example 4](pictures/example4.png)

Find $Z(s)$ using:
    
1. nodal analysis
2. successive combinations of series and parallel impedances

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">















</pre>

**Solutions**: Pencasts [ex4_1.pdf](https://cpjobling.github.io/eg-247-textbook/laplace_transform/worked_examples/ex4_1.pdf) and [ex4_2.pdf](https://cpjobling.github.io/eg-247-textbook/laplace_transform/worked_examples/ex4_2.pdf) &ndash; open in Adobe Acrobat.

+++ {"slideshow": {"slide_type": "slide"}}

## Complex Admittance $Y(s)$

For the resistor $R$Ω, inductor $L$H and capacitance $C$F, which of the following represent the complex admittance of the components?

+++ {"slideshow": {"slide_type": "notes"}}

$$sL$$

$$1/R$$

$$sC$$

$$\frac{1}{sC}$$

$$\frac{1}{sL}$$

$$R$$

+++ {"slideshow": {"slide_type": "fragment"}}

**-> Open Poll**

+++ {"slideshow": {"slide_type": "subslide"}}

Consider the $s$-domain GLC parallel circuit shown below where the initial conditions are zero.

![Complex admittance $Y(s)$](pictures/admittance.png)

For this circuit

$$GV(s)+ \frac{1}{sL}V(s) + sCV(s) = I_s(s)$$

$$\left(G+ \frac{1}{sL} + sC\right)V(s) = I_s(s)$$

Defining the ratio $I_s(s)/V(s)$ as $Y(s)$ we obtain

$$Y(s)=\frac{I_s(s)}{V(s)} = G+ \frac{1}{sL} + sC = \frac{1}{Z(s)}$$

+++ {"slideshow": {"slide_type": "subslide"}}

The $s$-domain voltage $V(s)$ can be found from 

$$V(s) = \frac{I_s(s)}{Y(s)}$$

where

$$Y(s) = G + \frac{1}{sL} + sC.$$

$Y(s)$ is complex and is known as the *complex input admittance* of this GLC parallel circuit.

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 5 - Do It Yourself

Compute $Z(s)$ and $Y(s)$ for the circuit shown below. All impedence values are in $\Omega$ (ohms). Verify your answers with MATLAB.

![Circuit for Example 5](pictures/example5.png)

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

#### Answer 5

$$Z(s) = \frac{65s^4 + 490s^3 + 528s^2 + 400s + 128}{s(5s^2 + 30s + 16)}$$

$$Y(s) = \frac{1}{Z(s)} = \frac{s(5s^2 + 30s + 16)}{65s^4 + 490s^3 + 528s^2 + 400s + 128}$$

Matlab verification: [solution5.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/solution5.m)

+++ {"slideshow": {"slide_type": "subslide"}}

##### Example 5: Verification of Solution

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

+++ {"slideshow": {"slide_type": "slide"}}

## Matlab Solutions

For convenience, single script MATLAB solutions to the examples are provided and can be downloaded from the accompanying [MATLAB](https://github.com/cpjobling/eg-247-textbook/tree/master/laplace_transform/matlab) folder in the [GitHub repository](https://github.com/cpjobling/eg-247-textbook).

* Solution 3 [[solution3.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/solution3.m)]
* Solution 5 [[solution5.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/solution5.m)]

```{code-cell}
---
slideshow:
  slide_type: fragment
tags: [remove-output]
---
cd ../matlab
ls
open solution3
open solution5
```
