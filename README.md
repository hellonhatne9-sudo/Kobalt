# KOBALT (Match) - AntiCheat System

Thư mục này chứa toàn bộ các script và module cấu thành **Hệ thống Chống Gian lận & Giám sát (AntiCheat & Security System)** được trích xuất từ **KOBALT (Match)_116409709288055**.

---

## Danh sách các Module AntiCheat

| File | Kích thước | Vai trò & Chức năng |
|---|---|---|
| `AntiCheat.ModuleScript.lua` | 36.4 KB | **Module AntiCheat Trung Tâm**: Cung cấp giao diện bảng điều khiển, bộ kiểm tra gian lận (Checks), tính năng AutoKick, Ban người chơi (1D, 7D, 30D, PERM), Unban, kiểm tra danh sách vi phạm (`acBan`, `acKick`, `acBanInfo`), truy vấn Admin qua `AdminQuery`. |
| `AnimGuardController.ModuleScript.lua` | 7.2 KB | **Bảo vệ Trạng thái & Animation (Exploit Guard)**: Theo dõi liên tục nhân vật người chơi trong `workspace.Live`, phát hiện và ngăn chặn các hành vi hack/exploit trạng thái bay (Fly), rơi tự do trái phép (FreeFall), bơi trên cạn, hoặc hồi máu gian lận (Healing animation spoofing). |
| `Staff.ModuleScript.lua` | 49.4 KB | **Hệ thống Quản trị & Xử lý Vi phạm Staff**: Xử lý các hình thức phạt từ bảng điều khiển anti-cheat (`YOU (anti-cheat panel)`), quản lý danh sách cấm, lưu vết các bản ghi vi phạm trong tháng theo múi giờ địa phương. |
| `UI_Staff.ModuleScript.lua` | 57.3 KB | **Giao diện Giám sát Gian lận cho Mod/Staff**: Hiển thị bảng theo dõi người chơi, chấm điểm nguy cơ gian lận (`acText`: `anti-cheat clean` hoặc `anti-cheat score/max + lý do nghi vấn`). |
| `UI_Admin.ModuleScript.lua` | 54.3 KB | **Giao diện Admin Panel**: Nút kích hoạt bảng Anti-cheat (`AntiCheatBtn`), kết nối quyền hạn quản trị viên cấp cao để thực thi các lệnh bảo mật. |
| `VehicleConfig.ModuleScript.lua` | 13.3 KB | **Cấu hình Anti-Cheat Xe Cộ**: Chứa các thông số phát hiện hack tốc độ và dịch chuyển xe: `Interval = 0.5`, `SpeedTolerance = 1.45`, `SpeedSlack = 15`, `MaxRise = 30`, `Teleport = 60`, `Strikes = 3`. |

---

## Chi tiết Cơ chế Phát hiện của KOBALT AntiCheat

1. **Kiểm tra Trạng thái Nhân vật (AnimGuard)**:
   - Quét tất cả người chơi trong `workspace.Live`.
   - Nếu phát hiện Animation ID thuộc nhóm rơi tự do (`FreeFall`, `FreeFallDive`) nhưng nhân vật không có thuộc tính `Deploy == "FreeFall"` -> Dừng animation ngay lập tức.
   - Nếu phát hiện Animation ID thuộc nhóm hồi phục máu mà không đang sử dụng item hợp lệ -> Chặn và dừng animation.

2. **Chấm điểm Gian lận (Suspicion Score - acText)**:
   - Hệ thống đánh giá dựa trên `p96.s` (điểm vi phạm hiện tại) và `p96.m` (điểm vi phạm tối đa đạt tới).
   - Nếu không có vi phạm: Trả về trạng thái `"anti-cheat clean"`.
   - Nếu vượt ngưỡng: Hiển thị điểm số kèm nhãn vi phạm (reason code) trên thanh điều khiển của Staff.

3. **Cơ chế Xử phạt Tự động & Thủ công**:
   - Tự động đá khỏi trận (`AutoKick`) khi số lần vi phạm (strikes) vượt giới hạn.
   - Quyền xử phạt qua RemoteFunction `AdminQuery` với các mức: 1 ngày, 7 ngày, 30 ngày hoặc cấm vĩnh viễn (PERM).
