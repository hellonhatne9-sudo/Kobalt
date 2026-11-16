# KOBALT (Match) - Gun & Weapon System

Thư mục này chứa toàn bộ các script và module cấu thành **Hệ thống Súng & Vũ khí (Gun & Weapon System)** được trích xuất từ **KOBALT (Match)_116409709288055**.

---

## 1. Core Weapon Controller & Combat (Điều khiển & Cơ chế Bắn)

| File | Kích thước | Vai trò & Chức năng |
|---|---|---|
| `WeaponController.ModuleScript.lua` | 85.6 KB | Controller súng trung tâm: Xử lý cơ chế khai hỏa (fire), nạp đạn (reload), ngắm (ADS), chuyển chế độ bắn (semi/burst/auto), tính độ giật (recoil), cự ly ngắm (zeroing), kiểm tra đạn và bắn phía client. |
| `Ballistics.ModuleScript.lua` | 6.1 KB | Tính toán vật lý đường đạn: Vận tốc đầu nòng, độ rơi trọng lực (gravity drop), ma sát/cản gió (drag) theo thời gian thực. |
| `BallisticsFx.ModuleScript.lua` | 117.1 KB | Hiệu ứng đạn bay: Vẽ tia đạn (tracers), âm thanh đạn rít qua người (whiz/flyby), hiệu ứng va chạm bề mặt (surface impact sparks/dust). |
| `Hitbox.ModuleScript.lua` | 5.4 KB | Hệ thống Hitbox: Xác định vị trí trúng đạn trên cơ thể (Head, Neck, UpperChest, Stomach, Limbs) và kiểm tra raycast hợp lệ. |
| `WeaponRig.ModuleScript.lua` | 24.9 KB | Ghép mô hình vũ khí, socket phụ kiện súng, liên kết các khớp xương (rigging/attachment sockets). |
| `WeaponStats.ModuleScript.lua` | 8.4 KB | Tính toán chỉ số súng: Sát thương, tốc độ bắn (RPM), độ giật, độ tản mát (spread) khi trang bị phụ kiện. |
| `VehicleFire.ModuleScript.lua` | 9.5 KB | Cơ chế súng/vũ khí gắn trên xe cơ giới. |
| `FlareSky.ModuleScript.lua` | 1.2 KB | Cơ chế súng bắn pháo sáng gọi hòm thính hoặc hiệu ứng bầu trời. |
| `MeleeController.ModuleScript.lua` | 9.2 KB | Điều khiển vũ khí cận chiến (dao/xẻng/gậy). |
| `AimAssist.ModuleScript.lua` | 5.5 KB | Hệ thống hỗ trợ bám mục tiêu khi ngắm (Aim Assist cho mobile/gamepad). |
| `DamageFx.ModuleScript.lua` | 15.0 KB | Hiệu ứng trúng sát thương, tia máu, âm thanh hit sound, hit marker. |
| `ShellFx.ModuleScript.lua` | 19.7 KB | Hiệu ứng văng vỏ đạn (casing ejection) ra khỏi buồng đạn khi bắn. |

---

## 2. Viewmodel & First-Person Handling (Góc nhìn thứ nhất & Animation)

| File | Kích thước | Vai trò & Chức năng |
|---|---|---|
| `ViewmodelController.ModuleScript.lua` | 131.2 KB | Quản lý khung nhìn súng thứ nhất (viewmodel), rung lắc khi di chuyển (bobbing/sway), impulse khi giật súng, chuyển đổi trạng thái vũ khí. |
| `Arms.ModuleScript.lua` | 18.6 KB | Quản lý hai cánh tay nhân vật cầm súng ở góc nhìn thứ nhất. |
| `Pose.ModuleScript.lua` | 26.8 KB | Tính toán tư thế cầm súng, căn chỉnh mắt vào tâm ngắm (ADS cheek alignment / eye offset). |
| `Actions.ModuleScript.lua` | 141.7 KB | Xử lý animation chi tiết của hành động súng (rút súng, nạp đạn thường, nạp đạn rỗng, kiểm tra súng). |
| `Clips.ModuleScript.lua` | 8.9 KB | Quản lý animation tháo/lắp băng đạn và hiển thị băng đạn. |
| `Reticle.ModuleScript.lua` | 6.3 KB | Hiển thị và xử lý độ nở hồng tâm (reticle bloom / crosshair spread). |
| `ScopeOverlay.ModuleScript.lua` | 21.7 KB | Lớp phủ kính ngắm quang học (ống ngắm bắn tỉa, red dot / holo optic zoom). |
| `Props.ModuleScript.lua` | 25.7 KB | Các phụ kiện và vật phẩm đi kèm vũ khí khi cầm trên tay. |

---

## 3. Configuration & Databases (Dữ liệu cấu hình & Skin)

| File | Kích thước | Vai trò & Chức năng |
|---|---|---|
| `WeaponConfig.ModuleScript.lua` | 56.4 KB | Toàn bộ cơ sở dữ liệu chỉ số súng (danh sách súng, dame gốc, tầm bắn, băng đạn, cỡ đạn, âm thanh). |
| `WeaponFallback.ModuleScript.lua` | 5.2 KB | Thông số cấu hình mặc định dự phòng khi súng thiếu dữ liệu. |
| `AttachmentConfig.ModuleScript.lua` | 13.4 KB | Cấu hình tất cả các phụ kiện: Nòng giảm thanh, tay cầm giảm giật, băng đạn mở rộng, kính ngắm. |
| `DamageConfig.ModuleScript.lua` | 6.7 KB | Bảng hệ số nhân sát thương theo từng bộ phận cơ thể và lớp giáp. |
| `LegendarySkins.ModuleScript.lua` | 3.7 KB | Cấu hình các skin súng cấp độ huyền thoại (hiệu ứng đặc biệt). |
| `I_WeaponSkins_1.ModuleScript.lua` | 222.5 KB | Dữ liệu asset và hình ảnh skin súng phần 1. |
| `I_WeaponSkins_2.ModuleScript.lua` | 83.0 KB | Dữ liệu asset và hình ảnh skin súng phần 2. |
| `Weapon.ModuleScript.lua` | 20.6 KB | Giao diện HUD hiển thị slot súng, số lượng đạn hiện có/dự trữ, chế độ bắn. |
