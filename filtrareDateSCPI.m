function [y,u,amortizare] = filtrareDateSCPI(data)
    
% raw data
% figure;
% plot(data.Time, data.Data);
% grid on;
% xlabel('Time (s)');
% ylabel('Amplitude');
% title('Step Response - Nivel Ursu 1');


data.Data(1) = 220;
data.Data(2) = 220;
for i = 1:309 
    if (data.Data(i)-data.Data(i+1))>20
        data.Data(i+1)=data.Data(i);
    end
end

% after 
% figure;
% plot(data.Time, data.Data);
% grid on;
% xlabel('Time (s)');
% ylabel('Amplitude');
% title('Step Response - Nivel Ursu 1');

data.Data = data.Data*-1 + 220;

% figure;
% plot(data.Time, data.Data);
% grid on;
% xlabel('Time (s)');
% ylabel('Amplitude');
% title('Step Response - Nivel Ursu 1');

amortizare = data.Data(1:20);
newData.Data = data.Data(20:end);
newData.Time = data.Time(20:end);

% figure;
% plot(newData.Time, newData.Data);
% grid on;
% xlabel('Time (s)');
% ylabel('Amplitude');
% title('Step Response - Nivel Ursu 1');

% Filtru moving average
windowSize = 5;
filteredData = movmean(newData.Data, windowSize);
% 
% figure;
% plot(newData.Time, filteredData, 'LineWidth', 2);
% grid on;
% xlabel('Time (s)');
% ylabel('Amplitude');
% title('Filtered Step Response');

u = newData.Time;
y=filteredData;
end