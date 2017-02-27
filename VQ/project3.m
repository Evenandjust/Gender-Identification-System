function project3(x,fs)

    load 'MaleModel.mat'
    load 'FemaleModel.mat'
        
    [y,fs] = audioread(x);
    
    % Test signal with white noise
%     y = awgn(y,0);

    % Test signal with different duration
%     y = y(1:round(length(y)/3));
%     y = y(1:12500);

    % Test signal with different noise
%     y = addrev(y,8000,3,3,1);

    frameLen = 256;
    overlap = 0;
    c_index = 10;
    
    % Generate its feature vector
    Z = featureVectors(y,frameLen,overlap,fs);
    [row,col] = size(Z);
    dSum1 = 0;
    dSum2 = 0;

    w1=ones(1,c_index);
    w2=ones(1,c_index);

    % Calculate the distortion D
    for i = 1:row
        d_MinMale = norm(Z(i,:)-cenMale(1,:));
        id_MinMale = 1;

        d_MinFemale = norm(Z(i,:)-cenFemale(1,:));
        id_MinFemale = 1;

        for c_id = 1:c_index
            if norm(Z(i,:)-cenMale(c_id,:))<d_MinMale
                id_MinMale = c_id;
                d_MinMale = norm(Z(i,:)-cenMale(c_id,:));
            end
            dSum1 = dSum1 + d_MinMale*w1(id_MinMale);

            if norm(Z(i,:)-cenFemale(c_id,:))<d_MinFemale
                id_MinFemale = c_id;
                d_MinFemale = norm(Z(i,:)-cenFemale(c_id,:));
            end
            dSum2 = dSum2 + d_MinFemale*w2(id_MinFemale);
        end
    end

    D1 = dSum1/row;
    D2 = dSum2/row;
    
    % Decision
    if D1<D2
        label = 1;
    else
        label = 0;
    end

    if label==1
%         g = 'Male';
        fprintf('Male\n');
    elseif label == 0
%         g = 'Female';
        fprintf('Female\n');
    end

end