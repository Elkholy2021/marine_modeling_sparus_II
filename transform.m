function transformed_matrix=transform(matrix,r)
H=[eye(3,3) S_(r)';
    zeros(3,3) eye(3,3)];
transformed_matrix=H'*matrix*H;
end