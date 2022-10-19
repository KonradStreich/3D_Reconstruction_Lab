close all
min_points = 1;
max_points = 47;
RMSEx = zeros(max_points,1);
RMSEy = zeros(max_points,1);
RMSEz = zeros(max_points,1);
sum = zeros(max_points,1);
RMSE = zeros(max_points,1);

for j = min_points:max_points
    error = RMSE3(j);
    RMSEx(j) = error(1);
    RMSEy(j) = error(2);
    RMSEz(j) = error(3);
    RMSE(j) = error(4);

    sum(j) = RMSEx(j)+RMSEy(j)+RMSEz(j);
end

figure
hold on
plot(RMSEx,'Color','#8080ff')
error_x = plot(movmean(RMSEx,20),'LineWidth',1.5,'Color','#3333ff');
plot(RMSEy,'Color','#ffb84d')
error_y = plot(movmean(RMSEy,20),'LineWidth',1.5,'Color','#ff9900');
plot(RMSEz,'Color','#00e64d')
error_z = plot(movmean(RMSEz,20),'LineWidth',1.5,'Color','#009933');
% plot(sum,'Color','#ff6666')
% error_sum = plot(movmean(sum,20),'LineWidth',1.5,'Color','#ff0000');
plot(RMSE,'Color','#ff6666')
error_3D = plot(movmean(RMSE,20),'LineWidth',1.5,'Color','#ff0000');
legend([error_x error_y error_z error_3D],...
    'RMSE in x direction','RMSE in y direction',...
    'RMSE in z direction','3D RMSE')

xlim([min_points max_points])
xlabel('# points used for calibration')
ylabel('RMSE')

figure 
hold on
plot(RMSE,'Color','#ff6666')
plot(movmean(RMSE,20),'LineWidth',1.5,'Color','#ff0000');
xlim([min_points max_points])
xlabel('# points used for calibration')
ylabel('3D RMSE')