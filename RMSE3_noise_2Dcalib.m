function [error] = RMSE3_noise_2Dcalib(num,sigma)

% load in Point Sets
load("Calib_Beads2D.mat")
load("Calib_Beads3D.mat")
load("Vertebrae2D.mat")
%fprintf("Hello World")

%% Get 3D reconstruction of spine using all calibration beads
[p3D_ideal] = reconstruct_spine(Calib_Beads3D,...
    Beads2D_LAT, Beads2D_PA0,...
    Vertebrae_LAT, Vertebrae_PA0,...
    47); % take all calibration beads

%% Get simplieied 3D reconstruction of spine using only some calibration beads
[Beads2D_LAT_noise, Beads2D_PA0_noise] = make_2D_noisy(Beads2D_LAT, Beads2D_PA0,sigma);
[p3D] = reconstruct_spine(Calib_Beads3D,...
    Beads2D_LAT_noise, Beads2D_PA0_noise,...
    Vertebrae_LAT, Vertebrae_PA0,...
    num); % tae only a few selected calibration beads

%% Put 3D Points all in [3x(6*N_vertebrae)] matrix (intead of [3x6xN_vertebrae])
num_vertebrae = size(p3D_ideal,3);
ideal = zeros(3,6*num_vertebrae);
simple = ideal;
for k = 1:num_vertebrae
    ideal(:,(1+(k-1)*6):(6+(k-1)*6)) = p3D_ideal(:,:,k);
    simple(:,(1+(k-1)*6):(6+(k-1)*6)) = p3D(:,:,k);
end

%% Calculate RMSE between ideal and simplified reconstruction
num_3D_points = size(ideal,2);

% in x direction:
sumx = 0; sumy = 0; sumz = 0;
for k = 1:num_3D_points
    sumx = sumx + (ideal(1,k)-simple(1,k))^2;
    sumy = sumy + (ideal(2,k)-simple(2,k))^2;
    sumz = sumz + (ideal(3,k)-simple(3,k))^2;
end
RMSEx = sqrt(sumx/num_3D_points);
RMSEy = sqrt(sumy/num_3D_points);
RMSEz = sqrt(sumz/num_3D_points);


%% Calculate 3D RMSE between ideal and simplified reconstruction
sum = 0;
for k = 1:num_3D_points
    sum = sum + (norm(ideal(:,k)-simple(:,k)))^2;
end
RMSE3 = sqrt(sum/num_3D_points);


error = [RMSEx;RMSEy;RMSEz;RMSE3];


end

