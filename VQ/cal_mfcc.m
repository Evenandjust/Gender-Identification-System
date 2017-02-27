% Subfunction to calculate MFCCs
function vector = cal_mfcc(input,Fs,frameRate)
    [ceps,freqresp,fb,fbrecon,freqrecon] = mfcc(input, Fs, frameRate);
    vector = ceps;
    vector = vector.';
end