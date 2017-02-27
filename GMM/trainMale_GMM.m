% Train the Male Model, save the result 'cenMale' into 'MaleModel_GMM.mat'
function trainMale_GMM()

    % Choose ten signals as train set
    [y1,Fs] = audioread('male1.wav');
    [y2,Fs] = audioread('male2.wav');
    [y3,Fs] = audioread('male3.wav');
    [y4,Fs] = audioread('male4.wav');
    [y5,Fs] = audioread('male5.wav');
    [y6,Fs] = audioread('male6.wav');
    [y7,Fs] = audioread('male7.wav');
    [y8,Fs] = audioread('male8.wav');
    [y9,Fs] = audioread('male9.wav');
    [y10,Fs] = audioread('male10.wav');
    
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
    
    [r,c] = size(X);
    k = 10;
    GMModel = fitgmdist(X,k,'RegularizationValue',0.00001);

    centroid = zeros(k,c);

    for c_index = 1:k
        centroid(c_index,:) = GMModel.mu(c_index,:);
    end
    cenMale = centroid;
    save('MaleModel_GMM.mat','cenMale');
end