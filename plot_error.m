close all
max_points = 47;
RMSEx = zeros(max_points,1);
RMSEy = zeros(max_points,1);
RMSEz = zeros(max_points,1);
sum = zeros(max_points,1);
RMSE = zeros(max_points,1);

for j = 5:max_points
    error = RMSE3(j);
    RMSEx(j) = error(1);
    RMSEy(j) = error(2);
    RMSEz(j) = error(3);
    RMSE(j) = error(4);

    sum(j) = RMSEx(j)+RMSEy(j)+RMSEz(j);
end

figure
hold on
plot(RMSEx,'LineWidth',1.5)
plot(RMSEy,'LineWidth',1.5)
plot(RMSEz,'LineWidth',1.5)
plot(sum,'LineWidth',1.5)
legend('RMSE in x direction','RMSE in y direction','RMSE in z direction','Sum of errors')

figure 
hold on
plot(RMSE)