clc; clear;
row = 8; % row number of A matrix
col = 4; % column number of A matrix
idx_num = 10;
delta_list = zeros(1,idx_num);
% Call self-defined function 
for idx = 1 : idx_num
    disp('---------Wait---------');
    disp(idx);
    A = random_matrix(row, col);
    % Check if A has full column rank 4
    while 1
        if rank(A) == min(row,col)
            break
        else
            A = random_matrix(row, col);
        end
    end
    %%% Floating point QR factorization using Given's rotation
    % Initialize Q and R matrices
    Q_inv = eye(row);
    R = A;
    % Eliminate A(q+1,p) by A(q,p)
    for p = 1:col % eliminate from left to right
        for q = (row-1):(-1):p % eliminate from bottom to top
            Q_inv_single = eye(row);
            rot_angle = atan2(R(q+1,p), R(q,p));
            Q_inv_single(q  ,q  ) =  cos(rot_angle);
            Q_inv_single(q  ,q+1) =  sin(rot_angle);
            Q_inv_single(q+1,q  ) = -sin(rot_angle);
            Q_inv_single(q+1,q+1) =  cos(rot_angle);
            % inverse of Q matrix
            Q_inv = Q_inv_single * Q_inv;
            % A matrix after one rotation
            R = Q_inv_single * R;
        end
    end
    % Q matrix
    Q = inv(Q_inv);
    % Rmatrix
    R;
    % check if Q is unitary (Q*Q'=I)
    Q_check = Q * Q';
    %%%[Q2,R2] = qr(A);
    %%% Fixed point QR factorization using Given's rotation
    
    %%% Phase 1: Determine the required word length of matrix R elements first 
    %%% by using the trigonometric functions available in Matlab
    % R element: sign bit 1 bit + decimal part 2 bits + fractional part bits
    % First start by 5 bits
    R_sign = 1;
    R_dec  = 2;
    R_frac = 10;
    R_len  = R_sign + R_dec + R_frac;

    % Initialize Q and R matrices
    Q_hat_inv = eye(row);
    R_hat = fi(A, 1, R_len, R_frac);
    % Eliminate A(q+1,p) by A(q,p)
    for p_hat = 1:col % eliminate from left to right
        for q_hat = (row-1):(-1):p_hat % eliminate from bottom to top
            Q_hat_inv_single = eye(row, 'like', R_hat);
            rot_angle_hat = atan2(R_hat(q_hat+1,p_hat), R_hat(q_hat,p_hat));
            Q_hat_inv_single(q_hat  ,q_hat  ) =  cos(rot_angle_hat);
            Q_hat_inv_single(q_hat  ,q_hat+1) =  sin(rot_angle_hat);
            Q_hat_inv_single(q_hat+1,q_hat  ) = -sin(rot_angle_hat);
            Q_hat_inv_single(q_hat+1,q_hat+1) =  cos(rot_angle_hat);
            % inverse of Q matrix
            Q_hat_inv = Q_hat_inv_single * Q_hat_inv;
            Q_hat_inv = fi(Q_hat_inv, 1, R_len, R_frac);
            % A matrix after one rotation
            R_hat = Q_hat_inv_single * R_hat;
            R_hat = fi(R_hat, 1, R_len, R_frac);
        end
    end
    % Q matrix
    Q_hat = Q_hat_inv';
    % Rmatrix
    
    % Calculate the quantization error value by self-defined function
    delta_p1 = quantization_error(R, R_hat);
        %%% Phase 2: Replace the trigonometric functions with the CORDIC scheme,
    %%% determine the required iteration number and the word length of the scaling factor K
    
    iter_num = 7;
    K_sign = 1;
    K_dec  = 0;
    K_frac = R_frac;
    K_len  = K_sign + K_dec + K_frac;
    
    Z_sign = 1;
    Z_dec  = 7;
    Z_frac = 3;
    Z_len  = Z_sign + Z_dec + Z_frac;
    
    % Initialize R matrices
    %R_hat_cordic = A;
    R_hat_cordic = fi(A, 1, R_len, R_frac);
    % Eliminate A(q+1,p) by A(q,p)
    for p_hat = 1:col % eliminate from left to right
        for q_hat = (row-1):(-1):p_hat % eliminate from bottom to top
            % computing vectoring mode once: nullification and find rotation angle for rotation mode
            % set x > 0 by adding minus sign to all the elements of the two row
            % due to the angle constraint on right half plane in CORDIC
            if R_hat_cordic(q_hat,p_hat) < 0
                for rev = p_hat:col
                    R_hat_cordic(q_hat  ,rev) = -R_hat_cordic(q_hat  ,rev);
                    R_hat_cordic(q_hat+1,rev) = -R_hat_cordic(q_hat+1,rev);
                end
            end
            x_v = R_hat_cordic(q_hat  ,p_hat); % initial input x of vectoring mode
            y_v = R_hat_cordic(q_hat+1,p_hat); % initial input y of vectoring mode
            z_v = 0;                           % initial input z of vectoring mode
            % call self-defined function vectoring_mode
            [X_v, Y_v, Z_v, K_v] = vectoring_mode(x_v, y_v, z_v, iter_num, R_len, R_frac, K_len, K_frac, Z_len, Z_frac);
            R_hat_cordic(q_hat  ,p_hat) = X_v; % renew x element after rotation
            R_hat_cordic(q_hat+1,p_hat) = Y_v; % renew y element after rotation
            
            
            % computing rotation mode (col-p_hat) times: rotate the same angle as vectoring mode
            for rot = 1: (col-p_hat)
                x_r = R_hat_cordic(q_hat  ,p_hat+rot); % initial input x of rotation mode
                y_r = R_hat_cordic(q_hat+1,p_hat+rot); % initial input y of rotation mode
                z_r = -Z_v;                            % initial input z of rotation mode
                % call self-defined function rotation_mode
                [X_r, Y_r, Z_r, K_r] = rotation_mode(x_r, y_r, z_r, iter_num, R_len, R_frac, K_len, K_frac, Z_len, Z_frac);
                R_hat_cordic(q_hat  ,p_hat+rot) = X_r; % renew x element after rotation
                R_hat_cordic(q_hat+1,p_hat+rot) = Y_r; % renew y element after rotation
            end
        end
    end
    % R matrix
    R_hat_cordic;
    
    %%% Determine the final quantization error value delta
    
    % Calculate the quantization error value by self-defined function
    delta_p2 = quantization_error(R, R_hat_cordic);
    delta_list(idx) = delta_p2;
end
idx = 1 : idx_num;
exp = zeros(1,idx_num) + 0.01;
figure;
plot(idx,delta_list,idx,exp);
title('idx v.s delta(frac=10)');
legend('delta','exp');
xlabel('idx');
ylabel('delta');