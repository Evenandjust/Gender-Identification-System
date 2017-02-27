% Subfunction to calculate lpc
function vector = cal_lpc(frameData)
    p = 5;
    [a,g]=lpc(frameData,p);
    vector = a;
end