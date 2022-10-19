function [centre] = cog(Beads3D)

%num_points=size(Beads_2D_LAT,2)+size(Beads_2D_PA0,2);

%coordinate = zeros(num_points,2);

%for k = 1:size(Beads_2D_LAT,2)
%    coordinate(k,:)=Beads_2D_LAT(k).coord;
%    coordinate(k+size(Beads_2D_LAT,2),:) = Beads_2D_PA0(k).coord;
%end

%centre_x = sum(coordinate(:,1))/length(coordinate(:,1));
%centre_y = sum(coordinate(:,2))/length(coordinate(:,2));

%centre = [centre_x centre_y];

num_points = size(Beads3D,2);
coordinate = zeros(num_points,3);

for k = 1:num_points
    coordinate(k,:)=Beads3D(k).coord;
end

centre_x = sum(coordinate(:,1))/length(coordinate(:,1));
centre_y = sum(coordinate(:,2))/length(coordinate(:,2));
centre_z = sum(coordinate(:,3))/length(coordinate(:,3));

centre = [centre_x centre_y centre_z];
