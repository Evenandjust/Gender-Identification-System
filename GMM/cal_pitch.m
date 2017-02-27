% @author: XZZ

% Subfunction to calculate pitch
function vector = cal_pitch(frameData,Fs)
    y = frameData;
    
    % Normalize the data
    max_value=max(abs(y));
    y=y/max_value;
    
    % Calculate autocorrelation
    for l=0:(length(y)-1)
        sum1=0;
        for u=1:(length(y)-l)
          s=y(u)*y(u+l);
          sum1=sum1+s;
        end
        autocor(l+1)=sum1;
    end
    
    % Find the pitch period and frequency
    auto=autocor(11:220);
    maxA=0;
    sampleNo = 0;
    for v=1:210
        if(auto(v)>maxA)
          maxA=auto(v);
          sampleNo=v;
        end 
    end
    pitchPeriod=(10+sampleNo)*(1/Fs);
    pitchFreq=1/pitchPeriod;
    vector = pitchFreq;

end
