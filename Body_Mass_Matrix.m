
whole_body.m=52;

% whole_body.Ig=[0.42 0 0.01;
%             0 11.39 0;
%             0.01 0 11.44];

whole_body.Ig=[0.42 0 0.03;
            0 10.42 0;
            0.03 0 10.47];
                
whole_body.M_RB=[whole_body.m*eye(3) zeros(3);
                zeros(3) whole_body.Ig];  
