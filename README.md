# flutter_calculator_NguyenVanTien
lab 2 bài thực hành 1 thiết kế máy tính nhỏ xin đơn giản bằng flutter
Flutter Calculator App

Ứng dụng máy tính đơn giản được xây dựng bằng Flutter, mô phỏng lại chính xác giao diện theo thiết kế Figma.
App hỗ trợ các phép toán cơ bản, hiển thị kết quả theo thời gian thực, xử lý số âm, số thập phân và các trường hợp biên thường gặp khi tính toán.

📸 Screenshots

Các hình ảnh cần được đặt trong thư mục:
screenshots/
Màn hình chính


<img width="302" height="476" alt="image" src="https://github.com/user-attachments/assets/5b549e33-3801-4cfc-85fa-bb810f39f266" />



Ví dụ: phép cộng



<img width="298" height="457" alt="image" src="https://github.com/user-attachments/assets/45a09f95-83b7-4060-acbd-aa63e9b1a6ae" />



<img width="297" height="481" alt="image" src="https://github.com/user-attachments/assets/a0774d26-ebf6-4663-a136-f751e7dc8f3e" />


Ví dụ: phép nhân số thập phân


<img width="298" height="472" alt="image" src="https://github.com/user-attachments/assets/8aadb186-5a6f-4b26-bb44-7fd9b129096d" />


<img width="299" height="480" alt="image" src="https://github.com/user-attachments/assets/d29a959a-088a-47d3-8c81-47afa86746eb" />

Ví dụ: âm dương + nút ±


<img width="294" height="474" alt="image" src="https://github.com/user-attachments/assets/2d6bc799-b9ff-4efb-9a01-fb7eb69d60d0" />


<img width="295" height="479" alt="image" src="https://github.com/user-attachments/assets/475bca5f-aa58-4bb5-8392-3bc45ac39427" />
<img width="300" height="482" alt="image" src="https://github.com/user-attachments/assets/6351b8ff-e431-4750-bfb2-d8d225027a14" />

Ví dụ: phép chia


<img width="297" height="474" alt="image" src="https://github.com/user-attachments/assets/25b614b6-8bb4-4285-944f-bc8a8a1a1c09" />


<img width="304" height="478" alt="image" src="https://github.com/user-attachments/assets/b308dff8-44dd-4225-9cb2-f12a60d17a83" />

Ví dụ: lỗi chia cho 0


<img width="296" height="474" alt="image" src="https://github.com/user-attachments/assets/625e1bd7-f6d0-46e8-9bbc-a0950759791e" />


<img width="296" height="476" alt="image" src="https://github.com/user-attachments/assets/ed585c76-13ac-4ceb-ac78-c7708fd42621" />

ví dụ: tính theo biểu thức


<img width="302" height="473" alt="image" src="https://github.com/user-attachments/assets/ff1c578d-3036-44ad-94ce-bd62d68cc405" />


<img width="301" height="479" alt="image" src="https://github.com/user-attachments/assets/759007fb-1ce7-47ab-b64d-72043fb05a26" />


cách dùng github:
🚀 Run Project
1. Clone repo
git clone https://github.com/username/flutter_calculator_NguyenVanTien.git

2. Di chuyển vào thư mục project
cd calculator_app

3. Cài đặt dependencies
flutter pub get

4. Chạy ứng dụng

Thiết bị Android / iOS / Emulator:

flutter run

🧮 Features & Logic
Các tính năng chính

Phép tính cơ bản: +, -, ×, ÷

Hỗ trợ số thập phân

Hỗ trợ số âm (nút ±)

Nút C → xóa toàn bộ

Nút CE → xóa ký tự cuối

Phần trăm % (chia cho 100)

Hiển thị kết quả theo thời gian thực

Không cho nhập 2 dấu . trong cùng một số

Không cho nhập 2 dấu toán tử liên tiếp

Lọc và xử lý input để tránh crash

Chain operations với thứ tự ưu tiên
5 + 3 × 2 = 11  
(Thực hiện nhân trước, sau đó cộng)

Xử lý chia cho 0

Khi gặp phép chia cho 0 → hiển thị Error

Không crash app, không freeze logic

Xử lý khi nhấn "=" nhiều lần

Nếu thiếu toán hạng → giữ nguyên kết quả hiện tại

📌 Assumptions & Notes

Giới hạn hiển thị tối đa 12 ký tự, số quá dài sẽ bị thu nhỏ hoặc cuộn tùy thiết kế.

% được tính bằng công thức:

value = value / 100



📤 Push Project lên GitHub
1. Khởi tạo Git
git init
git add .
git commit -m "Initial commit"

2. Tạo nhánh main
git branch -M main

3. Thêm remote
git remote add origin https://github.com/username/flutter_calculator_NguyenVanTien.git

4. Push lên GitHub
git push -u origin main
