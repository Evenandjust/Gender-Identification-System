% @author: XZZ
% @function: Train the Female Model, save the result 'cenFemale' into 'FemaleModel_GMM.mat'

function trainFemale_GMM()

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
    Z1 = featureVectors_GMM(y1,frameLen,overlap,Fs);
    Z2 = featureVectors_GMM(y2,frameLen,overlap,Fs);
    Z3 = featureVectors_GMM(y3,frameLen,overlap,Fs);
    Z4 = featureVectors_GMM(y4,frameLen,overlap,Fs);
    Z5 = featureVectors_GMM(y5,frameLen,overlap,Fs);
    Z6 = featureVectors_GMM(y6,frameLen,overlap,Fs);
    Z7 = featureVectors_GMM(y7,frameLen,overlap,Fs);
    Z8 = featureVectors_GMM(y8,frameLen,overlap,Fs);
    Z9 = featureVectors_GMM(y9,frameLen,overlap,Fs);
    Z10 = featureVectors_GMM(y10,frameLen,overlap,Fs);
    X = [Z1;Z2;Z3;Z4;Z5;Z6;Z7;Z8;Z9;Z10];
    
    % Set the number of centroids as 10 and find them
    [r,c] = size(X);
    k = 10;
    GMModel = fitgmdist(X,k,'RegularizationValue',0.00001);

    centroid = zeros(k,c);

    for c_index = 1:k
        centroid(c_index,:) = GMModel.mu(c_index,:);
    end
    cenFemale = centroid;
    save('FemaleModel_GMM.mat','cenFemale');
end
