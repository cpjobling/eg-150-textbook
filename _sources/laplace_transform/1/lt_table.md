<!-- #region -->
# Common Laplace Transform Pairs

## Transforms of Elementary Signals

| &nbsp;  | $f(t)$                                         | $F(s)$                                              | ROC |
|---------|------------------------------------------------|-----------------------------------------------------|-----|
| 1       | $\displaystyle \delta(t)$                      | $\displaystyle 1$                                   | All $s$ |
| 2       | $\displaystyle \delta(t-a)$                    | $\displaystyle e^{-as}$                             | All $s$ |
| 3       | $\displaystyle u_0(t)$                         | $\displaystyle \frac{1}{s}$ | Re($s$) > 0 |
| 4       | $\displaystyle t u_0(t)$                       | $\displaystyle \frac{1}{s^2}$   | Re($s$) > 0 | 
| 5       | $\displaystyle t^n u_0(t)$                     | $\displaystyle \frac{n!}{s^{n+1}}$ | Re($s$) > 0 | 
| 6       | $\displaystyle e^{-at}u_0(t)$                  | $\displaystyle \frac{1}{s+a}$ | Re($s$) > $-$Re($a$) | 
| 7       | $\displaystyle t^n e^{-at} u_0(t)$             | $\displaystyle \frac{n!}{(s+a)^{n+1}}$              |  Re($s$) > $-$Re($a$) | 
| 8       | $\displaystyle \sin (\omega t) u_0(t)$         | $\displaystyle \frac{\omega}{s^2 + \omega^2}$       | Re($s$) > 0 | 
| 9       | $\displaystyle \cos (\omega t) u_0(t)$         | $\displaystyle \frac{s}{s^2 + \omega^2}$            | Re($s$) > 0 | 
| 10      | $\displaystyle e^{-at} \sin (\omega t) u_0(t)$ | $\displaystyle \frac{\omega}{(s + a)^2 + \omega^2}$ | Re($s$) > $-$Re($a$) |
| 11      | $\displaystyle e^{-at}\cos (\omega t) u_0(t)$  | $\displaystyle \frac{s+a}{(s+a)^2 + \omega^2}$      | Re($s$) > $-$Re($a$) |



See also: [Wikibooks: Engineering_Tables/Laplace_Transform_Table](https://en.wikibooks.org/wiki/Engineering_Tables/Laplace_Transform_Table) and [Laplace Transform&mdash;WolframMathworld](https://mathworld.wolfram.com/LaplaceTransform.html) for more complete references.
<!-- #endregion -->