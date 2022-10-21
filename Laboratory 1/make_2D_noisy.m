function [Beads2D_LAT, Beads2D_PA0] = make_2D_noisy(Beads2D_LAT, Beads2D_PA0, sigma)
num_points_LAT = size(Beads2D_LAT,2);
num_points_PA0 = size(Beads2D_PA0,2);

for k = 1:num_points_LAT
    Beads2D_LAT(k).coord(1) = Beads2D_LAT(k).coord(1) + randn(1) * sigma; %normrnd(0, sigma); % 34% of radius (which is 5 pixels)
    Beads2D_LAT(k).coord(2) = Beads2D_LAT(k).coord(2) + randn(1) * sigma; %normrnd(0, sigma);
end

for k = 1:num_points_PA0
    Beads2D_PA0(k).coord(1) = Beads2D_PA0(k).coord(1) + randn(1) * sigma; %normrnd(0, sigma); % 34% of radius (which is 5 pixels)
    Beads2D_PA0(k).coord(2) = Beads2D_PA0(k).coord(2) + randn(1) * sigma; %normrnd(0, sigma);
end

