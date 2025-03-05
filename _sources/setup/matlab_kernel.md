---
jupyter:
  jupytext:
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.16.7
  kernelspec:
    display_name: MKernel
    language: matlab
    name: mkernel
---

Testing the Jupyter MATLAB Kernel
============

Interact with MATLAB in Notebook the using the [MATLAB engine for Python](https://www.mathworks.com/help/matlab/matlab-engine-for-python.html).  All commands are interpreted by MATLAB.  Since this is a [MetaKernel](https://github.com/Calysto/metakernel), a standard set of magics are available.  Help on commands is available using the `%help` magic or using `?` with a command.

```matlab
% Use inline SVG graphics
imatlab_export_fig('print-svg')
```

```matlab
t = linspace(0,6*pi,100);
plot(sin(t))
grid on
hold on
plot(cos(t), 'r')
```

```matlab
%plot -s 200,150
```

```matlab
b = 10*cos(t)+30; plot(b); grid on
```

```matlab
a = [1,2,3]
```

```matlab
b = a + 3;
```

```matlab
disp(b)
```

```matlab
%lsmagic
```

```python
print('Hello, world!')
```
