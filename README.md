# ☕ Coffee Shop Sales Performance & Customer Behavior Analysis

![Dashboard Overview](assets/dashboard_overview.png)
*(Hình ảnh tổng quan Dashboard bán hàng chuỗi quán cà phê trên Power BI)*

---

## 📌 1. Project Overview & Business Problem (Bài toán kinh doanh)
Chuỗi quán cà phê vận hành 3 chi nhánh tại New York (*Hell's Kitchen*, *Astoria*, và *Lower Manhattan*). Ban quản trị cần một hệ thống báo cáo BI toàn diện trong **6 tháng hoạt động** nhằm:
* Đánh giá sức khỏe tài chính và đà tăng trưởng doanh thu theo tháng (MoM Growth).
* Nhận diện hành vi tiêu dùng cốt lõi theo khung giờ trong ngày, ngày trong tuần và sở thích đồ uống.
* Tìm ra các "nút thắt cổ chai" trong vận hành và cơ hội thúc đẩy giá trị trung bình trên mỗi đơn hàng (AOV).

---

## 🛠️ 2. Tech Stack & Data Architecture
* **Cơ sở dữ liệu (Database & ETL):** `MySQL` (Chuẩn hóa ngày giờ `STR_TO_DATE`, lọc trùng lặp qua CTE `ROW_NUMBER()`, tính toán doanh số và chuẩn hóa kiểu dữ liệu).
* **Phân tích & Trực quan hóa (BI & Modeling):** `Power BI Desktop` (Mô hình sao Star Schema với bảng lịch chuyên biệt `Date_table`, xử lý quan hệ 1 chiều `1 ➔ *`).
* **Kỹ thuật DAX nâng cao:** `TOTALMTD`, `CALCULATE`, `ALLSELECTED` kết hợp `AVERAGEX` (vẽ đường trung bình động), hàm logic màu động và thủ thuật `Placeholder = 0` tạo nhãn kép trên thanh bar.

---

## 📊 3. Key Metrics & KPIs Tracked
* **Total Revenue (Doanh thu tháng & Tăng trưởng MoM):** Theo dõi sát sao tổng thu và mức độ chênh lệch so với tháng trước (`vs LM`).
* **Total Orders & Total Quantity Sold:** Đánh giá số lượt giao dịch và tổng sản phẩm tiêu thụ.
* **Daily Average Sales Line:** Đường mốc chuẩn mực (Benchmark) giúp phân loại ngày bán vượt trội (`Above Avg`) và ngày dưới trung bình (`Below Avg`).
* **Category Contribution & Weekend/Weekday Split:** Cơ cấu tỷ trọng các nhóm hàng và phân bổ doanh số theo thói quen sinh hoạt.

---

## 💡 4. In-depth Actionable Insights (Phân tích chuyên sâu & Khuyến nghị)

### 📈 Insight 1: Xu hướng tăng trưởng 6 tháng & "Hiệu ứng lịch" Tháng 2
* **Quan sát:** Suốt 6 tháng kinh doanh, chuỗi liên tục ghi nhận đà tăng trưởng dương. Riêng **Tháng 2** nhìn biểu đồ cột tưởng chừng doanh số bị tụt dốc, nhưng thực chất đây là **ảo giác thị giác do Tháng 2 chỉ có 28 ngày** (hụt 3 ngày so với Tháng 1).
* **Bản chất dữ liệu:** Khi chuẩn hóa sang doanh thu bình quân ngày (`Daily Avg Sales`), Tháng 2 vẫn tăng trưởng ổn định.
* 💡 **Khuyến nghị:** Khi báo cáo tài chính cho ban điều hành, luôn phải dùng chỉ số **Doanh thu trung bình ngày** làm thước đo song song để tránh nhận định sai lầm về sự chững lại của doanh nghiệp.

---

### ⏰ Insight 2: Khung giờ vàng 8:00 – 10:00 AM & Chiến lược Combo Bữa Sáng
* **Quan sát:** Xuyên suốt các tuần, lưu lượng khách tập trung cao điểm vào khung giờ **8:00 – 10:00 sáng** mỗi ngày. Khách hàng chủ yếu là học sinh, sinh viên và dân công sở ghé mua mang đi trước giờ làm/học, với dòng đồ uống chiếm ưu thế tuyệt đối là **Barista Espresso**.
* 💡 **Khuyến nghị vận hành & Tiếp thị:**
  * **Tối ưu ca trực:** Bố trí tối đa nhân sự Barista và mở toàn bộ máy thanh toán trong ca sáng (7:30 – 10:30 AM) để giảm thời gian chờ, tránh mất khách do xếp hàng lâu; ca tối giảm bớt nhân viên để tối ưu chi phí vận hành.
  * **Đảm bảo chuỗi cung ứng:** Ưu tiên số 1 cho nguồn nguyên liệu hạt cà phê pha máy Espresso chất lượng cao, không để xảy ra tình trạng thiếu hụt vào đầu ngày.
  * **Khai thác tệp bánh ngọt (Bakery):** Triển khai chương trình khuyến mãi giờ vàng: **"Combo Nạp Năng Lượng: Barista Espresso + Bánh ngọt giảm 15%"** hoặc ưu đãi "Mua 2 tặng 1" cho đồng nghiệp đi chung. Đây là đòn bẩy trực tiếp thúc đẩy nhóm hàng Bakery (hiện mới chỉ chiếm ~11.8% doanh thu) và nâng cao giá trị giỏ hàng (AOV).

---

### 🏢 Insight 3: Đánh giá Hiệu quả 3 Chi nhánh & Tiềm năng Bán Doanh nghiệp (B2B)
* **Quan sát:** Doanh thu phân bổ rất cân bằng giữa 3 cơ sở: **Hell's Kitchen (~34%)**, **Astoria (~33%)**, và **Lower Manhattan (~33%)**. Điều này chứng minh tiềm năng mở rộng chuỗi của thương hiệu là rất lớn và không bị phụ thuộc vào một mặt bằng đơn lẻ.
* 💡 **Khuyến nghị theo vị trí:**
  * *Hell's Kitchen & Astoria:* Duy trì tốc độ phục vụ tại quầy nhanh và chương trình khách hàng thân thiết địa phương.
  * *Lower Manhattan (Khu trung tâm tài chính & văn phòng lớn):* Phát triển thêm mảng **Corporate Catering** — dịch vụ cung cấp các bình cà phê dung tích lớn (Coffee Boxes) kèm khay bánh cho các cuộc họp nội bộ và hội thảo công ty.

---

### 🍵 Insight 4: Sự trỗi dậy của Nhóm Trà (Tea) & Xu hướng Tiêu dùng Mới
* **Quan sát:** Tốc độ tăng trưởng hàng tháng của nhóm **Trà (Tea đạt +33.5% MoM)** liên tục vượt qua nhóm Cà phê (+31.3%). Dữ liệu chứng minh người tiêu dùng đang có xu hướng dịch chuyển rõ rệt sang các thức uống nhẹ nhàng, thanh mát và tốt cho sức khỏe hơn.
* 💡 **Khuyến nghị:**
  * Kiểm soát chặt chẽ lượng hàng tồn kho lá trà và trà thảo mộc để đảm bảo không bị đứt hàng (Stockout) trong giai đoạn tăng trưởng nóng.
  * Mở rộng menu thêm 2–3 món trà hoa quả hoặc trà ủ lạnh (Cold Brew Tea) theo mùa để đón đầu làn sóng tiêu dùng mới và thu hút tệp khách hàng nữ giới/giới trẻ.

---

### 📅 Insight 5: Vực dậy Doanh thu Ngày Cuối tuần (Weekday vs. Weekend)
* **Quan sát:** Ngày trong tuần (Weekday) đóng góp tới **~74%** tổng doanh thu, trong khi 2 ngày cuối tuần (Weekend) chỉ chiếm vỏn vẹn **~26%**. Vào Thứ Bảy và Chủ Nhật, máy móc và diện tích quán đang bị dư thừa công suất nghiêm trọng do khách văn phòng nghỉ làm.
* 💡 **Khuyến nghị:**
  * Triển khai chiến dịch **"Weekend Chill / Thư thái cuối tuần"**:
    * **X2 điểm tích lũy thành viên** khi ghé quán vào Thứ Bảy & Chủ Nhật.
    * Tạo các workshop mini (nếm thử cà phê, cắm hoa, vẽ tranh) hoặc góc đọc sách yên tĩnh để thu hút các gia đình, bạn trẻ và người làm việc tự do (Freelancer) đến quán vào ngày nghỉ.

---

## 🎯 5. Executive Summary (Tóm tắt ma trận hành động cho Giám đốc điều hành)
| Lĩnh vực | Vấn đề phát hiện | Giải pháp hành động cụ thể | KPI kỳ vọng |
| :--- | :--- | :--- | :--- |
| **Bán hàng (Sales)** | Khách chủ yếu chỉ mua 1 ly cà phê mang đi | Tung combo **Espresso + Bakery** khung giờ 8–10h | Tăng AOV thêm **15% – 20%** |
| **Menu (Sản phẩm)** | Nhu cầu Trà tăng nhanh hơn Cà phê | Mở rộng danh mục trà trái cây & kiểm soát tồn kho | Doanh số Trà tăng **+35%** |
| **Vận hành (Ops)** | Ca sáng quá tải, ca tối dư thừa nhân lực | Dồn nhân sự sang ca sáng (7:30 - 10:30 AM) | Giảm 50% thời gian chờ order |
| **Mặt bằng (Capacity)** | Cuối tuần chỉ chiếm 26% doanh thu | Chiến dịch Weekend Chill & X2 điểm tích lũy T7-CN | Tăng tỷ trọng cuối tuần lên **>32%** |
