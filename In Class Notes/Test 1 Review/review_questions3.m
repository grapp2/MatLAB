%2.1.8
rainmat = [25, 33, 29, 42; 53, 44, 40, 56]
total = sum(rainmat,2)
mx = max(total)
max_district = find(total == mx)