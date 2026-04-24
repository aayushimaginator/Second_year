A = [3 1 0; 1 3 1; 0 1 3]; v = [1;1;1]; tol = 1e-6; lam = 0;
for it = 1:100
    w = A*v; lam_new = max(abs(w));
    v = w/lam_new;
    if abs(lam_new-lam) < tol; break; end
    lam = lam_new;
end
disp(lam_new);