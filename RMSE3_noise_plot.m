close all
sig = (1:0.1:10);
num_2D = 47;

%% 2D calibration noise
error_by_var_2D = zeros(4,length(sig));

for k = 1:length(sig)
    error_by_var_2D(:,k) = RMSE3_noise_2Dcalib(num_2D,sig(k));
end

figure
plot(sig.^2,error_by_var_2D(4,:),'Color','#8080ff')
hold on
plot(sig.^2,movmean(error_by_var_2D(4,:),20),'Color','#0000e6','LineWidth',1.5)
legend('3D RMSE','Mean od 3D RMSE')

%% 3D calibration noise
error_by_var_3D = zeros(4,length(sig));

for k = 1:length(sig)
    error_by_var_3D(:,k) = RMSE3_noise_3Dcalib(num_2D,sig(k));
end

figure
plot(sig.^2,error_by_var_3D(4,:),'Color','#00cc44')
hold on
plot(sig.^2,movmean(error_by_var_3D(4,:),20),'Color','#009933','LineWidth',1.5)
legend('3D RMSE','Mean od 3D RMSE')

xlabel('Variance of added random noise')
ylabel('RMSE of reconstucted 3D Points')
legend('RMSE for reconstruction with random 3D error','Mean RMSE')

%% 2D and 3D calibration noise = worst case scenario
error_by_var_wc = zeros(4,length(sig));

for k = 1:length(sig)
    error_by_var_wc(:,k) = RMSE3_noise_worstcase(num_2D,sig(k));
end

figure
plot(sig.^2,error_by_var_wc(4,:),'Color','#ff4d4d')
hold on
plot(sig.^2,movmean(error_by_var_wc(4,:),20),'Color','#cc0000','LineWidth',1.5)


%% Comparison Plot 2D vs 3D vs WC
figure 
hold on
% 2D calibration noise
plot(sig.^2,error_by_var_2D(4,:),'Color','#8080ff')
error_2D = plot(sig.^2,movmean(error_by_var_2D(4,:),20),'Color','#0000e6','LineWidth',1.5);
% 3D Calibration errror
plot(sig.^2,error_by_var_3D(4,:),'Color','#00cc44')
error_3D = plot(sig.^2,movmean(error_by_var_3D(4,:),20),'Color','#009933','LineWidth',1.5);
% Worst case
plot(sig.^2,error_by_var_wc(4,:),'Color','#ff4d4d')
error_wc = plot(sig.^2,movmean(error_by_var_wc(4,:),20),'Color','#cc0000','LineWidth',1.5);

xlabel('Variance of added random noise')
ylabel('RMSE of reconstucted 3D Points')

legend([error_2D error_3D error_wc],...
    'Mean resulting 3D RMSE for 2D errors',...
    'Mean resulting 3D RMSE for 3D errors',...
    'Mean resulting 3D RMSE for 2D and 3D errorscombined')