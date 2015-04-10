# Introduction to f2py

## Olav Vahtras

Leiden

---

layout: false

## Interfacing Python with Fortran: `f2py`

* Maybe the easiest compiled langue for interfacing
--

* Distributed with the `numpy` package
--

* Minimal modifications in original Fortran source
--

* Gives you modules that can be imported in Python

---

## When to consider f2py

* Python is too slow
--

* Algorithm prevents vectorization
--


### Example 1 (daxpy)
```python
for i in range(n):
    y[i] = y[i] + a * x[i]
```
--

### Example 2 (recursion)
```
for i in range(n):
    y[i+1] = a*y[i] + b*y[i-1]
```

---

### Invocation

```bash
$ f2py -c -m module_name source.f90
```
generates a dynamically linked library `module_name.so`
which can be imported in Python with

```python
import module_name
```
--

*Tip:* a quick test that a module exists is

```bash
$ python -c 'import module_name'
```

---

### Fortran functions

* In simple cases you can use Fortran files directly
* `f2py` converts the Fortran function to a Python function

```fortran 
!source.f90
double precision function fun(x)
double precision x
...
end function
```
--

* Compile

```bash
$ f2py -c -m module_name source.f90
```
--
* Use

```python
import module_name
result = module_name.fun(3.14)
```

---

### Fortran subroutines

To think about:

* In Fortran subroutines input and output arguments can be in any order
* In Python functions arguments are input, return values are output (convention)
* Supply directives

Fixed format:
```fortran
       subroutine(x, y)
       double precision x, y
Cf2py intent(in) x
Cf2py intent(out) y
...
```
---

Free format:
```fortran
subroutine(x, y)
double precision x, y
!f2py intent(in) x
!f2py intent(out) y
...
```
