clearvars -except data;

% wavelength ranged from 324 nm to 873 nm
load('wavelength.mat');

% load light source spectrum
filename = uigetfile('laser_spectrum.mat');
in_s = importdata(filename);

% simulation data load
% the example simulation assumed that polystyrene microsphere was immersed
% in water.
% Size for polystyrene microsphere was ranged from 3um to 3.5um and from 9.5 to 10 um with 1nm step size.
% simulation data was normalized within the range from 0 to 1.
filename = uigetfile('Simulation_sample_ps_bead_in_water_0.1-20um_1nm_step_(norm.).mat');
ndata = importdata(filename);


%% Set wavelength range for fitting
tb = t; % wavelength
ti = input('Enter the initial range of wavelength(nm) : ');
tf = input('Enter the final range of wavelength(nm) : ');

% convert wavelength(nm) to index
ti = floor((ti-t(1))/mean(diff(t))); 
tf = floor((tf-t(1))/mean(diff(t)));

t = tb(ti:tf); % wavelength
w = 1./tb(ti:tf); % wavenumber


%% simulation data rerange
for i = 1:length(ndata(1,:))
    j(:,i) = ndata(ti:tf,i);
    ndata_s(:,i) = (j(:,i)-min(j(:,i)))./(max(j(:,i))-min(j(:,i))); %normalization
end

%% Measured spectrum data normalization
for i = 1:length(data(1,:))
    k(:,i) = data(ti:tf,i)./in_s(ti:tf,1); % Reflectance spectrum divided by light source spectrum
    ndata_m(:,i) = (k(:,i)-min(k(:,i)))./(max(k(:,i))-min(k(:,i))); % reflectance spectrum normalization
end


%% index to diameter
% d(um) = d1(um) + step(nm)/1000*(i-1)
% i = d - d1/step*1000 +1  
% i = index for simulation data
% d = microsphere diameter (um)
% step (nm) = simulation step size
% d1 = lower bound of simulation in size (um)
% d2 = upper bound of simulation in size (um)

d1 = input('Enter the simulation lower bound (um) : ');
d2 = input('Enter the simulation upper bound (um) : ');
step = input('Enter the simulation step size (nm) : ');

%% Correlation based curve fitting
% ndata_m, n(row) x p1(column) matrix
% ndata_s, n(row) x p2(column) matrix
% r, p1(row) x p2(column) maxtrix

correlation = corr(ndata_m,ndata_s); % correlation coefficient between simulation and measured spectrum
max_corr = max(correlation')'; % maximum correlation coefficient

for i = 1:length(correlation(:,1))
    simul_inex(i,:) = find(correlation(i,:)==max_corr(i)); % simulation data index
    bead_size(i,:) = d1 +step/1000*(simul_inex(i,:)-1); % size of bead(um) from measured spectrum
end

[bead_size max_corr]

%% plot reflectance vs wavenumber
for i = 1:length(data(1,:))
    subplot(floor(length(data(1,:))/2)+1,2,i);
    plot(w, ndata_m(:,i)); hold on;
    plot(w, ndata_s(:,simul_inex(i)),'r');
end

clearvars -except data simul_inex bead_size max_corr ndata_m ndata_s simul_inex_lsq lsq_size t w;


