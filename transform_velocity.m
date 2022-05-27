function transformed_matrix=transform_velocity(matrix,r)
H=[eye(3,3) S_(r)';
    zeros(3,3) eye(3,3)];
transformed_matrix=H*matrix;
end