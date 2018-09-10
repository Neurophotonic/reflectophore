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

```
MATLAB R2014a
statistics and machine learning toolbox
```

### OS Requirements

This package has been tested on windows8.

# Installation Guide

This package doesn't need any installation because it runs on script.


# Instructions for Use

## File composition

Total 10 files are included in this repository. M-file, sample data for curve fitting and sample spectrum directories contain matlab script, reference data for fitting and sample spectums(asc file), each other.

### M-file

To select a spectrum with maximum intensity among the spectrums that acquired by 3D scanning `Find_max_spectrum.m` is needed. After finding the spectrum, `reflectophore_curve_fitting.m` is needed for curve fitting and obtaining the diameter of microsphere from the selected spectrum.     

```
find_max_spectrum.m
reflectophore_curve_fitting.m
```

### sample data for curve fitting

`Simulation_sample_ps_bead_in_water_3-3.5um_1nm_step_(norm.).mat` and `Simulation_sample_ps_bead_in_water_10-10.5um_1nm_step_(norm.).mat` are pre-calculated thin-film interference simulation database (Due to the file size limitation, the files were splited). Simulated diameter range is 3-3.5 um and 10-10.5 um with a 1 nm of step size for polystyrene micorsphere in water. `laser_spectrum.mat` is sample spectrum for light source which is enssential for normalization of spectrum. `wavelength.mat` is used to set a fitting range.

```
Simulation_sample_ps_bead_in_water_3-3.5um_1nm_step_(norm.).mat
Simulation_sample_ps_bead_in_water_10-10.5um_1nm_step_(norm.).mat
laser_spectrum.mat
wavelength.mat
```

### sample spectrum

4 sample spectrums were prepared in .asc file (1600 rows X 321 column). Column and row mean the number of scanning points and wavelength. First colum is wavelength range that we measured, and other 320 columns are spectrum acquired from scanning volume. #1, 2 and #3, 4 were acquired from 10 um and 4 um of microspheres each other. 

```
#1 sample.asc
#2 sample.asc
#3 sample.asc
#4 sample.asc
```
