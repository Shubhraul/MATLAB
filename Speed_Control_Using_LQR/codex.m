% DC Motor Parameter for Motor 1, 2 & 3
[R1,R2,R3] = deal(2,2,1);
[L1,L2,L3] = deal(0.5,0.5,0.5);
[J1,J2,J3] = deal(0.02,1.2,0.01);
[B1,B2,B3] = deal(0.2,0.2,0.00003);
[Kt1,Kt2,Kt3] = deal(0.015,0.2,0.023);
[Kb1,Kb2,Kb3] = deal(0.01,0.2,0.023);

% State weight and Control weight Matrix
Rd = 0.000000009;
Qd = [0.000000009 0;0 15];

system = cell(1,3);
K_val = cell(1,3);
A_val = cell(1,3);
B_val = cell(1,3);
info = cell(1,3);
% Iterate for each Motor
for i=1:3
    % Extract Motor paramters
    R = eval(strcat('R',num2str(i)));
    L = eval(strcat('L',num2str(i)));
    J = eval(strcat('J',num2str(i)));
    B = eval(strcat('B',num2str(i)));
    Kt = eval(strcat('Kt',num2str(i)));
    Kb = eval(strcat('Kb',num2str(i)));
    
    % Obtain ABCD ss matrix for the parameter
    A = [-R/L -Kb/L; Kt/J -B/J];
    B = [1/L;0];
    C = [0 1];
    D = 0;

    
    % Obtain optimum K and Poles using Linear-Quadratic Regulator (LQR)
    [K,S,P] = lqr(A,B,Qd,Rd);

    % Calculate the new state space model for optimum K value 
    sys = ss(A-B*K,B,C,D);
    system{i} = sys;
    K_val{i} = K;
    A_val{i} = A;
    B_val{i} = B;

    % Plot the step responce and determine transient & Steady-State behaviour  
    figure(i);
    step(sys);
    grid on;
    title(strcat('Motor_',num2str(i)));

    % print the step responce information
    disp(strcat('Motor_',num2str(i)));
    info{i} = stepinfo(sys);
    disp(info{i});

end

% Plot combine steps response of Motor 1,2 &3
figure(4);
step(system{1});
hold on;    
step(system{2});
hold on;
step(system{3});
grid on;
legend('Motor1','Motor2','Motor3')
hold off;
