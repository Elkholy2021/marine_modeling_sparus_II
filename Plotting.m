%% here you can implement the code in order to have some figures ...
%%
%Bonjour, I would like to thank Berin Dikic because he shared his code for
% plotting with us on our Whatsapp group and I utilized it within my
% code with some modfications.
close all
T= (1:size(PosE,1))*0.01;

figure(1)
set(gcf, 'Name', 'Velocities', 'NumberTitle' ,'off')
subplot(2,1,2)

plot(T,180*VitG_M(:,4)/pi)
hold on
plot(T,180*VitG_M(:,5)/pi)
% plot(T,180*VitG_M(:,6)/pi)
hold off
grid on
legend('roll','pitch','yaw')
title('Angular velocities')
xlabel('t [s]');
ylabel('omega [deg/s]');

subplot(2,1,1)

plot(T,VitG_M(:,1))
hold on
plot(T,VitG_M(:,2))
plot(T,VitG_M(:,3))
hold off
grid on
legend('surge','sway','heave')
title('Velocities')
xlabel('t [s]');
ylabel('v [m/s]');


figure(2)
set(gcf, 'Name', 'Positions', 'NumberTitle' ,'off')
subplot(2,1,2)

plot(T,180*PosE_M(:,4)/pi)
hold on
plot(T,180*PosE_M(:,5)/pi)
plot(T,180*PosE_M(:,6)/pi)
hold off
grid on
legend('roll','pitch','yaw')
title('Attitude')
xlabel('t [s]');
ylabel('Angle [deg]');

subplot(2,1,1)

plot(T,PosE_M(:,1))
hold on
plot(T,PosE_M(:,2))
plot(T,PosE_M(:,3))
hold off
grid on
legend('surge','sway','heave')
title('Position')
xlabel('t [s]');
ylabel('Position [m]');
set(gca, 'ydir','reverse')


figure(3)
set(gcf, 'Name', 'Accelerations', 'NumberTitle' ,'off')
subplot(2,1,2)

plot(T,180*AccG_M(:,4)/pi)
hold on
plot(T,180*AccG_M(:,5)/pi)
% plot(T,180*AccG_M(:,6)/pi)
hold off
grid on
legend('roll','pitch','yaw')
title('Angular acceleration')
xlabel('t [s]');
ylabel('alpha [deg/^2]');

subplot(2,1,1)

plot(T,AccG_M(:,1))
hold on
plot(T,AccG_M(:,2))
plot(T,AccG_M(:,3))
hold off
grid on
legend('surge','sway','heave')
title('Acceleration')
xlabel('t [s]');
ylabel('a [m/s^2]');


figure(4)
set(gcf, 'Name', 'Thruster forces', 'NumberTitle' ,'off')

plot(T,Thrust_S(:,3))
hold on
plot(T,Thrust_S(:,4))
plot(T,Thrust_S(:,5))
hold off
grid on
legend('vertical','right','left')
title('Thruster forces')
xlabel('t [s]');
ylabel('F [N]');
figure(5)
subplot(1,2,1)
rectangle('Position',[-2,-0.5,27,1],'FaceColor',[0 0.85 0.85],'EdgeColor',[0 0.85 0.85]) %sea
hold on
plot(PosE_M(:,1),PosE_M(:,2))
grid on
title('XY-plane "Top plane"')
xlabel('X-direction in meters');
ylabel('Y-direction in meters');
set(gca, 'ydir','reverse')
ylim([-0.5 0.5])
xlim([-2 25])
hold on
plot(PosE_M(1,1),PosE_M(1,2),'X','LineWidth',5)
hold on
plot(PosE_M(length(PosE_M),1),PosE_M(length(PosE_M),2),'X','LineWidth',5)
hold on
text(PosE_M(1,1),PosE_M(1,2),'\leftarrow Starting position')
text(PosE_M(length(PosE_M),1),PosE_M(length(PosE_M),2),'\leftarrow End position')

subplot(1,2,2)

title('XZ-plane "Side plane" ')
xlabel('X-direction in meters');
ylabel('Z-direction in meters');
set(gca, 'ydir','reverse')
rectangle('Position',[-2,0,27,8],'FaceColor',[0 0.85 0.85],'EdgeColor',[0 0.85 0.85]) %sea
rectangle('Position',[-2,-3,27,3],'FaceColor',[0.99 0.99 0.99],'EdgeColor',[0.99 0.99 0.99]) %air
hold on
plot(PosE_M(:,1),PosE_M(:,3))
xlim([-2 25])
ylim([-3 8])
grid on
hold on
plot(PosE_M(1,1),PosE_M(1,3),'X','LineWidth',5)
hold on
plot(PosE_M(length(PosE_M),1),PosE_M(length(PosE_M),3),'X','LineWidth',5)
hold on
text(PosE_M(1,1),PosE_M(1,3),'\leftarrow Starting position')
text(PosE_M(length(PosE_M),1),PosE_M(length(PosE_M),3),'\leftarrow End position')

figure (6)
plot3(PosE_M(:,1),PosE_M(:,2),PosE_M(:,3))
text(PosE_M(1,1),PosE_M(1,2),PosE_M(1,3),'\leftarrow Starting position')
text(PosE_M(length(PosE_M),1),PosE_M(length(PosE_M),2),PosE_M(length(PosE_M),3),'\leftarrow End position')
xlim([-1 21])
ylim([-0.5 0.5])

zlim([0 6])
set(gca, 'zdir','reverse')
title('3D visualisation')
xlabel('X-direction in meters');
ylabel('Y-direction in meters');
zlabel('Z-direction in meters');
grid on