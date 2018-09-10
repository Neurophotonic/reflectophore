# Reflectophore data analysis

# Contents

- [Overview](#overview)
- [System Requirements](#system-requirements)
- [Installation Guide](#installation-guide)
- [Instructions for Use](#instructions-for-use)
- [License](./LICENSE)

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

## How to run

Run time depends on the No. of files (~30s for 100 .asc files).

1. Save all files in one directory.

2. First, open the script `Find_max_spectrum.m`

3. put the file name at `dir` function (line 5) what you want to analyse. More than one file is available (please see  https://www.mathworks.com/help/matlab/ref/dir.html)   
```
line 5  | data_load = dir('#1 sample.asc');
``` 

4. If you run the script, one `data.mat` file will be created in workspace. In command window following output and spatial intensity heat map will be printed.   
```
Command winodw
output  | l = 1 # No. of files
```

5. After then, open the scipt `reflectophore_curve_fitting.m` 

6. put the file names at `load` and `uigetfile` function to load `wavelength.mat`, `laser_spectrum.mat` and `Simulation_sample_ps_bead_in_water_10-10.5um_1nm_step_(norm.).mat` files. (please see https://www.mathworks.com/help/matlab/ref/uigetfile.html)

```
line 4  | load('wavelength.mat');
line 7  | filename = uigetfile('laser_spectrum.mat');
line 16 | filename = uigetfile('Simulation_sample_ps_bead_in_water_10-10.5um_1nm_step_(norm.).mat');
```

7. If you run the script, following messages appears on command window. You should set the fitting wavelength range within your light source spectrum. In our example, 550-650 nm was used. After then, you should put the simulated diameter range. In this example, we enter the 10-10.5 um and 1 nm step size because we used the simulation file `Simulation_sample_ps_bead_in_water_10-10.5um_1nm_step_(norm.).mat`.

```
Command winodw
Enter the initial range of wavelength(nm) : 550
Enter the final range of wavelength(nm) : 650
Enter the simulation lower bound (um) : 10
Enter the simulation upper bound (um) : 10.5
Enter the simulation step size (nm) : 1
```

8. Finally curves and following values will be printed on command window:

```
Command winodw
ans =

      10.4980    0.9674  
      
      # left one is diameter and right one is correlation coefficient between measured spectrum and fitted simulation curve
```

9. Following outputs will be printed, if you run this scirpt for each sample files:
```
Command winodw
ans =

      10.4980    0.9674  # #1 sample.asc
      10.4850    0.9186  # #2 sample.asc
      3.1570     0.9053  # #3 sample.asc
      3.1650     0.9345  # #4 sample.asc
```
