function [all_q,all_qd] = read_q_qd()


% fileID = fopen('q.txt','w');
% formatSpec = '%f';
% all_q = fscanf(fileID,formatSpec);   
% fclose(fileID);

all_q=readmatrix('q.txt');
all_qd=readmatrix('qd.txt');

% fileID = fopen('qd.txt','w');
% formatSpec = '%f';
% all_qd = fscanf(fileID,formatSpec); 
% fclose(fileID);

end

