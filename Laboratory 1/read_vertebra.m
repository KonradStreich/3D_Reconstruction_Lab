function [U,V] = read_vertebra(vertebrae)%(L,vertebrae)%,verte_num)

% L(12) = 1;
% L = reshape(L,4,3)';

N = size(vertebrae,1);

U = zeros(6,N);
V = zeros(6,N);
W = ones(6,N);

X = zeros(6,N);
Y = zeros(6,N);
Z = zeros(6,N);

for k = 1:N
    for p = 1:6
    U(p,k) = vertebrae(k).points2D(p).coord(1);
    V(p,k) = vertebrae(k).points2D(p).coord(2);
    end
end


end

