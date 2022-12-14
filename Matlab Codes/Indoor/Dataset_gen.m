
format short g
N = 20;  % Number of Frames
W = 100; % length of the test Dataset, e.g. from R100 to R200
L = 121; % length of each rows (from DeepMIMO website)
Nt = 32 ;  % Number of antennas at BS
Nc = 32 ;  % Number of Subcarriers
%% Constructing V
V = zeros(Nt,Nt);

for i = 1 : Nt
    for j = 1 : Nt
        V(i,j) = exp(-1i * 2 * pi * i * ( j - Nt/2) / Nt );
    end 
end 

%% Constructing F
F = zeros(Nc,Nc);

for i = 1 : Nc
    for j = 1 : Nc
        F(i,j) = exp(1i * 2 * pi * i * j / Nc );
    end 
end 


for iii = 1 : 100 * 121
clearvars -except iii DeepMIMO_dataset iji 
iii
N = 20;  % Number of Frames
W = 100; % length of the test Dataset, e.g. from R100 to R200
L = 121; % length of each rows (from DeepMIMO website)
Nt = 32 ;  % Number of antennas at BS
Nc = 32 ;  % Number of Subcarriers 
Thr1 = 50;
Thr2 = 10;


% reading dataset from struct array
H = DeepMIMO_dataset{1}.user{iii}.channel;
Loc = DeepMIMO_dataset{1}.user{iii}.loc;

 




%% Constructing Angle-delay profiles 

ADP = V' * H * F ;

dlmwrite('TrainDataADP.csv',abs(ADP),'delimiter',',','-append','precision',4);
dlmwrite('TrainDataLoc.csv',Loc,'delimiter',',','-append','precision',4);

end
