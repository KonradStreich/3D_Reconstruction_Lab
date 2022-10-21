load("Calib_Beads2D.mat")
load("Calib_Beads3D.mat")
load("Vertebrae2D.mat")
fprintf("Hello World")

% load('L_LAT.mat')
% load('L_PA0.mat')

M_LAT = DLT(Beads2D_LAT, Calib_Beads3D);
M_PA0 = DLT(Beads2D_PA0, Calib_Beads3D);

[U_PA0,V_PA0] = read_vertebra(Vertebrae_PA0);
[U_LAT,V_LAT] = read_vertebra(Vertebrae_LAT);

close all

figure
hold on
for p=1:size(Vertebrae_PA0,1)
    [p3D] = reconstruct_vertebra(U_PA0(:,p),V_PA0(:,p),M_PA0);
    scatter3(p3D(1,:),p3D(2,:),p3D(3,:),'or')
    
    [p3D] = reconstruct_vertebra(U_LAT(:,p),V_LAT(:,p),M_LAT);
    scatter3(p3D(1,:),p3D(2,:),p3D(3,:),'ob')
end

% axis equal
% view(3)