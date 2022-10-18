function [p3D] = reconstruct_vertebra(Ucol_LAT,Vcol_LAT,Ucol_PA0,Vcol_PA0,M_LAT,M_PA0)
% gives back reconstructed 3D points the 3D Points for ONE vertebra based on
% calibration matrices for both views (M_LAT & M_PA0) and the 
% 2D coordinates for the vertebra in view LAT and view PA0

N = size(Ucol_LAT,1);
p3D = zeros(3,N);

for k=1:N
    
    A = [M_LAT(1)-M_LAT(9)*Ucol_LAT(k) M_LAT(2)-M_LAT(10)*Ucol_LAT(k) M_LAT(3)-M_LAT(11)*Ucol_LAT(k);
        M_LAT(5)-M_LAT(9)*Vcol_LAT(k) M_LAT(6)-M_LAT(10)*Vcol_LAT(k) M_LAT(7)-M_LAT(11)*Vcol_LAT(k);
        M_PA0(1)-M_PA0(9)*Ucol_PA0(k) M_PA0(2)-M_PA0(10)*Ucol_PA0(k) M_PA0(3)-M_PA0(11)*Ucol_PA0(k);
        M_PA0(5)-M_PA0(9)*Vcol_PA0(k) M_PA0(6)-M_PA0(10)*Vcol_PA0(k) M_PA0(7)-M_PA0(11)*Vcol_PA0(k)];
    
    b = [-M_LAT(4)+Ucol_LAT(k); -M_LAT(8)+Vcol_LAT(k);
        -M_PA0(4)+Ucol_PA0(k); -M_PA0(8)+Vcol_PA0(k)];
    
    % reconstruct point k out of N in 3D for the vertebrae
    p3D(:,k) = pinv(A)*b;
end

% put 2D points from vertebra into matrix
% p2D = [Ucolumn'; Vcolumn'; ones(1,size(Ucolumn,1))];
% 
% p3D = pinv(L)*p2D;

end

