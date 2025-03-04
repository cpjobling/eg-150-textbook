---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.16.6
kernelspec:
  display_name: MATLAB Kernel
  language: matlab
  name: jupyter_matlab_kernel
---

+++ {"slideshow": {"slide_type": "slide"}}

(unit4.4)=
# Unit 4.4 The Inverse Laplace Transform

+++ {"slideshow": {"slide_type": "notes"}}

Follow along at [cpjobling.github.io/eg-150-textbook/laplace_transform/4/inverse_laplace](https://cpjobling.github.io/eg-150-textbook/laplace_transform/4/inverse_laplace)

![QR Code for this lecture](pictures/qrcode_laplace4.png)

+++ {"slideshow": {"slide_type": "subslide"}}

(ilap:into)=
## Introduction

The preparatory reading for this section is [Chapter 3](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=3384197&ppg=75#ppg=79) of {cite}`karris` which

* defines the Inverse Laplace transformation 
* gives several examples of how the Inverse Laplace Transform may be obtained
* thouroughly decribes the Partial Fraction Expansion method of converting complex rational polymial expressions into simple first-order and quadratic terms
* demonstrates the use of MATLAB for finding the poles and residues of a rational polymial in s and the symbolic inverse laplace transform.

There is additional coverage, including many worked problems in Chapter 3.5 of {cite}`schaum`.

We will explore the use of MATLAB to solve inverse Laplace tranforms in MATLAB Lab 4.

+++ {"slideshow": {"slide_type": "notes"}}

## Agenda

* {ref}`ilap:defn`
* {ref}`ilap:pfe`
* {ref}`ilap_by_pfe`
* {ref}`examples11`

+++ {"slideshow": {"slide_type": "slide"}}

(ilap:defn)=
## Definition

The formal definition of the inverse Laplace transform is

$$\mathcal{L}^{-1}\left\{ F(s) \right\} = \frac{1}{2\pi j}\int_{\sigma-j\omega}^{\sigma+j\omega} F(s)e^{st}ds$$ (eq:4.4:1)

but this is difficult to use in practice because it requires contour integration using complex variable theory.

+++ {"slideshow": {"slide_type": "subslide"}}

For most engineering problems we can instead refer to **Tables of Properties** and **Common Transform Pairs** to look up the *Inverse Laplace Transform*.

+++ {"slideshow": {"slide_type": "subslide"}}

(Or, if we are not taking an exam, we can use a computer or mobile device.)

+++ {"slideshow": {"slide_type": "slide"}}

(ilap:pfe)=
## Partial Fraction Expansion

Quite often the Laplace Transform we start off with is a *rational polynomial* in $s$.

$$F(s) = \frac{N(s)}{D(s)} = \frac{b_ms^m + b_{m-1}s^{m-1}+b_{m-2}s^{m-2}+ \cdots +b_{1}s+b_{0}}{a_ns^n + a_{n-1}s^{n-1}+a_{n-2}s^{n-2}+ \cdots +a_{1}s+a_{0}}$$ (eq:4.4:2)

The coefficients $a_n$ and $b_n$ are real for $n = 1, 2, 3, \ldots$

+++ {"slideshow": {"slide_type": "subslide"}}

### Proper and Improper Rational Functions

* If $m < n$ $F(s)$ is said to be a *proper rational function*. 
* If $m \ge n$ $F(s)$ is said to be an *improper rational function* 

(Think [proper fractions](https://www.mathsisfun.com/proper-fractions.html) and [improper fractions](https://www.mathsisfun.com/improper-fractions.html).)

+++ {"slideshow": {"slide_type": "subslide"}}

### Zeros

* The *roots* of the numerator polymonial $N(s)$ are found by setting $N(s)=0$
* When $s$ equals one of the $m$ roots of $N(s)$ then $F(s)$ will be zero.
* Thus the roots of $N(s)$ are the **zeros** of $F(s)$.

+++ {"slideshow": {"slide_type": "subslide"}}

### Poles

* The *roots* (*zeros*) of the denominator polynomial are found by setting $D(s) = 0$. 
* When $s$ equals one of the $n$ roots of $D(s)$ then $F(s)$ will be infinite $F(s_r) = N(s_r)/0=\infty$).
* These are called the **poles** of $F(s)$.

(Imagine telegraph poles planted at the points on the $s$-plane where $D(s)$ is zero.)

+++ {"slideshow": {"slide_type": "subslide"}}

### A Further Simplifying Assumption

If $F(s)$ is proper then it is conventional to make the coefficient $s_n$ unity thus:

$$F(s) = \frac{N(s)}{D(s)} = \frac{1/{a_n}\left({ {b_m}{s^m} + {b_{m - 1}}{s^{m - 1}} + {b_{m - 2}}{s^{m - 2}} +  \cdots  + {b_1}s + {b_0}} \right)}{s^n + \frac{a_{n - 1}}{a_n}{s^{n - 1}} + \frac{a_{n - 2}}{a_n}{s^{n - 2}} +  \cdots  + \frac{a_1}{a_n}s + \frac{a_0}{a_n}}$$ (eq:4.4:3)

(I know it doesn't look simpler, but remember that the $a$ and $b$ coefficients are numbers in practice!)

+++ {"slideshow": {"slide_type": "slide"}}

(ilap_by_pfe)=
## Inverse Laplace Transform by Partial Fraction Expansion (PFE)

The poles of $F(s)$ can be real and distinct, real and repeated, complex conjugate pairs, or a combination.

+++ {"slideshow": {"slide_type": "subslide"}}

### Defining the problem

The nature of the poles governs the best way to tackle the PFE that leads to the solution of the Inverse Laplace Transform. Thus, we need to structure our presentation to cover one of the following cases:

* The case where $F(s)$ has distinct real poles
* The case where $F(s)$ has complex poles
* The case where $F(s)$ has repeated poles
* The case where $F(s)$ is an improper rational polynomial

We will examine each case by means of a worked example. Please refer to Chapter 3 of Karris for full details.

+++ {"slideshow": {"slide_type": "slide"}}

(ilap:distinct_real_poles)=
## The case of the distinct real poles

+++ {"slideshow": {"slide_type": "fragment"}}

If the poles $p_1,\,p_2,\,p_3,\,\ldots,\, p_n$ are *distinct* we can factor the denominator of $F(s)$ in the form 

$$F(s) = \frac{N(s)}{(s-p_1)(s-p_2)(s-p_3)\ldots(s-p_n)}$$ (eq:4.4:4)

+++ {"slideshow": {"slide_type": "subslide"}}

Next, using *partial fraction expansion*

$$F(s)=\frac{r_1}{s-p_1}+\frac{r_2}{s-p_2}+\frac{r_3}{s-p_3}+\cdots + \frac{r_n}{s-p_n}$$ ((eq:4.4:5)

+++ {"slideshow": {"slide_type": "subslide"}}

To evaluate the *residue* $r_k$, we multiply both sides by $(s-p_k)$ then let $s \to p_k$

$$r_k = \lim_{s\to p_k}(s-p_k)F(s) = \left.(s-p_k)F(s)\right|_{s=p_k}$$ (eq:4.4:6)

+++ {"slideshow": {"slide_type": "slide"}}

(case:complex_poles)=
## The case of the complex poles

Quite often the poles of $F(s)$ are complex and because the complex poles occur as complex conjugate pairs, the number of complex poles is even. Thus if $p_k$ is a complex root of $D(s)$ then its complex conjugate $p_k^*$ is also a root of $D(s)$.

You can still use the PFE with complex poles, as demonstrated in Pages 3-5&mdash;3-7 in the textbook. However it is easier to use the fact that complex poles will appear as quadratic factors of the form $s^2 + as + b$ and then call on the two transforms in the PFE


$$\frac{\omega}{(s - a)^2 + \omega^2} \Leftrightarrow e^{at}\sin\;\omega t$$ (eq:4.4:7)

$$\frac{s + a}{(s - a)^2 + \omega^2} \Leftrightarrow e^{at}\cos\;\omega t$$ (eq:4.4:8)

+++ {"slideshow": {"slide_type": "slide"}}

(ilap:repeated_poles)=
## The case of the repeated poles

When a rational polynomial has repeated poles 

$$F(s) = \frac{N(s)}{(s - p_1)^m(s - p_2)\cdots(s - p_{n-1})(s-p_0)}$$ (eq:4.4:9)

and the PFE will have the form:

$$\begin{array}{c}
F(s) = \frac{r_{11}}{(s - {p_1})^m} + \frac{r_{12}}{(s - {p_1})^{m - 1}} + \frac{r_{13}}{(s - {p_1})^{m - 2}} +  \cdots  + \frac{r_{1}}{(s - {p_1})}\\
 + \frac{r_2}{(s - {p_2})} + \frac{r_3}{(s - {p_3})} +  \cdots  + \frac{r_n}{(s - {p_n})}
\end{array}$$

+++ {"slideshow": {"slide_type": "subslide"}}

The ordinary residues $r_k$ can be found using the rule used for distinct roots.

To find the residuals for the repeated term $r_{1k}$ we need to multiply both sides of the expression by $(s+p_1)^m$ and take repeated derivatives as described in detail in Pages 3-7&mdash;3-9 of the text book. This yields the general formula

$$r_{1k}=\lim_{s\to p_1}\frac{1}{(k-1)!}\frac{d^{k-1}}{ds^{k-1}}\left[(s-p_1)^mF(s)\right]$$ ((eq:4.4:10)

which in the age of computers is rarely needed.

+++ {"slideshow": {"slide_type": "subslide"}}

(ilap:improper)=
## The case of the improper rational polynomial

If $F(s)$ is an improper rational polynomial, that is $m \ge n$, we must first divide the numerator $N(s)$ by the denomonator $D(s)$ to derive an expression of the form

$$F(s) = k_0 + k_1s + k_2s^2 + \cdots + k_{m-n}s^{m-n} + \frac{N(s)}{D(s)}$$ ((eq:4.4:11)

and then $N(s)/D(s)$ will be a proper rational polynomial.

+++ {"slideshow": {"slide_type": "slide"}}

(examples11)=
## Exercises 11: Inverse Laplace Transforms

+++ {"slideshow": {"slide_type": "fragment"}}

Lecturer clear all cells and set up MATLAB

```{code-cell}
---
slideshow:
  slide_type: fragment
---
clear all
% setappdata(0, "MKernel_plot_format", 'svg')
format compact
```

+++ {"slideshow": {"slide_type": "slide"}}

(ex11.1)=
### Exercise 11.1: Real Poles

Use the PFE method to simplify $F_1(s)$ below and find the time domain function $f_1(t)$ corresponding to $F_1(s)$

$$F_1(s) = \frac{2s+5}{s^2 + 5s + 6}$$

(Quick solution: [Wolfram Alpha](https://www.wolframalpha.com/input/?i=inverse+laplace+transform+%7B(2s+%2B+5)%2F(s%5E2+%2B+5s+%2B+6)%7D))

+++ {"slideshow": {"slide_type": "subslide"}}

(mat_hand:11.1)=
#### Paper Solution

See OneNote class notebook: [Unit 4.4: The Inverse Transform](https://swanseauniversity-my.sharepoint.com/personal/c_p_jobling_swansea_ac_uk/_layouts/15/Doc.aspx?sourcedoc={34a55801-0fba-4ce2-8b37-c499c1df83c3}&action=edit&wd=target%28_Content%20Library%2FVirtual%20Whiteboard.one%7Cd116af2c-1310-234d-91a6-4f1631dbf5db%2FUnit%204.4%20The%20Inverse%20Transform%7C1fe268d6-ec91-41fb-89a0-bfd9b8d7a6f5%2F%29&wdorigin=703).

+++ {"slideshow": {"slide_type": "subslide"}}

(mat_num:11.1)=
#### MATLAB Solution - Numerical

```{code-cell}
---
slideshow:
  slide_type: fragment
---
Ns = [2, 5]; Ds = [1, 5, 6];
[r,p,k] = residue(Ns, Ds)
```

+++ {"slideshow": {"slide_type": "subslide"}}

The previous resuly should be interpreted as:

$$F_1(s) = \frac{1}{s + 3} + \frac{1}{s + 2}$$

+++ {"slideshow": {"slide_type": "fragment"}}

which because of the linearity property of the Laplace Transform and using tables results in the *Inverse Laplace Transform*

$$f_1(t) = e^{-3t}u_0(t) + e^{-2t}u_0(t)$$

+++ {"slideshow": {"slide_type": "subslide"}}

(mat_sym:11.1)=
#### MATLAB solution - symbolic

Recall that in MATLAB the `laplace` operator is the single sided Laplace transform, so the presence of $u_0(t)$ in the answers given by `ilaplace` is implied.

```{code-cell}
---
slideshow:
  slide_type: fragment
---
syms s t;
F1s = (2*s + 5)/(s^2 + 5*s + 6);
f1t = ilaplace(F1s)
fplot(f1t,[0,5]),title('Solution to Exercise 11.1'),grid,ylabel('f_1(t)'),xlabel('t [s]')
```

+++ {"slideshow": {"slide_type": "slide"}}

(ex:11.2)=
### Exercise 11.2: Cubic with Real Poles

Determine the Inverse Laplace Transform of

$$F_2(s) = \frac{3s^2+2s+5}{s^3 + 9s^2 + 23s + 15}$$

(Quick solution: [Wolfram Alpha](https://www.wolframalpha.com/input/?i=inverse+laplace+transform+%283s%5E2+%2B+2s+%2B+5%29%2F%28s%5E3+%2B+9s%5E2+%2B+23s+%2B+15%29))

+++ {"slideshow": {"slide_type": "subslide"}}

(solution:11.2)=
#### Solution 11.2

Because the denominator of $F_2(s)$ is a cubic, it will be difficult to factorise without computer assistance so we use MATLAB to factorise $D(s)$

```{code-cell}
---
slideshow:
  slide_type: subslide
---
syms s;
factor(s^3 + 9*s^2 + 23*s + 15)
```

+++ {"slideshow": {"slide_type": "subslide"}}

In an exam you'd be given the factors

+++ {"slideshow": {"slide_type": "subslide"}}

The problem becomes: determine the Inverse Laplace Transform of

$$F_2(s) = \frac{3s^2+2s+5}{(s+1)(s+3)(s+5)}$$

which we will solve in class.

+++ {"slideshow": {"slide_type": "subslide"}}

(mat_hand:11.2)=
#### Paper Solution

See OneNote class notebook: [Unit 4.4: The Inverse Transform](https://swanseauniversity-my.sharepoint.com/personal/c_p_jobling_swansea_ac_uk/_layouts/15/Doc.aspx?sourcedoc={34a55801-0fba-4ce2-8b37-c499c1df83c3}&action=edit&wd=target%28_Content%20Library%2FVirtual%20Whiteboard.one%7Cd116af2c-1310-234d-91a6-4f1631dbf5db%2FUnit%204.4%20The%20Inverse%20Transform%7C1fe268d6-ec91-41fb-89a0-bfd9b8d7a6f5%2F%29&wdorigin=703).

+++ {"slideshow": {"slide_type": "subslide"}}

The solution checked with MATLAB should be

$$f_1(t) = \frac{3}{4}e^{-t} - \frac{13}{2}e^{-3t} + \frac{35}{4}e^{-5t}$$

+++

(mat_sym:11.2)=
#### Symbolic Solution

```{code-cell}
F2s = (3*s^2 + 2*s + 5)/((s+1)*(s+3)*(s+5))
f2t = ilaplace(F2s)
fplot(f2t,[0,5]),grid,title('Solution to Exercise 11.2'),ylabel('f_2(t)'),xlabel('t [s]')
```

+++ {"slideshow": {"slide_type": "slide"}}

(ex:11.3)=
### Exercise 11.3: System with Complex Poles

Rework Example 3-2 from the {cite}`karris` using quadratic factors.

Find the Inverse Laplace Transform of 

$$F_3(s) = \frac{s + 3}{(s+1)(s^2 + 4s + 8)}$$ (pfe1)

(Quick solution: [Wolfram Alpha](https://www.wolframalpha.com/input/?i=inverse+laplace+transform+%28s%2B3%29%2F%28%28s+%2B+1%29%28s%5E2+%2B+4s+%2B+8%29%29) &ndash; Shows that the computer is not always best!)

+++ {"slideshow": {"slide_type": "subslide"}}

#### Solution 11.3

We know that one pole is real at $s=-1$. We can use the PFE in the usual way to find the residue $r_1$ that corresponds to that pole.

+++ {"slideshow": {"slide_type": "subslide"}}

We can use `residue` to find the other two poles, but the poles and the residues will both be complex:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
Ns = [1 3]; Ds = conv([1 1],[1 4 8]) % conv of two vectors is polynomial multiplication
[r,p,k]=residue(Ns,Ds)
```

+++ {"slideshow": {"slide_type": "slide"}}

We can use PFE to solve this, as is done in Section 3.2.2 of {cite}`nise`, but the mathematics is quite challenging.

+++ {"slideshow": {"slide_type": "fragment"}}

Instead, we assume that the solution will have the structure

$$F_3(s) = \frac{2/5}{s+1} + r_2\frac{\omega}{(s + a)^2 + \omega^2} + r_3\frac{s+a}{(s+a)^2 + \omega^2}$$

and solve the PFE using simultaneous equations to determine $r_2$ and $r_3$.

+++ {"slideshow": {"slide_type": "subslide"}}

Complete the square on the quadratic term:

$$s^2 + 4s + 8 = (s + 2)^2 + 4$$

Then comparing this with the desired form $(s + a)^2 + \omega^2$, we have $a = 2$ and $\omega^2 = 4 \to \omega = \sqrt{4} = 2$.

+++ {"slideshow": {"slide_type": "subslide"}}

To solve this, we need to find the PFE for the assumed solution:

$$F_3(s) = \frac{2/5}{s+1} + r_2\frac{2}{(s + 2)^2 + 2^2} + r_3\frac{s + 2}{(s + 2)^2 + 2^2}  $$ (pfe2)

+++ {"slideshow": {"slide_type": "fragment"}}

which we do by equating {eq}`pfe2` to {eq}`pfe1`, 

$$\frac{s + 3}{(s+1)(s^2 + 4s + 8)} = \frac{2/5}{s+1} + r_2\frac{2}{(s + 2)^2 + 2^2} + r_3\frac{s + 2}{(s + 2)^2 + 2^2}$$ (pfe3)

+++ {"slideshow": {"slide_type": "subslide"}}

putting both sides on a common denominator, 

$$\frac{s+3}{(s+1)(s^2 + 4s + 8)} = \frac{(2/5)(s^2 + 4s + 8) + r_2(s + 1) + r_3(s + 1)(s + 2)}{(s+1)(s^2 + 4s + 8)}$$ (pfe4)

+++ {"slideshow": {"slide_type": "fragment"}}

and then solving for $r_2$ and $r_3$ by equating the numerator coefficients on the left and right sides.

$$s+3 = (2/5)(s^2 + 4s + 8) + r_2(s + 1) + r_3(s^2 + 3s + 2)$$

+++ {"slideshow": {"slide_type": "fragment"}}

The completion of this problem is left as a *homework exercise* for the student.

+++ {"slideshow": {"slide_type": "subslide"}}

The solution should be:

$$f_3(t) = \frac{2}{5}e^{-t} + \frac{3}{10} e^{-2t}\sin 2t - \frac{2}{5} e^{-2t}\cos 2t $$ (pfe5)

You can use trig. identities to simplify this further if you wish.

+++ {"slideshow": {"slide_type": "subslide"}}

(mat_sym:11.3)=
#### Symbolic solution

```{code-cell}
F3s = (s+3)/((s+1)*(s^2 + 4*s + 8))
f3t = ilaplace(F3s)
fplot(f3t,[0,10]),ylim([0,0.3]),grid,title('Solution to Exercise 11.3'),ylabel('f_3(t)'),xlabel('t [s]')
```

+++ {"slideshow": {"slide_type": "slide"}}

(ex11.4)=
### Exercise 11.4: Repeated Real Poles

Find the inverse Laplace Transform of 

$$F_4(s) = \frac{s+3}{(s+2)(s+1)^2}$$

+++ {"slideshow": {"slide_type": "subslide"}}

Note that the transform

$$te^{at} \Leftrightarrow \frac{1}{(s - a)^2}$$

and the derivative of a quotient rule

$$\frac{d}{ds}\left(\frac{N(s)}{D(s)}\right) = \frac{D(s)\frac{dN(s)}{ds} - N(s)\frac{dD(s)}{ds}}{D(s)^2}$$

will be useful.

(Quick solution: [Wolfram Alpha](https://www.wolframalpha.com/input/?i=inverse+laplace+transform+%28s%2B3%29%2F%28%28s%2B2%29%28s+%2B+1%29%5E2%29))

+++ {"slideshow": {"slide_type": "subslide"}}

(sol:11.4)=
#### Solution 11.4

We will leave the solution that makes use of the residude of repeated poles formula for you to study from the text book ([Example 3.4](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=3384197&ppg=87) {cite}`nise`). 

In class we will illustrate the slightly simpler approach also presented in the text. 

For exam preparation, I would recommend that you use whatever method you find most comfortable.

+++ {"slideshow": {"slide_type": "subslide"}}

Find the inverse Laplace Transform of 

$$F_4(s) = \frac{s+3}{(s+2)(s+1)^2}$$

+++ {"slideshow": {"slide_type": "subslide"}}

##### Symbolic solution

```{code-cell}
---
slideshow:
  slide_type: fragment
---
F4s = (s + 3)/((s+2)*(s+1)^2)
f4t = ilaplace(F4s)
fplot(f4t,[0,10]),grid,ylim([0,0.6]),title('Solution to Exercise 11.4'),ylabel('f_4(t)'),xlabel('t [s]')
```

+++ {"slideshow": {"slide_type": "subslide"}}

##### Numerical solution

We use function `conv` to perform polynomial mul

```{code-cell}
---
slideshow:
  slide_type: fragment
---
Ns = [1 3]
Ds = conv([1 2],conv([1 1],[1 1])) % (s + 2)*(s + 1)*(s + 1)
[r,p,k] = residue(Ns,Ds)
doc residue
```

+++ {"slideshow": {"slide_type": "notes"}}

To interpret this we refer to the MATLAB documentation `doc residue` which tells us, that for the pole at $s = -1$, the first residue (here $r_2 = -1$) is for the term $1/(s + 1)$ and the second (here $r_3 = 2$) is for $1/(s + 1)^2$. Thus the PFE is

$$F_4(s) = \frac{1}{s+2} - \frac{1}{s+1} + \frac{2}{(s+1)^2}$$

hence

$$f_4(t) = e^{-2t}u_0(t) - e^{-t}u_0(t) + 2te^{-t}u_0(t)$$

+++ {"slideshow": {"slide_type": "slide"}}

(ex11.5)=
### Exercise 11.5: Non-proper rational polynomial

Introduces some new transform pairs!

$$F_6(s)= \frac{s^2 + 2s + 2}{s+1}$$

(Quick solution: [Wolfram Alpha](https://www.wolframalpha.com/input/?i=inverse+laplace+transform+%28s%5E2+%2B+2s+%2B+2%29%2F%28s+%2B+1%29))

+++ {"slideshow": {"slide_type": "subslide"}}

(sol:11.5)=
#### Solution 11.5

Dividing $s^2 + 2s + 2$ by $s + 1$ gives

$$F_6(s) = s + 1 + \frac{1}{s+1}$$

$$\frac{1}{s+1} \Leftrightarrow e^{-t}$$

$$1 \Leftrightarrow \delta(t)$$

$$s \Leftrightarrow ?$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### What function of t has Laplace transform s?

Recall from Session 2:
    
$$\frac{d}{dt}u_0(t)=u_0'(t)=\delta(t)$$

and

$$\frac{d^2}{dt^2}u_0(t)=u_0''(t)=\delta'(t)$$

Also, by the time differentiation property

$$u_0''(t)=\delta'(t)\Leftrightarrow s^2\mathcal{L}u_0(t) - su_0(0^-) - \left.\frac{d}{dt}u_0(t)\right|_{t=0^-} =  s^2\frac{1}{s} = s$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### New Transform Pairs

$$s\Leftrightarrow \delta'(t)$$

$$\frac{d^n}{dt^n}\delta(t)\Leftrightarrow s^n$$

$$f_6(t) = e^{-t}+\delta(t)+\delta'(t)$$

+++ {"slideshow": {"slide_type": "subslide"}}

(mat:11.5)=
#### Matlab verification

```{code-cell}
---
slideshow:
  slide_type: fragment
---
Ns = [1, 2, 2]; Ds = [1 1];
[r, p, k] = residue(Ns, Ds)
```

```{code-cell}
---
slideshow:
  slide_type: fragment
---
syms s;
F6s = (s^2 + 2*s + 2)/(s + 1);
f6t = ilaplace(F6s)
```

+++ {"slideshow": {"slide_type": "slide"}}

## Lab Work

In MATLAB Lab 4, we will explore the tools provided by MATLAB for taking Laplace transforms, representing polynomials, finding roots and factorizing polynomials and solution of inverse Laplace transform problems.

+++ {"slideshow": {"slide_type": "slide"}}

(unit4.4:hw)=
## Unit 4.4: Homework

Complete {ref}`ex:11.3` to confirm the result {eq}`pfe4`. Then do the end of the chapter exercises (Section 3.67) from the {cite}`karris`. Don't look at the answers until you have attempted the problems.

+++ {"slideshow": {"slide_type": "notes"}}

## Summary

In this section we have looked at the inverse Laplace transform. In particular, how to solve continuous-time LTI system problems that take the form of rational polynomials in $s$. 

* {ref}`ilap:defn`
* {ref}`ilap:pfe`
* {ref}`ilap_by_pfe`
* {ref}`examples11`

+++ {"slideshow": {"slide_type": "notes"}}

(unit4.4:takeaways)=
## Unit 4.4: Take Aways

For causal signals and continuous-time LTI systems, the Laplace transform usually takes the form of a rational polynomial with general form $F(s)$ as shown in equation {eq}`eq:4.4:2`. The denominator of $F(s)$, $D(s)$, can always be factorised, and the factors (zeros of D(s), poles of F(s)) will be real $(s - p_k)$, real and repeated, such as $(s - p_k)^n$ or complex conjugate pairs $(s - \sigma_k - j\omega_k)(s - \sigma_k + j\omega_k)^1$, or a combination of these. 

Each such rational polynomial can then be represented as a *partial fraction* with *residues* $r_k$ whose values are determined by using one of the *partial fraction expansion* methods presented in this unit: 

* {ref}`ilap:distinct_real_poles`
* {ref}`case:complex_poles`
* {ref}`ilap:repeated_poles`
* {ref}`ilap:improper`

The factored polynomial which represents $F(s)$ can then be converted into the equivalent $f(t)$ by use of the *linearity property* ({ref}`lprops:linearity`) and tables of Laplace transforms (e.g. {ref}`ap:xform_table`).

### MATLAB

The inverse Laplace transform is given by the Symbolic math toolbox function `ilaplace`. We can determine the partial fraction of a rational polynomial with constant coefficients using the function `residue` we can factorise a symbolic polynomial using `factor` and expand a product of rational terms using `expand`. A symbolic polynomial with numerical coeffients can be converted into a numerial polynomial using `sym2poly` and you can go the other way using `poly2sym`. For more information and examples on how to use these functions please consult the [MATLAB help centre](https://uk.mathworks.com/help/index.html).

<hr/>

*Footnote* 

1 A pair of complex conjugate factors 

$$(s - \sigma - j\omega)(s - \sigma + j\omega)$$

can be represented as a single quadratic factor which, when $\sigma < 0$, will be

$$s^2 + 2\sigma s +(\sigma^2 + \omega^2)$$

By completing the square we get

$$(s + \sigma)^2 - \sigma^2 + (\sigma^2 + \omega^2) = \left((s + \sigma)^2 + \omega^2\right)$$

which implies that the inverse Laplace transform of a complex pole pair will be a linear combination of the damped cosine and sine transform pairs:

$$\frac{(s + \sigma)}{\left(s + \sigma\right)^2 + \omega^2}\Leftrightarrow e^{-\sigma t}\cos(\omega t)u_0(t) $$

$$\frac{\omega}{\left(s + \sigma\right)^2 + \omega^2}\Leftrightarrow e^{-\sigma t}\sin(\omega t)u_0(t) $$

+++ {"slideshow": {"slide_type": "notes"}}

## Next time

We move on to consider 

* {ref}`unit4.5`

## References

```{bibliography}
:filter: docname in docnames
```

+++ {"slideshow": {"slide_type": "slide"}}

(matlab_solutions11)=
## Matlab Solutions

For convenience, single script MATLAB solutions to the examples are provided and can be downloaded from the accompanying [MATLAB](https://github.com/cpjobling/eg-150-textbook/tree/master/laplace_transform/matlab) folder.

* Example 1 - Real poles [[ex11_1.m](https://cpjobling.github.io/eg-150-textbook/laplace_transform/matlab/ex11_1.m)]
* Example 2 - Real poles cubic denominator [[ex11_2.m](https://cpjobling.github.io/eg-150-textbook/laplace_transform/matlab/ex11_2.m)]
* Example 3 - Complex poles [[ex11_3.m](https://cpjobling.github.io/eg-150-textbook/laplace_transform/matlab/ex11_3.m)]
* Example 4 - Repeated real poles [[ex11_4.m](https://cpjobling.github.io/eg-150-textbook/laplace_transform/matlab/ex11_4.m)]
* Example 5 - Non proper rational polynomial [[ex11_5.m](https://cpjobling.github.io/eg-150-textbook/laplace_transform/matlab/ex11_5.m)]
