function [p3D] = reconstruct_spine(Calibration_Beads_3D,...
    Calibration_Beads_2D_LAT, Calibration_Beads_2D_PA0,...
    Vertebrae_LAT_scan_2D, Vertebrae_PA0_scan_2D,...
    num)

%load("Calib_Beads2D.mat")
%load("Calib_Beads3D.mat")
load("Vertebrae2D.mat")
CalibrationBeads = Calibration_Beads_3D;

[Beads_LAT, Beads_PA0] = choose_2Dpoints(num, Calibration_Beads_2D_LAT, Calibration_Beads_2D_PA0);

M_LAT = DLT(Beads_LAT, CalibrationBeads);
M_PA0 = DLT(Beads_PA0, CalibrationBeads);

[U_PA0,V_PA0] = read_vertebra(Vertebrae_PA0_scan_2D);
[U_LAT,V_LAT] = read_vertebra(Vertebrae_LAT_scan_2D);


p3D = zeros(3,6, size(Vertebrae_PA0_scan_2D,2));

%figure
%hold on
for p=1:size(Vertebrae_PA0_scan_2D,1)
    p3D(:,:,p) = reconstruct_vertebra(U_LAT(:,p),V_LAT(:,p),U_PA0(:,p),V_PA0(:,p),M_LAT,M_PA0);
    %scatter3(p3D(1,1:3),p3D(2,1:3),p3D(3,1:3),'or')
    %scatter3(p3D(1,4:6),p3D(2,4:6),p3D(3,4:6),'ob')
    %scatter3(p3D(1,1:3,p),p3D(2,1:3,p),p3D(3,1:3,p),'MarkerEdgeColor',[0 1-(p/size(Vertebrae_PA0_scan_2D,1)) (p/size(Vertebrae_PA0_scan_2D,1))])
    %scatter3(p3D(1,4:6,p),p3D(2,4:6,p),p3D(3,4:6,p),'MarkerEdgeColor',[0 1-(p/size(Vertebrae_PA0_scan_2D,1)) (p/size(Vertebrae_PA0_scan_2D,1))])
end

%axis equal
%view(3)

end

