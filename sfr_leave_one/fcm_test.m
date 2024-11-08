%-- 2/19/07  2:39 PM --%
data1 = ra(2,:);
%data2 = ra(6,:);
x=1:length(data1);
data = [x' data1'];
[center, U, obj_fcn]=fcm(data,2);
maxU = max(U);
% Find the data points with highest grade of membership in cluster 1
index1 = find(U(1,:) == maxU);
% Find the data points with highest grade of membership in cluster 2
index2 = find(U(2,:) == maxU);
%index3 = find(U(2,:) == maxU);
figure
% Plot the cluster centers
plot([center([1 2],1)],[center([1 2],2)],'*','color','k');
line(data(index1,1),data(index1,2),'marker','.','color','g');
line(data(index2,1),data(index2,2),'marker','*','color','r');
%line(data(index3,1),data(index3,2),'marker','.','color','b');
