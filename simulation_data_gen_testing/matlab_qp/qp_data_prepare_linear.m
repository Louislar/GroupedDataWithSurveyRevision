% data construct
% x = [b_11, ..., b_55, a_11, ..., a_54, epsilon, gamma, beta, alpha],
% 總共49個變數 

% 1. 第一個方程式: B 大約等於 M, 最小化誤差參數使用beta (為linearlly方程式)
% 因為是一次式，所以2次項全為0
H_1 = cell(50,1);
for i = 1:25
    H_1{i} = zeros(49, 49);
    H_1{i+25} = zeros(49, 49);
end

k_1 = cell(50,1); % 50種k，總共50個constraint一次方程式 

for i = 1:25 
    tmp_arr=zeros(49, 1);
    tmp_arr(i)=1;
    tmp_arr(48)=-1;
    
    tmp_arr2=zeros(49, 1);
    tmp_arr2(i)=-1;
    tmp_arr2(48)=-1;
    
    k_1{i}=tmp_arr;
    k_1{i+25}=tmp_arr2;
end

% 注意!!不加transpose 是因為matlab的array indexing是先走完列在走行
% 注意!!這邊的M_arr是一列加總為1
M_arr = [
    0.68580936, 0.200193216, 0.070094461, 0.024581365, 0.019321597, ;
    0.288550908, 0.417405999, 0.194127588, 0.063160118, 0.036755387, ;
    0.142056691, 0.264337508, 0.377059987, 0.142386289, 0.074159525, ;
    0.095033722, 0.126916002, 0.285714286, 0.293071735, 0.199264255, ;
    0.068155785, 0.078465063, 0.112829324, 0.220504009, 0.520045819
    ];
% M_arr = [
%     0.683922,  0.298267,  0.122695,  0.083333,  0.069613, ;
%     0.211174,  0.414604,  0.287349,  0.142677,  0.093826, ;
%     0.067389,  0.202145,  0.372219,  0.265783,  0.143462, ;
%     0.021893,  0.053424,  0.147807,  0.298611,  0.198547, ;
%     0.015621,  0.031559,  0.069930,  0.209596,  0.494552
%     ]';
neg_M_arr = M_arr * -1;
d_1 = cell(50, 1);

for i = 1:25
    d_1{i} = neg_M_arr(i);
    d_1{i+25} = M_arr(i);
end


% 2. 第二個方程式: A 大約等於 G, 最小化誤差參數使用alpha (為linearlly方程式)
% 因為是一次式，所以2次項全為0
H_2 = cell(40,1);
for i = 1:20
    H_2{i} = zeros(49, 49);
    H_2{i+20} = zeros(49, 49);
end

k_2 = cell(40,1); % 40種k，總共40個constraint方程式
for i = 1:20
    tmp_arr=zeros(49, 1);
    tmp_arr(i+25)=1;
    tmp_arr(49)=-1;
    
    tmp_arr2=zeros(49, 1);
    tmp_arr2(i+25)=-1;
    tmp_arr2(49)=-1;
    
    k_2{i} = tmp_arr;
    k_2{i+20} = tmp_arr2;
end

d_2=cell(40,1);
% 注意!!加transpose 是因為matlab的array indexing是先走完列在走行
G_arr = [
    1, 0, 0, 0; 
    0, 1, 0.582, 0;
    0, 0, 0.418, 0.563;
    0, 0, 0, 0.289;
    0, 0, 0, 0.148
    ]';
% G_arr = [
%     1.0,  0.0,  0.000000,  0.000000;
%     0.0,  1.0,  0.491212,  0.000000;
%     0.0,  0.0,  0.508788,  0.074288;
%     0.0,  0.0,  0.000000,  0.1078015;
%     0.0,  0.0,  0.000000,  0.817911
%     ]';
neg_G_arr = G_arr * -1;
for i=1:20
    d_2{i} = neg_G_arr(i);
    d_2{i+20} = G_arr(i);
end

