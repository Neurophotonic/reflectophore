# Reflectophore data analysis

# Contents

- [Overview](#overview)
- [System Requirements](#system-requirements)
- [Installation Guide](#installation-guide)
- [Instructions for Use](#instructions-for-use)
- [License](./LICENSE)
- [Matlab code](https://github.com/neurodata/mgc-paper/tree/master/Code/MGC)
- [Citation](#citation)

# Overview

Reflectance spectrum is acquired from microsphere through the 3D volumetric scanning. This package was made to find the spectrum reflected from a center of microsphere and best-fit simulation curve that matches with measured reflectance spectrum. 

# System Requirements

### Hardware Requirements

Hardware condition that 'reflectophore data analysis' package has been tested:

RAM: 32GB      
CPU: Intel(R) Core(TM) i7-4790, 3.60GHz

Tested condition is thought to be overspec. For minimal performance, only 4GB RAM will be enough.


### Software Requirements


MATLAB R2014a
      
Toolbox
```
statistics and machine learning toolbox
```

### OS Requirements

This package has been tested on windows8.

# Installation Guide

This package doesn't need any installation because it runs on script.


# Instructions for Use

### File composition

Total 10 files are included in this repository. M-file, sample data for curve fitting and sample spectrum directories contain matlab script, reference data for fitting and sample spectums(asc file), each other.

M-file

```
find_max_spectrum
reflectophore_curve_fitting
```

sample data for curve fitting
```
Simulation_sample_ps_bead_in_water_3-3.5um_1nm_step_(norm.)
Simulation_sample_ps_bead_in_water_10-10.5um_1nm_step_(norm.)
laser_spectrum
wavelength
```

sample spectrum
```
#1 sample
#2 sample
#3 sample
#4 sample
```
