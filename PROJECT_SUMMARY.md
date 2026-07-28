# Project Summary — Pattarapong Tensuna Portfolio Website

## ภาพรวมโปรเจกต์
เว็บไซต์พอร์ตโฟลิโอแบบไฟล์เดียว (`index.html`) สำหรับ Pattarapong Tensuna ตำแหน่ง IT Support / IT Officer / Helpdesk / IT Administrator
- **Tech stack**: HTML + Tailwind CSS (CDN) + Vanilla JavaScript + Supabase JS client (CDN) — เชื่อมต่อ Supabase จริงแล้ว (ดูหัวข้อ "Supabase Integration" ด้านล่าง)
- **Hosting**: GitHub Pages (static) — โค้ด `index.html` + asset ทั้งหมดอยู่ใน repo เดียวกับที่ push อัตโนมัติผ่าน git
- **GitHub repo**: **เปลี่ยนชื่อแล้ว (2026-07-28)** จาก `pattarapong.ten` → **`portfolio`** — URL ปัจจุบัน: `https://github.com/pattarapong123-lang/portfolio` (branch `main`) — **local git remote `origin` อัปเดตให้ชี้ที่ repo ใหม่แล้ว**
- **URL เว็บจริง**: `https://pattarapong123-lang.github.io/portfolio/` (เปลี่ยนจาก `/pattarapong.ten/` เดิม เพราะ rename repo — ผู้ใช้ขอให้ลิงก์สั้นลง เคยแนะนำให้เปลี่ยนชื่อ repo เป็น `pattarapong123-lang.github.io` เฉยๆ เพื่อตัด path ออกทั้งหมด แต่ผู้ใช้เลือกตั้งชื่อ `portfolio` แทน จึงยังมี `/portfolio/` ต่อท้ายอยู่)
- **โครงสร้างไฟล์**:
  - `D:\Project_port\index.html` — เว็บไซต์ทั้งหมด (section เดียว ไม่มีหน้า Contact แยก)
  - `D:\Project_port\assets\Pattarapong_Tensuna_CV.pdf.pdf` — ไฟล์ CV จริงของผู้ใช้ (ปุ่ม Download CV ลิงก์ไปที่นี่) — **อัปเดตไฟล์ล่าสุดแล้ว (2026-07-28)**
  - `D:\Project_port\photos\p1.png` — รูปโปรไฟล์ hero section (วงกลม)
  - `D:\Project_port\photos\a1.jpg` — รูปโปรไฟล์เต็มตัวที่ใช้ใน About Me section
  - `D:\Project_port\photos\Gallery\s1.jpg` – `s15.png` — รูปภาพสภาพแวดล้อมงาน/โครงสร้างพื้นฐานจริง **15 รูป** ใช้ใน Career Transition Gallery เท่านั้น — **นามสกุลไฟล์ไม่เท่ากันทุกไฟล์**: ส่วนใหญ่เป็น `.jpg`, แต่ `s5` = `.png`, `s7` = `.jpeg`, `s12`/`s15` = `.png` — **ต้องเช็ค path จริงในโค้ดก่อนแก้ อย่าเดานามสกุล**
  - `D:\Project_port\photos\Logos\dohome.png`, `foryouall.png`, `fountaintree.png` — โลโก้บริษัท/สถานที่ทำงานจริง แสดงเป็นวงกลมมุมขวาบนของการ์ดใน Work Experience timeline
  - `D:\Project_port\photos\icons\*.png` (+ ไม่กี่ไฟล์เป็น `.jpg`) — ไอคอนทักษะจริง ~50 ไฟล์ ใช้ใน Skills section (ไอคอนต่อ item ไม่ใช่ต่อหมวดหมู่) + `line.png`, `gmail.png` ใช้ใน About Me → Personal Details (Line ID/Email)
  - `D:\Project_port\photos\Projects\<slug>\` — โฟลเดอร์รูปจริงแยกตามโปรเจกต์ (ดูรายละเอียดครบในหัวข้อ Projects ด้านล่าง): `setup-cb`, `setup-sr`, `setup-br`, `pm-network`, `pm-computer-bn`, `renovate-ub`, `tranning-bw`, `monitoring-center`, `it-asset-management`, `it-hardware-repair`, `ap-replacement`, `server-virtualization`
  - `D:\Project_port\my project\` — โฟลเดอร์ต้นทางที่ผู้ใช้วางรูป+ไฟล์ .txt รายละเอียดโปรเจกต์ไว้ให้ก่อนอัปโหลด (อยู่นอก `photos/`, **ไม่ได้ push ขึ้น repo** — เป็น scratch source เท่านั้น, ไฟล์จริงที่ใช้บนเว็บอยู่ใน `photos/Projects/<slug>/` เสมอ) — โฟลเดอร์ย่อยที่เคยใช้แล้ว: `Setup CB/SR/BR`, `PM Network`, `Pm Computer BN`, `Renovate UB`, `Tranning BW`, `Monitor BN`, `asset it`, `Fix`, `AP`, `server`

## ลำดับ Section บนหน้าเว็บ (บนลงล่าง)
1. **Navigation** — fixed navbar, smooth scroll, dark/light toggle (persist ผ่าน localStorage), hamburger menu บนมือถือ
   - **บั๊กที่เจอและแก้แล้ว**: มือถือบางรุ่นเคยบีบหน้าเว็บไปคอลัมน์แคบทางซ้าย — แก้โดยเพิ่ม `overflow-x: hidden` + `max-width: 100vw` ให้ทั้ง `<html>` และ `<body>` — **ถ้าจะปรับ marquee/gallery อีก ต้องระวังไม่ให้ overflow ของทั้งหน้าเว็บหลุดอีก**
   - เพิ่ม `#navbar { transform: translateZ(0); }` ป้องกันบั๊ก fixed-header ไม่ยอม paint บน mobile browser บางตัว
2. **Hero (`#home`)** — 2 คอลัมน์: ซ้ายเป็นชื่อตัวพิมพ์ใหญ่, "Hi, my name is" + typing effect หมุนตำแหน่งงาน (สีส้ม), badge "Available for Work" (สีเขียว emerald), ปุ่ม "My Projects" + Download CV (ลิงก์ไปไฟล์จริงแล้ว), social links (GitHub/LinkedIn ยังเป็น placeholder URL, Email จริง); ขวาเป็นรูปโปรไฟล์วงกลมพร้อม glow animation
3. **Career Transition Gallery (`#gallery`)** — ไม่มี lightbox (ถอดออกตามคำขอผู้ใช้) รูปทั้งหมด 15 รูปจาก `photos/Gallery/`
   - Auto-scroll + drag-to-pan + momentum/inertia ผ่าน `transform: translateX()` (ไม่ใช้ native scroll เพราะจะ clip hover-scale effect) — ฟังก์ชัน `initMarquee()`
   - **ห้ามใส่ `overflow-x: auto`/`hidden` กลับเข้าไปที่ `.marquee-wrapper` หรือ `#gallery` section เด็ดขาด เดี๋ยว hover-scale จะพังอีก**
4. **My Journey (`#journey`)** — timeline แบบ tab สลับ Education/Work Experience, default tab = Work Experience, ข้อมูลจริงทั้งหมด
   - การ์ด Work Experience กดขยายดูรายละเอียดได้ ("More/Less"), มีโลโก้บริษัทวงกลมมุมขวาบน, "Key Responsibilities" รองรับ flat list หรือ grouped `[{title, items}]`
   - Work Experience (ล่าสุดก่อน): IT Support @ Dohome Bangna (06/2023–Present) → IT Officer Setup @ Dohome HQ (06/2021–06/2023) → IT Service Onsite @ FOR YOU ALL (06/2019–06/2021) → IT Support Trainee @ Fountaintree Resort (11/2018–03/2019)
   - Education (ล่าสุดก่อน): Bachelor's @ Sisaket Rajabhat University (2015–2019) → High School @ Satreesiriket (2010–2013) → Middle School @ Kraipakdee Wittayakom (2007–2009)
5. **Skills (`#skills`)** — ข้อมูลจริง 6 หมวด / 60 ทักษะ (Server & Monitoring, Hardware, OS & Software, CCTV, Management, Network)
   - **มือถือ/iPad (<1024px)**: carousel แถวเดียว auto-advance ทุก 3 วิ, 4×2=8 ไอคอนต่อหน้า, bounce-in pop animation, pagination dots + swipe — `renderSkillCarousel()`, `CAROUSEL_PER_PAGE = 8`, `CAROUSEL_INTERVAL = 3000`
     - หน้าไม่เต็ม 8 ไอคอนจะเติม placeholder `invisible` (ห้ามใช้ empty div เปล่าเด็ดขาด เดี๋ยวแถวยุบ)
   - **Desktop (≥1024px)**: grid ปกติ `lg:grid-cols-6` ไม่มี carousel
   - **ประวัติสำคัญ (ห้ามทำผิดซ้ำ)**: เคยลอง 14 หมวดย่อย → rollback กลับ 5+1 หมวด; เคยลอง **circular "orbit" wheel UI** ทำเสร็จสมบูรณ์แต่ผู้ใช้บอก "ไม่สวย" ขอ rollback เต็มรูปแบบ — **ห้ามเสนอ orbit UI อีกโดยไม่ถามก่อน**
6. **Projects (`#projects`)** — **ข้อมูลจริงทั้งหมด 12 โปรเจกต์แล้ว (อัปเดตล่าสุด 2026-07-28)**, เรียงตาม `sort_order` จากน้อยไปมาก (0–11) ตามลำดับที่ผู้ใช้กำหนดเอง ดังนี้ (เรียงจากบนสุด/หน้าแรกก่อน):
   1. **Newstore IT System Setup — Dohome Amata Nakorn** (`Infrastructure`, 12 รูป, `photos/Projects/setup-cb/`) — details เต็ม 5 หมวด (Network & Infrastructure / Hardware & End-User Devices / Retail & POS Systems / Special Systems & IoT / Management QA & Handover)
   2. **Network Preventive Maintenance — 6 Dohome Branches** (`Maintenance`, 12 รูป, `photos/Projects/pm-network/`) — details 1 หมวด 4 ข้อ — **รูปเคยถูกแทนที่ใหม่แล้วครั้งหนึ่ง (2026-07-27)**, extension บางไฟล์เปลี่ยนไป (7/8 เป็น .jpg, 9/10 เป็น .jpeg) ต้องเช็ค path จริงถ้าจะแก้อีก
   3. **On-Premises Server Installation & Virtualization Infrastructure** (`Infrastructure`, 11 รูป, `photos/Projects/server-virtualization/`, ต้นทาง `my project/server/` ไฟล์เดิมเป็น 1-8,10,11,12 [ไม่มี 9] เรียงเลขใหม่ต่อเนื่อง) — details 1 หมวด 4 ข้อ (Server Installation/iLO, Virtualization Platform Deployment VMware/Proxmox/ZStack, VM Management, Network Backup)
   4. **Access Point Replacement** (`Infrastructure`, 12 รูป, `photos/Projects/ap-replacement/`) — details 1 หมวด 3 ข้อ (Ubiquiti UniFi → Ruijie 50+ จุด, Dead Zone Mitigation, RF Optimization)
   5. **Centralized IT Monitoring & Alerting System — Monitoring Center** (`Infrastructure`, 6 รูป, `photos/Projects/monitoring-center/`, ต้นทาง `my project/Monitor BN/`) — details 1 หมวด 2 ข้อ (Zabbix, Uptime Kuma + MS Teams webhook alert)
   6. **Newstore IT System Setup — Dohome Surat Thani** (`Infrastructure`, 12 รูป, `photos/Projects/setup-sr/`) — details เต็ม 5 หมวดเหมือนข้อ 1
   7. **Preventive Maintenance & Hardware Upgrade — Dohome Bangna (100 PCs)** (`Maintenance`, 12 รูป, `photos/Projects/pm-computer-bn/`) — details 1 หมวด 5 ข้อ (Cleaning, Thermal Paste, RAM 8→16GB, HDD→SSD, QC)
   8. **IT System Restoration & Renovation — Dohome Ubon Ratchathani** (`Infrastructure`, 12 รูป, `photos/Projects/renovate-ub/`, งานฟื้นฟูหลังน้ำท่วม ไม่มีไฟล์ .txt ต้นทาง ผู้ใช้พิมพ์รายละเอียดในแชท) — details 1 หมวด 5 ข้อ
   9. **IT Hardware Repair & Maintenance** (`Maintenance`, 12 รูป, `photos/Projects/it-hardware-repair/`, ต้นทาง `my project/Fix/`) — details 1 หมวด 3 ข้อ (Printer Repair, Handheld Device Repair, General IT Equipment)
   10. **IT Asset Management** (`Management`, **5 รูป**, `photos/Projects/it-asset-management/`, ต้นทาง `my project/asset it/` มีไฟล์ 1,2,3,4,7 [ไม่มี 5] + `6.mp4` วิดีโอที่**ไม่ได้ใช้**เพราะ modal รองรับแค่รูป — เรียงเลขใหม่ 1-5) — details 1 หมวด 4 ข้อ (In-House Web App, Inventory & Stock Mgmt, Comprehensive Inventory, Visual Asset Mapping)
   11. **IT Operations & Knowledge Transfer Support — Dohome BW Branch** (`Support`, **13 รูป** มีไฟล์พิเศษ `IMG_4814_preview.jpeg`, `photos/Projects/tranning-bw/`) — details 1 หมวด 4 ข้อ (Temporary Ops, Training & Knowledge Transfer, IT Asset Audit, Standard Compliance Check)
   12. **Newstore IT System Setup — Dohome Buriram** (`Infrastructure`, 12 รูป, `photos/Projects/setup-br/`) — details เต็ม 5 หมวดเหมือนข้อ 1
   - **ทุกโปรเจกต์มี `details` breakdown ครบแล้ว** (ไม่มีโปรเจกต์ไหนเหลือแค่ short-desc เปล่าอีกต่อไป)
   - **ถอด category filter tabs ออกทั้งหมดแล้ว (2026-07-27)** — ผู้ใช้บอก "ไม่ต้องจัดหมวดหมู่" เอา `#projects-tabs` และ category badge (การ์ด + modal) ออกหมด (field `category` ยังเก็บใน DB แต่ไม่ render) — เปลี่ยนเป็น **pagination**: **6 โปรเจกต์ต่อหน้า** (`PROJECTS_PER_PAGE = 6`, ตอนนี้มี 2 หน้า) พร้อมปุ่มเลขหน้า (`#projects-pagination`) — โค้ด: `renderProjectGrid()`, `renderProjectPagination()`, ตัวแปร `projectsPage`
     - หน้าสุดท้ายที่มีไม่ครบ 6 การ์ดจะเติม placeholder `invisible` ให้ครบ 6 slot เสมอ (กัน grid ยุบแถวแล้ว footer เด้งขึ้นตอนสลับหน้า — เหมือน pattern เดียวกับ Skills carousel)
   - **ดีไซน์การ์ด overview ล่าสุด**: รูปปก (`images[0]`) สูง **`h-64`** (ขยายจาก `h-48` เดิม), การ์ดเตี้ยลง (`p-5` แทน `p-6`), **Featured badge อยู่มุมซ้ายล่าง กับปุ่ม "More →" อยู่มุมขวาล่าง คนละฝั่งในแถวเดียวกัน** (เดิม stack กันแนวตั้ง)
   - **Modal รายละเอียด** (`#project-modal`): กว้าง `max-w-[1440px]`, ลำดับเนื้อหา badge Featured → title → desc สั้น → `details` breakdown เต็ม (แถวเดียวเต็มความกว้าง) → รูปภาพ grid responsive 2/3/4 คอลัมน์ — ไม่มี tags pill, ไม่มี hero+thumbnail strip แบบเก่า, คลิกรูปเปิด lightbox
   - **แก้บั๊ก scroll ทะลุพื้นหลัง**: `lockPageScroll(lock)` แบบ reference-counted toggle `overflow-hidden` ทั้ง `<html>`+`<body>`
   - **แก้บั๊กมือถือ: กดปุ่ม back แล้วเด้งออกจากหน้าเว็บทั้งหน้า (2026-07-28)** — เดิมเปิด modal/lightbox ไม่ได้ push history เลย กด back ครั้งเดียวออกจากเว็บไปเลย ตอนนี้ `openProjectModal()`/`openLightbox()` เรียก `pushOverlayState()` (history.pushState) ทุกครั้งที่เปิด, มี `popstate` listener ปิด overlay ที่เปิดอยู่บนสุดก่อน (lightbox ก่อน แล้วค่อย modal) — ปุ่ม close/Escape ก็เรียก `history.back()` แทนการซ่อน element ตรงๆ เพื่อให้ step การกด back ตรงกันเสมอ (`hideProjectModal()`/`hideLightbox()` คือ logic ซ่อนจริงที่แยกออกมาให้ popstate handler เรียก)
   - โฟลเดอร์ต้นทางทั้งหมดอยู่ใต้ `D:\Project_port\my project\` (ดูหัวข้อโครงสร้างไฟล์ด้านบน) — เป็น scratch source ไม่ push ขึ้น repo
   - **Data model**: คอลัมน์ **`details` (jsonb)** ในตาราง `projects` — array ของ `{title, items}` — render ด้วย logic ใน `openProjectModal()` (แถวเดียวเต็มความกว้าง ไม่แบ่ง 2 คอลัมน์แบบ Journey)
7. **About Me (`#about`)** — **ปรับใหญ่หลายรอบล่าสุด 2026-07-28** ไม่มี intro paragraph เหลือแค่รูป + Personal Details
   - **Layout**: CSS `grid-template-areas` (`.about-grid`)
     - Mobile (<768px): รูปอยู่บน (คุมขนาดด้วย `max-width: 24rem`, `justify-self: center` — ไม่ full-bleed เต็มจอแล้ว) → Personal Details อยู่ล่าง
     - md+ (≥768px): **แบ่งคอลัมน์เท่ากัน 1fr 1fr เต็มความกว้าง container** (ไม่มี max-width ครอบ .about-grid แล้ว) เพื่อให้เส้นแบ่งกลางคอลัมน์ตรงกับกึ่งกลางจอจริง — รูป `justify-self: end` (ชิดเส้นกลาง, cap ที่ `max-width: 26rem` กันใหญ่เกิน), Personal Details `justify-self: start` (เริ่มขวาเส้นกลางพอดี) — `align-items: start` (เริ่มตรงกันที่ขอบบน ไม่ center แนวตั้งแล้ว)
     - **ประวัติการปรับ**: เคยลอง 2fr:3fr แล้ว align-items:center (รูปแคบกว่า, จัดกึ่งกลางแนวตั้ง) → ผู้ใช้บอกไม่สมดุล → ขยายรูปใหญ่ขึ้น (photo column 320-420px) → ผู้ใช้วาดเส้นกลางจอขอให้รูปชิดเส้นกลางและ Personal Details ทั้งหมดอยู่ฝั่งขวาเส้น → เปลี่ยนเป็น 1fr:1fr เต็มความกว้างแบบปัจจุบัน → ผู้ใช้ขอให้ Personal Details เริ่มตรงเส้น (แก้ align-items เป็น start)
   - **หัวข้อ "Personal Details" ขยายใหญ่ขึ้นแล้ว**: `text-2xl` (เดิม `text-base`)
   - **Personal Details เรียงลำดับปัจจุบัน** (grid 2 คอลัมน์ภายใน, ส่วนใหญ่ `col-span-2` เต็มแถว มีแค่บางคู่ที่จับคู่กันในแถวเดียว):
     1. Full Name (เต็มแถว)
     2. Age (เต็มแถว)
     3. Date of Birth (เต็มแถว, อยู่ใต้ Age ทันที)
     4. Phone Number (เต็มแถว)
     5. Address (เต็มแถว)
     6. Nationality (เต็มแถว)
     7. Availability (เต็มแถว, อยู่ใต้ Nationality ทันที)
     8. Line ID (เต็มแถว, มีไอคอน `photos/icons/line.png`)
     9. Email (เต็มแถว, มีไอคอน `photos/icons/gmail.png`)
     - **ประวัติการจัดคู่**: เคยลอง Age+Date of Birth คู่กันในแถวเดียว และ Nationality+Availability คู่กันอีกแถว (2 คอลัมน์) แล้วก็เคยลอง Date of Birth+Availability จับคู่กันเองแยกออกมาต่างหาก ก่อนจะกลับมาเป็นรูปแบบ **เต็มแถวทั้งหมด ไม่มีการจับคู่แล้ว** ตามคำขอล่าสุด — **ถ้าจะจับคู่ field ไหนอีก ให้ถามลำดับ/คู่ที่ต้องการให้ชัดก่อน เพราะเคยเปลี่ยนไปมาหลายรอบ**
   - **ข้อมูลจริงปัจจุบัน**: Full Name Pattarapong Tensuna, Age 31 years old, Date of Birth March 23 1998, Phone 062-197-1764, Address 112 Moo 3, Nong Kaeo, Mueang Sisaket, Sisaket 33000, Thailand, Nationality Thai, Availability Full-time & Contract, **Line ID: `Tong4012`** (เปลี่ยนจาก `pattarapong.it` เดิม 2026-07-28), Email pattarapong123@gmail.com
   - ไม่มีการ์ด/กรอบสี่เหลี่ยมรอบแต่ละ item, ไม่มี category badge
8. **Footer** — ลิงก์ด่วน (Skills / Projects / About), social, ปีลิขสิทธิ์อัตโนมัติ

## Image Lightbox (ใช้เฉพาะ Projects modal — Career Gallery ไม่ใช้)
- คลิกรูปใน Projects modal image grid → เปิด full-screen lightbox (`#image-lightbox`, z-[70])
- ไม่มีฟีเจอร์ซูม/ลาก (ถอดออกตามคำขอผู้ใช้ในอดีต — อย่าเพิ่มกลับมาโดยไม่ถาม)
- เลื่อนดูรูปถัดไป/ก่อนหน้า: คลิกฝั่งซ้าย/ขวาของรูป, ปุ่มลูกศร prev/next, swipe บนมือถือ, คีย์บอร์ด ← / →, Escape ปิด (ถ้า lightbox เปิดอยู่ Escape จะปิดแค่ lightbox ก่อน ไม่ปิด modal ด้วย — ดูหัวข้อ back-button fix ใน Projects)
- ใช้ตัวแปร global `lightboxProject`/`lightboxIndex` และฟังก์ชัน `openLightbox(project, index)` / `closeLightbox()` (เรียก `history.back()`) / `hideLightbox()` (logic ซ่อนจริง)
- ใช้ `lockPageScroll(true/false)` ร่วมกับ project modal

## หน้าเว็บโหลดครั้งแรก
- บังคับ scroll ไปบนสุด (`window.scrollTo(0,0)` + `history.scrollRestoration = 'manual'`) ทุกครั้งที่โหลดหน้าใหม่
- `<html>` และ `<body>` มี `overflow-x: hidden` + `max-width: 100vw` ทั้งคู่

## Design System หลัก
- **Blue accent** (`accent-50`–`accent-900`): โลโก้ navbar, nav-link hover, ปุ่ม Download CV border, hero photo glow, timeline node, date badge
- **Orange**: หัวข้อ section, eyebrow label, ปุ่ม Hero "My Projects", typing effect, "More/Less" indicator, hover border ของการ์ด Projects, active dot ใน Skills carousel, active page number ใน Projects pagination
- **Green (emerald)**: badge "Available for Work", badge ระดับความชำนาญใน Skills ทุกระดับ
- **Font**: Inter (เนื้อหาทั่วไป), JetBrains Mono (โค้ด/แท็ก/ตัวเลข)
- **Dark/Light mode**: Tailwind `darkMode: 'class'`, persist ผ่าน localStorage
- **Animation**: scroll-reveal, typing effect, glow pulse, Career Gallery auto-scroll+drag+momentum, tab fade, grid-rows expand/collapse (Journey), modal fade-in, Skills carousel bounce-pop (`skillPop` keyframes)

## Supabase Integration (เชื่อมต่อจริงแล้ว)
- Project: `pattarapong123-lang's Project` (ref `aftnbucohvfmhmxvsmjh`, region ap-northeast-1)
- `SUPABASE_URL` / `SUPABASE_ANON_KEY` ใน `index.html` เป็นค่าจริง
- **สำคัญ: client สร้างด้วย `global.fetch` override ที่บังคับ `cache: 'no-store'`** — แก้ปัญหา browser cache response เก่าของ Supabase REST — **อย่าลบ option นี้ออก**
- ตาราง (ทั้งหมดเปิด RLS พร้อม policy "public can read"):
  - `education` — id, sort_order, date, title, subtitle, org, description, created_at (3 แถว, ข้อมูลจริง)
  - `experience` — เหมือน education + `responsibilities` (jsonb, flat หรือ grouped), `logo` (4 แถว, ข้อมูลจริง)
  - `projects` — id, sort_order, title, category, featured, icon, description, tags (jsonb, ไม่ได้ใช้แสดงผลแล้วแต่ยังเก็บไว้), `details` (jsonb, grouped breakdown — **ทุกแถวมีข้อมูลครบแล้ว ไม่มีแถวไหนว่างเปล่า**), images (jsonb) — **12 แถวข้อมูลจริงทั้งหมด**, sort_order 0–11 เรียงตามลำดับที่ผู้ใช้กำหนด (ดูรายการเต็มในหัวข้อ Projects ด้านบน)
  - `skills` — id, sort_order, category, icon (ไม่ใช้แล้ว), items (jsonb) — ข้อมูลจริง 6 แถว/60 items, sort_order 1-6 = Server & Monitoring / Hardware / OS & Software / CCTV / Management / Network
- โค้ด `loadTable()` ดึงข้อมูลเรียงตาม `sort_order`, map `description` → `desc`, fallback ไปใช้ `MOCK_DATA` ถ้า fetch ล้มเหลว (**MOCK_DATA.projects ใน index.html sync ตรงกับ DB ทุกแถวแล้ว รวมลำดับด้วย**)
- ฟังก์ชัน render responsibilities: `renderResponsibilitiesBlock(item)` / `renderResponsibilityList(items)` (ใช้กับ Journey); Projects modal details ใช้ logic แยกของตัวเองใน `openProjectModal()`

## ฟีเจอร์ที่เคยขอแล้ว "ยกเลิก/rollback" — สำคัญ อย่าทำใหม่โดยไม่ถาม
- **ปุ่ม Sign in + แก้ไขเนื้อหาผ่านหน้าเว็บ + auto-push**: ยกเลิกหลังอธิบายความเสี่ยง (static site ไม่มี server)
- **Zoom/pan บนรูปใน Image Lightbox**: เคยทำแล้วถอดออก เหลือคลิกซ้าย-ขวา/swipe เท่านั้น
- **Lightbox บน Career Transition Gallery**: เคยมีแล้วถอดออก แทนที่ด้วย drag-to-pan
- **Skills แบ่งเป็น 14 หมวดย่อย**: rollback กลับ 5+1 หมวดเดิม
- **Badge ระดับความชำนาญแยกสีตามระดับ**: เปลี่ยนเป็นเขียวทั้งหมดแทนแล้ว ห้ามแยกสีอีก
- **Skills mobile: circular "orbit" wheel UI**: ทำเสร็จสมบูรณ์แล้วแต่ผู้ใช้บอก "ไม่สวย" ขอ rollback เต็มรูปแบบทันที — ใช้ carousel auto-advance 4×2=8 แทน
- **Projects modal: tags pill แถว, hero image + thumbnail strip gallery**: ถอดออกแล้ว เปลี่ยนเป็น details breakdown + image grid แทน
- **Projects: category filter tabs**: ถอดออกแล้ว เปลี่ยนเป็น pagination (6 ต่อหน้า) แทน
- **About Me: Age+Date of Birth / Nationality+Availability จับคู่กันในแถวเดียว**: เคยทำแล้วเปลี่ยนใจ ตอนนี้ทุก field เต็มแถวเดี่ยวหมด (ดูหัวข้อ About Me)

## สิ่งที่ยังเป็น Placeholder / ควรแก้ก่อน publish จริง
- Social links (GitHub, LinkedIn) ยังเป็น URL ตัวอย่าง
- **Projects, Education, Experience, Skills, About Me Personal Details เป็นข้อมูลจริงครบทั้งหมดแล้ว** — เหลือแค่ Social links ที่ยังเป็น placeholder
- Skills บางรายการยังไม่มีไอคอนจริง (แสดงเป็น text-monogram แทน) — รอผู้ใช้ส่งไฟล์ไอคอนเพิ่ม
- Skills บางรายการที่ผู้ใช้ไม่ได้ระบุระดับความชำนาญมา ผมเดาให้แบบสมเหตุสมผลจาก context งานจริง (Face Access, Scanner, Rack Server, Monitor, IT Asset Management, Stock Card, Device Equipment, Expired Asset) — **ผู้ใช้ยังไม่ได้ confirm ตัวเลขพวกนี้ 100%** ถ้าคุยเรื่อง Skills ต่อควรถามยืนยันอีกที
- Projects อาจมีเพิ่มอีกในอนาคต — ทำตาม pattern เดิม: คัดลอกรูปไป `photos/Projects/<slug>/`, insert แถวใหม่ใน Supabase `projects` (sort_order ต้องถามผู้ใช้ว่าจะแทรกตรงไหน), sync `MOCK_DATA.projects` ให้ตรงกันทั้งเนื้อหาและลำดับ, ถามว่าต้องการ `desc` สั้นอย่างเดียวหรือ `details` breakdown เต็ม

## วิธีใช้ต่อในแชทใหม่
เปิดไฟล์นี้แนบไปพร้อมกับไฟล์ `D:\Project_port\index.html` (หรือบอกพาธ) แล้วอธิบายว่าต้องการแก้ไข/เพิ่มอะไรต่อ ระบบจะเข้าใจ context ของโปรเจกต์ทั้งหมดจากไฟล์นี้

**อัปเดตล่าสุด (2026-07-28)**: เปลี่ยนชื่อ GitHub repo เป็น `portfolio` (URL สั้นลง), เพิ่ม Projects จริงอีก 5 รายการจนครบ 12 โปรเจกต์ (Monitoring Center, IT Asset Management, IT Hardware Repair, Access Point Replacement, On-Premises Server Installation & Virtualization) พร้อม `details` breakdown ครบทุกโปรเจกต์แล้ว, เรียงลำดับ Projects ใหม่ตามที่ผู้ใช้กำหนดเอง, ปรับการ์ด Projects overview (รูปปกใหญ่ขึ้น, Featured/More อยู่แถวเดียวกันคนละมุม), แก้บั๊กปุ่ม back บนมือถือให้ปิด modal/lightbox ทีละชั้นแทนที่จะออกจากเว็บทั้งหน้า, ปรับ About Me ใหญ่หลายรอบ (สลับตำแหน่งรูป/Personal Details, จัดกึ่งกลางจอจริงโดยแบ่ง 1fr:1fr เต็มความกว้าง, Personal Details ทุก field เต็มแถวเดี่ยว, ขยายหัวข้อ "Personal Details", เปลี่ยน Line ID เป็น Tong4012), อัปเดตไฟล์ CV ใหม่
