close all
sig = 10;
num_2D = 47;

figure
hold on

%% Noise on 3D
Calib_Beads3D_noise = make_3D_noisy(Calib_Beads3D,sig);
[p3D] = reconstruct_spine(Calib_Beads3D_noise,...
    Beads2D_LAT, Beads2D_PA0,...
    Vertebrae_LAT, Vertebrae_PA0,...
    47);

for p=1:size(17,1)
    scatter3(p3D(1,1:3,p),p3D(2,1:3,p),p3D(3,1:3,p),'or')
    scatter3(p3D(1,4:6,p),p3D(2,4:6,p),p3D(3,4:6,p),'or')
end

%% Noise on 2D

[Beads2D_LAT_noise, Beads2D_PA0_noise] = make_2D_noisy(Beads2D_LAT, Beads2D_PA0,sig);
[p3D] = reconstruct_spine(Calib_Beads3D,...
    Beads2D_LAT_noise, Beads2D_PA0_noise,...
    Vertebrae_LAT, Vertebrae_PA0,...
    47); 

for p=1:size(17,1)
    scatter3(p3D(1,1:3,p),p3D(2,1:3,p),p3D(3,1:3,p),'ob')
    scatter3(p3D(1,4:6,p),p3D(2,4:6,p),p3D(3,4:6,p),'ob')
end


axis equal
view(3)