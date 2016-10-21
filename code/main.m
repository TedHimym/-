%% ================load picture====================================
pic = imread('test_2.png');
if ~(size(size(pic), 2)==2)
    pic = rgb2gray(pic);
end

%% ================find object=====================================
X = zeros(size(pic));
X(pic<123) = 1;
% the write place is 0
% other place is 1

%% ========set two matix about they's location(row and col)========
A_c = zeros(size(pic));
A_r = zeros(size(pic));
for i = 1: size(pic, 2)
    A_c(:, i) = i;
end
for j = 1: size(pic, 1)
    A_r(j, :) = j;
end

%% ========set the location matix at the place where is 1==========
X_c = zeros(size(pic));
X_r = zeros(size(pic));
X_c = X .* A_c;
X_r = X .* A_r;

%% ================compute it======================================
x_center = sum(sum(X_c))/sum(sum(X));
y_center = sum(sum(X_r))/sum(sum(X));

%% ========show the point==========================================
pic(round(y_center)-10:round(y_center)+10, ...
    round(x_center)-10:round(x_center)+10) = 100;
imshow(pic);