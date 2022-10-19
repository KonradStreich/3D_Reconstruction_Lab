function [Beads3D] = make_3D_noisy(Beads3D, sigma)
num_points = size(Beads3D,2);

for k = 1:num_points
    Beads3D(k).coord(1) = Beads3D(k).coord(1) + randn(1) * sigma; %normrnd(0, sigma); 
    Beads3D(k).coord(2) = Beads3D(k).coord(2) + randn(1) * sigma; %normrnd(0, sigma);
    Beads3D(k).coord(3) = Beads3D(k).coord(3) + randn(1) * sigma; %normrnd(0, sigma);
end

