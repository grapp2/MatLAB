% triangle_area.m
p_1 = input('Enter the coordinate of point 1 [x1, y1]: ');
p_2 = input('Enter the coordinate of point 2 [x2, y2]: ');
p_3 = input('Enter the coordinate of point 3 [x3, y3]: ');
area = compute_area(p_1, p_2, p_3);
fprintf('The area is %.3f\n', area);