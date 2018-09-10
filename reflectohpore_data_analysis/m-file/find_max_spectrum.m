clear; clc;

%% Reflectance spectrum file load
% l = No. of files
data_load = dir('#*.asc'); 
l = length(data_load)

%% intensity map
% file_no = No. of files
% t = wavelength
load('wavelength.mat'); % load wavelength where in measured range

for file_no = 1:l
    data = [];
    data = dlmread([data_load(file_no).name]); % data load as matrix
    data(:,1) = []; % 1st column (wavelength) remove

% subtract offset
% offset = mean of first 200 points
    for i = 1:length(data(1,:))
        offset = mean(data(1:200,i));
        data(:,i) = data(:,i) - offset;
    end
 
% assing zero to negative value
%     r = find(data<0);
%     data(r) = 0;

% spectrum integration to calculate signal intensity(a.u.).
% (i,j,k) is coordinate for scanning volume
% int = intensity(a.u.) at coordinate (i,j,k) in scanning volume
% x,y,z is axis length
% In this example, scaning volume is (x,y,z) = 8*8*5
    x = 8;
    y = 8;
    z = 5;
    
    for k = 1:5
        signal(:,1+x*y*(k-1):x*y+x*y*(k-1)) = data(:,1+x*y*(k-1):x*y+x*y*(k-1));
        int(:,1+x*y*(k-1):x*y+x*y*(k-1)) = trapz(signal(:,1+x*y*(k-1):x*y+x*y*(k-1)));
    end
    
    for k = 1:z
        for i = 1:x
            for j = 1:y
                p_stack(i,j,k) = int(j+y*(i-1)+x*y*(k-1));
            end
        end
        max_int_z(k,1) = max(max(p_stack(:,:,k))); % find max intensity at plane k
        w(k,1) = find(int(x*y*(k-1)+1:k*x*y) == max_int_z(k,1)); % index of max intensity at plane k
        subplot(2,floor(z/2)+1,k);
        imagesc(p_stack(:,:,k),[0 max(max(int))*1.2]);
    end
    i_m = [];
    i_m = find(int == max(max(int))); % index for maximum intensity where in scanning volume
     
    max_spectrum(:,file_no) = signal(:,i_m); % max_spectrum = spectrum correspond to maximum intensity
end

% data = maximum spectrum.
% 
data =[];
data = max_spectrum;

clearvars -except data;