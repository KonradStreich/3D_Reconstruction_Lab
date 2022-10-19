function [Beads2D_LAT_selection,Beads2D_PA0_selection] = choose_2Dpoints_volume(volume_size)
load ("Calib_Beads2D.mat")

if volume_size == 1 %large
    volume_LAT = [1 6 19 23 24 28 43 47];
    volume_PA0 = [1 6 20 24 25 29 45 49];
end

if volume_size == 2 %medium
    volume_LAT = [8 10 19 21 30 32 39 41];
    volume_PA0 = [8 10 20 22 31 33 41 43];
end

if volume_size == 3 %small
    volume_LAT = [1 2 7 8 24 25 29 30]; %[8 9 14 15 30 31 35 36]; %[9 14 16 20 31 35 37 40]; %[8 10 14 16 30 32 35 37]; 
    volume_PA0 = [1 2 7 8 25 26 30 31]; %[8 9 14 15 31 32 36 37]; %[9 14 16 21 32 36 38 42]; %[8 10 14 16 31 33 36 38];
end

if volume_size == 4 %plane
    volume_LAT = [24 28 43 47 30 32 39 41];
    volume_PA0 = [25 29 45 49 31 33 41 43];
end

if volume_size == 5 %volume question 2.3
    volume_LAT = [9 11 15 17 30 31 35 36];
    volume_PA0 = [9 11 15 17 31 32 36 37];
end

Beads2D_LAT_selection = Beads2D_LAT(volume_LAT);
Beads2D_PA0_selection = Beads2D_PA0(volume_PA0);


