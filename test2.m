close all

%% Load files
load("Calib_Beads2D.mat")
load("Calib_Beads3D.mat")
load("Vertebrae2D.mat")
fprintf("Hello World")

%% Define point set for calibration
% we can just take all 3D points since our DLT function is based on the 
% number of 2D points and takes the matching 3D points accordingly
CalibrationBeads = Calib_Beads3D;% ([1 25 6 30     31 51 35 55     56 80 61 85    86 106 90 110]);

Beads_LAT = Beads2D_LAT([1 6 24 43 47 28]);

Beads_PA0 = Beads2D_PA0([1 5 25 45 29 49]);

%% Reconstruction
% get calibration matrices fpr both views
M_LAT = DLT(Beads_LAT, CalibrationBeads);
M_PA0 = DLT(Beads_PA0, CalibrationBeads);

% read 2D coordinates from all vertebrae in both views
[U_PA0,V_PA0] = read_vertebra(Vertebrae_PA0);
[U_LAT,V_LAT] = read_vertebra(Vertebrae_LAT);


figure
hold on
for p=1:size(Vertebrae_PA0,1)
    [p3D] = reconstruct_vertebra(U_LAT(:,p),V_LAT(:,p),U_PA0(:,p),V_PA0(:,p),M_LAT,M_PA0);
    scatter3(p3D(1,1:3),p3D(2,1:3),p3D(3,1:3),'or')
    scatter3(p3D(1,4:6),p3D(2,4:6),p3D(3,4:6),'ob')
%     scatter3(p3D(1,1:3),p3D(2,1:3),p3D(3,1:3),'MarkerEdgeColor',[0 1-(p/size(Vertebrae_PA0,1)) (p/size(Vertebrae_PA0,1))])
%     scatter3(p3D(1,4:6),p3D(2,4:6),p3D(3,4:6),'MarkerEdgeColor',[0 1-(p/size(Vertebrae_PA0,1)) (p/size(Vertebrae_PA0,1))])

end

axis equal
view(3)

% for only 6 points
% LAT: [1 6 24 43 47 28]
% PA0: [1 5 25 45 29 49]

[error] = RMSE3([1 6 24 43 47 28],[1 5 25 45 29 49])