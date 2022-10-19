close all
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

[p3D] = reconstruct_spine_volume(Calib_Beads3D,...
    Beads2D_LAT, Beads2D_PA0,...
    Vertebrae_LAT, Vertebrae_PA0,...
    5);

%% Put 3D Points all in [3x(6*N_vertebrae)] matrix (intead of [3x6xN_vertebrae])
num_vertebrae = size(p3D_ideal,3);
ideal = zeros(3,6*num_vertebrae);
simple = ideal;
for k = 1:num_vertebrae
    ideal(:,(1+(k-1)*6):(6+(k-1)*6)) = p3D_ideal(:,:,k);
    simple(:,(1+(k-1)*6):(6+(k-1)*6)) = p3D(:,:,k);
end

centre = cog(Calib_Beads3D);

distance_to_cog = zeros(size(p3D,2),1);
error_x = zeros(size(p3D,2),1);
error_y = zeros(size(p3D,2),1);
error_z = zeros(size(p3D,2),1);
error = zeros(size(p3D,2),1);

for k = 1:size(ideal,2)
    distance_to_cog(k) = norm(simple(:,k)-centre');
    error_x(k) = abs(simple(1,k) - ideal(1,k));
    error_y(k) = abs(simple(2,k) - ideal(2,k));
    error_z(k) = abs(simple(3,k) - ideal(3,k));
    error(k) = norm(simple(:,k) - ideal(:,k));
end

%% Plot
figure
hold on
plot(distance_to_cog,error_x,'.','MarkerSize',10)
plot(distance_to_cog,error_y,'.','MarkerSize',10)
plot(distance_to_cog,error_z,'.','MarkerSize',10)
plot(distance_to_cog,error,'.','MarkerSize',10)
legend('Error in x direction','Error in y direction','Error in z direction','Total error')

