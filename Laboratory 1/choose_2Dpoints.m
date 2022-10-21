function [Beads2D_LAT_selection,Beads2D_PA0_selection] = choose_2Dpoints(num,Beads2D_LAT,Beads2D_PA0)
%load ("Calib_Beads2D.mat")

corners_LAT = [1 6 24 43 47 28];
corners_PA0 = [1 6 25 45 29 49];

if num < 7
    Beads2D_LAT_selection = Beads2D_LAT(corners_LAT(1:num));
    Beads2D_PA0_selection = Beads2D_PA0(corners_PA0(1:num));

end


if num >= 7
    Beads2D_LAT_selection = Beads2D_LAT(corners_LAT);
    Beads2D_PA0_selection = Beads2D_PA0(corners_PA0);

    Beads2D_LAT(corners_LAT) = [];
    Beads2D_PA0(corners_PA0) = [];

    select = randperm(size(Beads2D_LAT,2),num-6);

    additional_LAT = Beads2D_LAT(select);
    additional_PA0 = [];

    for k=1:size(additional_LAT,1)
        objName = additional_LAT(k).name;
        if objName(1) == 'C'
            objName(1) = 'A';
        end
        if objName(1) == 'D'
            objName(1) = 'B';
        end

        [obj, index] = GetObject(Beads2D_PA0, objName);
        if index == 0
            continue
        end
        additional_PA0 = [additional_PA0, Beads2D_PA0(index)];
    end
    
    Beads2D_LAT_selection = [Beads2D_LAT_selection, additional_LAT];
    Beads2D_PA0_selection = [Beads2D_PA0_selection, additional_PA0];
end