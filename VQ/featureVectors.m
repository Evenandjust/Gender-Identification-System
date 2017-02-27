% Function to generate feature vector
function Z = featureVectors(data, frameLen, overlap, Fs)
    % Pre-emphasize the signal
    data = filter([1,-0.9378],1,data);
    L = length(data);
    data = data.*hamming(L);
    m = floor((L-overlap)/(frameLen-overlap));
    
    frameRate = 256;
    vector = cal_mfcc(data,Fs,frameRate);

    start_index = 1;
    % Split the signal into frames and concatenate feature vectors
    for j = 1:m
        end_index = start_index+frameLen-1;
        if j ~= m
            for i = start_index:end_index
                k = i-(frameLen-overlap)*(j-1);
                Y(j,k) = data(i);
            end
            start_index = start_index + frameLen - overlap;
        else
            for i = start_index:L
                k = i-(frameLen-overlap)*(j-1);
                Y(j,k) = data(i);
            end
        end
        Z(j,:) = horzcat(1*cal_pitch(Y(j,:),Fs),10*cal_lpc(Y(j,:)),10*vector(j,:));
    end
end

