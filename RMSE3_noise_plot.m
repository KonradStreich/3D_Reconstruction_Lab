close all
sig = (1:100);
num_2D = 47;

%% 2D calibration noise
error_by_var_2D = zeros(4,length(sig));

for k = 1:length(sig)
    error_by_var_2D(:,k) = RMSE3_noise_2Dcalib(num_2D,sig(k));
end

figure
plot(sig.^2,error_by_var_2D(4,:))
hold on
plot(sig.^2,movmean(error_by_var_2D(4,:),20))

%% 3D calibration noise
error_by_var_3D = zeros(4,length(sig));

for k = 1:length(sig)
    error_by_var_3D(:,k) = RMSE3_noise_3Dcalib(num_2D,sig(k));
end

figure
plot(sig.^2,error_by_var_3D(4,:))
hold on
plot(sig.^2,movmean(error_by_var_3D(4,:),20))

%% 2D and 3D calibration noise = worst case scenario
error_by_var_wc = zeros(4,length(sig));

for k = 1:length(sig)
    error_by_var_wc(:,k) = RMSE3_noise_worstcase(num_2D,sig(k));
end

figure
plot(sig.^2,error_by_var_wc(4,:))
hold on
plot(sig.^2,movmean(error_by_var_wc(4,:),20))