% Subfunction to calculate lpc
function vector = cal_lpc_GMM(frameData)
    p = 5;
    [a,g]=lpc(frameData,p);
    vector = a(2:6);
end