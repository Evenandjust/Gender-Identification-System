% @author: XZZ
% @function: Train the Female Model, save the result 'cenFemale' into 'FemaleModel.mat'

function trainFemale()

    % Choose ten signals as train set
    [y1,Fs] = audioread('female1.wav');
    [y2,Fs] = audioread('female2.wav');
    [y3,Fs] = audioread('female3.wav');
    [y4,Fs] = audioread('female4.wav');
    [y5,Fs] = audioread('female5.wav');
    [y6,Fs] = audioread('female6.wav');
    [y7,Fs] = audioread('female7.wav');
    [y8,Fs] = audioread('female8.wav');
    [y9,Fs] = audioread('female9.wav');
    [y10,Fs] = audioread('female10.wav');
    
    frameLen = 256;
    overlap = 0;

    % Generate feature vectors of each file
    Z1 = featureVectors(y1,frameLen,overlap,Fs);
    Z2 = featureVectors(y2,frameLen,overlap,Fs);
    Z3 = featureVectors(y3,frameLen,overlap,Fs);
    Z4 = featureVectors(y4,frameLen,overlap,Fs);
    Z5 = featureVectors(y5,frameLen,overlap,Fs);
    Z6 = featureVectors(y6,frameLen,overlap,Fs);
    Z7 = featureVectors(y7,frameLen,overlap,Fs);
    Z8 = featureVectors(y8,frameLen,overlap,Fs);
    Z9 = featureVectors(y9,frameLen,overlap,Fs);
    Z10 = featureVectors(y10,frameLen,overlap,Fs);
    X = [Z1;Z2;Z3;Z4;Z5;Z6;Z7;Z8;Z9;Z10];
    
    % Set the number of centroids as 10 and find them
    k = 10;
    idx = kmeans(X,k);
    [r,c] = size(X);
    
    centroid = zeros(k,c);

    for c_index = 1:k
        cenSum = zeros(c);
        count = 0;
        for i = 1:r
            if idx(i)==c_index
                cenSum = cenSum + X(i,:);
                count = count + 1;
            end
        end
        centroid(c_index,:) = cenSum(1,:)./count;
    end
    cenFemale = centroid;
    save('FemaleModel.mat','cenFemale');
end
