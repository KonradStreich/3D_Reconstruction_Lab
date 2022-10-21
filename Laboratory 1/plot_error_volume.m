close all
max_sizes = 4;
RMSEx = zeros(max_sizes,1);
RMSEy = zeros(max_sizes,1);

RMSEz = zeros(max_sizes,1);
sum = zeros(max_sizes,1);
RMSE = zeros(max_sizes,1);
errors = zeros(max_sizes,4,1);


for j = 1:4
    error = RMSE3_volume(j);
    errors(j,:) = error;
    RMSEx(j) = error(1);
    RMSEy(j) = error(2);
    RMSEz(j) = error(3);
    RMSE(j) = error(4);

    sum(j) = RMSEx(j)+RMSEy(j)+RMSEz(j);
end

if j <4
    errors(4,:)=[];
end

figure
bar(errors)
legend('RMSE in x direction','RMSE in y direction',...
    'RMSE in z direction','RMSE-3D',...
    'Location','northwest')
xlabel('Case number')
ylabel('RMSE')