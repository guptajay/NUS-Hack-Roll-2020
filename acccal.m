tic; 
while (toc < 120)
    [status,timestamp] = readCalibrationStatus(BNO055Sensor); 
    if strcmpi(status.Accelerometer,'full')
        break; %Accelerometer is calibrated proceed further
    end
    pause(1);
end