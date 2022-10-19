close all
max_sizes = 4;
RMSEx = zeros(max_sizes,1);
RMSEy = zeros(max_sizes,1);

RMSEz = zeros(max_sizes,1);
sum = zeros(max_sizes,1);
RMSE = zeros(max_sizes,1);
errors = zeros(max_sizes,4,1);


for j = 1:3
    error = RMSE3_volume(j);
    errors(j,:) = error;
    RMSEx(j) = error(1);
    RMSEy(j) = error(2);
    RMSEz(j) = error(3);
    RMSE(j) = error(4);

    sum(j) = RMSEx(j)+RMSEy(j)+RMSEz(j);
end

figure
errors(4,:)=[];
bar(errors)
legend('RMSE in x direction','RMSE in y direction',...
    'RMSE in z direction','RMSE-3D',...
    'Location','northwest')
