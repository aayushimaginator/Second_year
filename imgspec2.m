img1 = double((imread('imag.jpg')));
img2 = double((imread('imag2.jpg')));

F1 = fft2(img1);
F2 = fft2(img2);

mag1 = abs(F1);   phase1 = angle(F1);
mag2 = abs(F2);   phase2 = angle(F2);

% Image A: Magnitude of 1 + Phase of 2
reconstruct_A = mag1 .* exp(1i * phase2);
img_swap_A = real(ifft2(reconstruct_A));

% Image B: Magnitude of 2 + Phase of 1
reconstruct_B = mag2 .* exp(1i * phase1);
img_swap_B = real(ifft2(reconstruct_B));

figure;
subplot(2,2,1); imshow(uint8(img1)); title('Original Image 1');
subplot(2,2,2); imshow(uint8(img2)); title('Original Image 2');
subplot(2,2,3); imshow(uint8(img_swap_A)); title('Mag 1 + Phase 2 (Looks like Img 2)');
subplot(2,2,4); imshow(uint8(img_swap_B)); title('Mag 2 + Phase 1 (Looks like Img 1)');