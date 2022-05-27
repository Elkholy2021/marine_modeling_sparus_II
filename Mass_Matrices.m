% clear all
% clc
%%
Body_Mass_Matrix
Added_Mass_Matrix_Cylinder
Added_Mass_Matrix_Antenna
Added_Mass_Matrix_Left_Thruster
Added_Mass_Matrix_Right_Thruster

%%
Body_mass_matrix=whole_body.M_RB


Added_mass_matrix_cylinder=cyl.M_a
r_CG_cyl_to_CG=[0.05 0 0]; %CG_cyl is in the center of the cylinder "0.8m from both ends" and CG is
% the center of gravity for the whole AUV of which every thing will be calculated with resepct to it
Added_mass_matrix_cylinder_transformed= transform(Added_mass_matrix_cylinder,r_CG_cyl_to_CG)


r_CG_antenna_to_CG=[-0.41,0,-0.2450];

Added_mass_matrix_antenna=antenna.M_a
Added_mass_matrix_antenna_transformed=transform(Added_mass_matrix_antenna,r_CG_antenna_to_CG)


r_CG_left_thruster_to_CG=[-0.59,-0.17,0];
Added_mass_matrix_left_thruster=left_thruster.M_a
Added_mass_matrix_left_thruster_transformed=transform(Added_mass_matrix_left_thruster,r_CG_left_thruster_to_CG)


r_CG_right_thruster_to_CG=[-0.59,0.17,0];
Added_mass_matrix_right_thruster=right_thruster.M_a
Added_mass_matrix_right_thruster_transformed=transform(Added_mass_matrix_right_thruster,r_CG_right_thruster_to_CG)
%%
Complete_Added_Mass_Matrix=Added_mass_matrix_cylinder_transformed+Added_mass_matrix_antenna_transformed+Added_mass_matrix_left_thruster_transformed+Added_mass_matrix_right_thruster_transformed
Global_Mass_Matrix=Body_mass_matrix+Complete_Added_Mass_Matrix