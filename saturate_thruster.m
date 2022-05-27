function saturated_thruster_value=saturate_thruster(thruster_value)
if thruster_value < -100
    saturated_thruster_value=-100;

elseif thruster_value > 100
    saturated_thruster_value=100;
else
    saturated_thruster_value=thruster_value;
end

end