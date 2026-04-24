img = imread('imag.jpg');
if size(img, 3) == 3
    img = rgb2gray(img);
end
img = double(img);

f_transform = fftshift(fft2(img));

mag_spectrum = abs(f_transform);
phase_spectrum = angle(f_transform);

reconstructed_complex = mag_spectrum .* exp(1i * phase_spectrum);

reconstructed_img = ifft2(ifftshift(reconstructed_complex));
reconstructed_img = real(reconstructed_img);

figure;
subplot(2,2,1); imshow(uint8(img)); title('Original Image');
subplot(2,2,2); imshow(log(1 + mag_spectrum), []); title('Magnitude Spectrum (Log Scale)');
subplot(2,2,3); imshow(phase_spectrum, []); title('Phase Spectrum');
subplot(2,2,4); imshow(uint8(reconstructed_img)); title('Reconstructed Image');