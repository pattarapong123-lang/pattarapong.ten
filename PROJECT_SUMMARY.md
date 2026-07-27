# Project Summary — Pattarapong Tensuna Portfolio Website

## ภาพรวมโปรเจกต์
เว็บไซต์พอร์ตโฟลิโอแบบไฟล์เดียว (`index.html`) สำหรับ Pattarapong Tensuna ตำแหน่ง IT Support / IT Officer / Helpdesk / IT Administrator
- **Tech stack**: HTML + Tailwind CSS (CDN) + Vanilla JavaScript + Supabase JS client (CDN) — เชื่อมต่อ Supabase จริงแล้ว (ดูหัวข้อ "Supabase Integration" ด้านล่าง)
- **Hosting**: GitHub Pages (static) — โค้ด `index.html` + asset ทั้งหมดอยู่ใน repo เดียวกับที่ push อัตโนมัติผ่าน git — URL จริง: `https://pattarapong123-lang.github.io/pattarapong.ten/`
- **GitHub repo**: https://github.com/pattarapong123-lang/pattarapong.ten (branch `main`)
- **โครงสร้างไฟล์**:
  - `D:\Project_port\index.html` — เว็บไซต์ทั้งหมด (section เดียว ไม่มีหน้า Contact แยก)
  - `D:\Project_port\assets\Pattarapong_Tensuna_CV.pdf.pdf` — ไฟล์ CV จริงของผู้ใช้ (ปุ่ม Download CV ลิงก์ไปที่นี่)
  - `D:\Project_port\photos\p1.png` — รูปโปรไฟล์ hero section (วงกลม)
  - `D:\Project_port\photos\a1.jpg` — รูปโปรไฟล์เต็มตัวที่ใช้ใน About Me section
  - `D:\Project_port\photos\Gallery\s1.jpg` – `s15.png` — รูปภาพสภาพแวดล้อมงาน/โครงสร้างพื้นฐานจริง **15 รูป** ใช้ใน Career Transition Gallery เท่านั้นแล้ว (Projects modal เลิกใช้รูปชุดนี้เป็น placeholder แล้ว เพราะ Projects เปลี่ยนไปใช้รูปจริงของตัวเองทั้งหมด — ดูหัวข้อ Projects ด้านล่าง) — **นามสกุลไฟล์ไม่เท่ากันทุกไฟล์**: ส่วนใหญ่เป็น `.jpg`, แต่ `s5` = `.png`, `s7` = `.jpeg`, `s12`/`s15` = `.png` — **ต้องเช็ค path จริงในโค้ดก่อนแก้ อย่าเดานามสกุล**
  - `D:\Project_port\photos\Logos\dohome.png`, `foryouall.png`, `fountaintree.png` — โลโก้บริษัท/สถานที่ทำงานจริง แสดงเป็นวงกลมมุมขวาบนของการ์ดใน Work Experience timeline
  - `D:\Project_port\photos\icons\*.png` (+ ไม่กี่ไฟล์เป็น `.jpg`) — ไอคอนทักษะจริง ~50 ไฟล์ ใช้ใน Skills section (ไอคอนต่อ item ไม่ใช่ต่อหมวดหมู่) + `line.png`, `gmail.png` ใช้ใน About Me → Personal Details (Line ID/Email)
  - `D:\Project_port\photos\Projects\setup-cb\1.jpg`–`12.png` — รูปจริง 12 รูป โปรเจกต์ Dohome **Amata Nakorn** (เคยมีชุดเก่า 13 รูปชื่อ `1a/1b/2a/2b...` ถูกแทนที่ทั้งหมดแล้ว)
  - `D:\Project_port\photos\Projects\setup-sr\1.jpg`–`12.jpg` (มี `8.png`) — รูปจริง 12 รูป โปรเจกต์ Dohome **Surat Thani**
  - `D:\Project_port\photos\Projects\setup-br\1.jpg`–`12.jpeg` — รูปจริง 12 รูป โปรเจกต์ Dohome **Buriram** (มีไฟล์ผสม `.jpg`/`.jpeg`)
  - `D:\Project_port\My project\Setup CB\`, `Setup SR\`, `Setup BR\` — โฟลเดอร์ต้นทางที่ผู้ใช้วางรูป+ไฟล์ .txt รายละเอียดโปรเจกต์ไว้ให้ก่อนอัปโหลด (อยู่นอก `photos/`, ไม่ได้ push ขึ้น repo — เป็น scratch source เท่านั้น, ไฟล์จริงที่ใช้บนเว็บอยู่ใน `photos/Projects/setup-*/`)

## ลำดับ Section บนหน้าเว็บ (บนลงล่าง)
1. **Navigation** — fixed navbar, smooth scroll, dark/light toggle (persist ผ่าน localStorage), hamburger menu บนมือถือ. เมนู Journey / Skills / Projects / About และปุ่ม theme toggle จัดกลุ่มชิดขวาสุดของ navbar
   - **บั๊กที่เจอและแก้แล้ว (2026-07-26)**: บนมือถือบางรุ่นจริง (ยืนยันจากภาพหน้าจอผู้ใช้) หน้าเว็บทั้งหน้าถูกบีบไปแสดงในคอลัมน์แคบทางซ้าย เหลือพื้นที่ว่างเปล่าด้านขวา ทำให้ปุ่ม hamburger ดูเหมือนอยู่ผิดตำแหน่ง — สาเหตุคือแถบรูป Career Gallery (`.marquee-track`) กว้างมาก (ใช้ `transform: translateX()` + `w-max`) และการซ่อน overflow แนวนอนทำไว้แค่ระดับ `<html>` เพียงจุดเดียว ทำให้เบราว์เซอร์บางตัวคำนวณความกว้างหน้าเว็บผิด แก้โดยเพิ่ม `overflow-x: hidden` และ `max-width: 100vw` ให้ `<body>` ด้วย (นอกจาก `<html>`) — **ถ้าจะปรับ marquee/gallery อีก ต้องระวังไม่ให้ overflow ของทั้งหน้าเว็บหลุดอีก**
   - เพิ่ม `#navbar { transform: translateZ(0); }` เพื่อป้องกันบั๊ก fixed-header ไม่ยอม paint บน mobile browser บางตัว (พบระหว่างดีบัก แก้เผื่อไว้ด้วย)
2. **Hero (`#home`)** — 2 คอลัมน์: ซ้ายเป็นชื่อตัวพิมพ์ใหญ่, "Hi, my name is" + typing effect หมุนตำแหน่งงาน (สีส้ม), badge "Available for Work" (สีเขียว emerald), ปุ่ม "My Projects" (สีส้ม, ลิงก์ `#projects`) + Download CV, social links (GitHub/LinkedIn/Email — ยังเป็น placeholder URL); ขวาเป็นรูปโปรไฟล์วงกลมพร้อม glow animation แบบ breathing สีฟ้า (blue)
3. **Career Transition Gallery (`#gallery`)** — **ไม่มี lightbox แล้ว** (ถอดออกตามคำขอผู้ใช้) รูปทั้งหมด **15 รูป** จาก `photos/Gallery/`:
   - **Auto-scroll + drag-to-pan + momentum/inertia**: marquee เลื่อนอัตโนมัติตลอด, หยุดเมื่อ hover, **ลากด้วยเมาส์/นิ้วเพื่อเลื่อนซ้าย-ขวาเองได้ และถ้าลาก "สะบัด" เร็วๆ แล้วปล่อย รูปจะไหลต่อเองแล้วค่อยๆ ช้าลง (momentum) ก่อนกลับเข้าสู่ auto-scroll ปกติ** — ใช้ pointer events คำนวณ velocity ระหว่างลาก แล้ว decay ด้วย friction หลังปล่อยมือ (ฟังก์ชัน `initMarquee()` ใน `<script>`)
   - **สำคัญทางเทคนิค**: marquee ขับเคลื่อนด้วย `transform: translateX()` ผ่าน JS (ไม่ใช้ native `scrollLeft`/`overflow-x` บน wrapper) เพราะถ้า wrapper เป็น scroll container จะ clip เอฟเฟกต์ hover-scale (การ์ดขยาย 1.5x ตอน hover) ทั้งแนวตั้งด้วย ไม่ใช่แค่แนวนอน — การซ่อน horizontal overflow ของทั้งหน้าเว็บทำที่ **`html` และ `body` ทั้งคู่** (`overflow-x: hidden` + `max-width: 100vw`) — **ถ้าจะแก้ marquee นี้ในอนาคต ห้ามใส่ `overflow-x: auto`/`hidden` กลับเข้าไปที่ `.marquee-wrapper` หรือ `#gallery` section เด็ดขาด เดี๋ยว hover-scale จะพังอีก**
4. **My Journey (`#journey`)** — timeline แบบ tab สลับ Education/Work Experience, default tab = Work Experience:
   - **ข้อมูลเป็นของจริงทั้งหมดแล้ว ทั้ง Education และ Work Experience**
   - Timeline node (วงกลมไอคอนกลาง) สีฟ้า (accent-600/500), ไอคอนขนาด `w-4 h-4`
   - **การ์ด Work Experience กดขยายดูรายละเอียดได้ ("More/Less")** — เมื่อขยาย การ์ดจะ**กว้างเต็มแถว (span ทั้ง 2 คอลัมน์ของ layout ซ้าย-ขวา)** และ list "Key Responsibilities" จัดเป็น 2 คอลัมน์บนจอกว้าง (`sm:columns-2`)
   - **แต่ละการ์ด Work Experience มีโลโก้บริษัทเป็นวงกลมมุมขวาบน** ดึงจาก `photos/Logos/*.png`
   - "Key Responsibilities" รองรับ 2 รูปแบบข้อมูล: list เดียว (flat array) หรือแบ่งเป็นหมวดหมู่ (`[{title, items}]`) — ฟังก์ชัน `renderResponsibilitiesBlock(item)` / `renderResponsibilityList(items)`

### ข้อมูล Work Experience จริง (เรียงจากล่าสุด)
   1. **06/2023 — Present**: IT Support @ Dohome public company limited (Bangna Branch | Bangprakong | Chachoengsao) — 11 responsibilities (flat list)
   2. **06/2021 — 06/2023**: IT Officer Setup @ Dohome public company limited (Headquarter | Bangkok) — 2 กลุ่ม: "Project Deployment" (5 ข้อ, พูดถึงการเปิดสาขาใหม่ Amata Chonburi/Surat Thani/Buriram — ตรงกับ 3 โปรเจกต์จริงที่เพิ่งเพิ่มใน Projects section) และ "Infrastructure Renovation & Support" (5 ข้อ)
   3. **06/2019 — 06/2021**: IT Service Onsite @ FOR YOU ALL CO., LTD. (Bo Thong | Chonburi)
   4. **11/2018 — 03/2019**: IT Support Trainee @ Fountaintree Resort (Pakchong | Nakhon Ratchasima)
   - รูปแบบวันที่: ตัวเลข `MM/YYYY` ทั้งหมด

### ข้อมูล Education จริง (เรียงจากล่าสุด)
   1. **2015 — 2019**: Bachelor's Degree, Business Computer @ Sisaket Rajabhat University — GPA 2.25
   2. **2010 — 2013**: High School, Arts-Mathematics Program @ Satreesiriket School — GPA 2.60
   3. **2007 — 2009**: Middle School, General Education @ Kraipakdee Wittayakom School — GPA 3.30

5. **Skills (`#skills`)** — ข้อมูลจริง, **6 หมวด / 60 ทักษะ** — **ดีไซน์เปลี่ยนใหญ่ 2026-07-26**:
   - **ลำดับหมวดปัจจุบัน**: Server & Monitoring, Hardware, OS & Software, CCTV, Management, **Network** (ย้าย Network จากหมวดแรกไปไว้ท้ายสุดติดกับ Management ตามคำขอผู้ใช้ เพื่อให้แท็บมือถือ wrap น้อยแถวลง)
   - **ชื่อหมวดถูกย่อสั้นลง**: `Networking` → **`Network`**, `Server & Monitoring Center` → **`Server & Monitoring`** (ระวังสับสน "Monitor" ในหมวด Hardware ก็เป็นชื่อ skill แยกต่างหาก ไม่เกี่ยวกัน — เคยพิจารณาใช้ "Monitor & Server" แล้วตัดสินใจไม่ใช้เพราะจะชนกับชื่อ skill นี้)
   - **มือถือ/iPad (<1024px, breakpoint `lg`)**: **carousel แถวเดียว auto-advance ทุก 3 วิ** แสดง **4 ไอคอน × 2 แถว = 8 ไอคอนต่อหน้า** พร้อม bounce-in pop animation, จุด pagination กดข้ามหน้าได้, swipe ซ้าย-ขวาเปลี่ยนหน้าเองได้ (auto-timer restart หลัง interact) — โค้ดหลัก: `renderSkillCarousel()`, `startCarouselTimer()/stopCarouselTimer()/restartCarouselTimer()`, ค่าคงที่ `CAROUSEL_PER_PAGE = 8`, `CAROUSEL_INTERVAL = 3000`
     - **สำคัญ**: ถ้าหน้าสุดท้ายของหมวดมีไม่ครบ 8 ไอคอน (เช่น Management มี 4) ระบบจะเติม placeholder การ์ดที่มองไม่เห็น (`invisible`, โครงเหมือนการ์ดจริงแต่ไม่มีเนื้อหา) ให้ครบ 2 แถวเสมอ — ทำแบบนี้เพราะถ้าใช้ `<div>` ว่างเปล่าธรรมดา แถวที่ 2 จะยุบเป็น 0 (grid row สูงตาม content จริง ไม่ใช่แค่มี element) ทำให้เนื้อหาด้านล่าง Skills section เด้งขึ้นเด้งลงตอนสลับหน้า — **ห้ามเปลี่ยนกลับไปใช้ placeholder แบบ empty div เด็ดขาด**
   - **Desktop (≥1024px)**: grid ปกติแสดงทุกรายการพร้อมกัน (`#skills-grid`, `lg:grid lg:grid-cols-6`) ไม่มี carousel
   - **ดีไซน์การ์ด**: ไม่มีกรอบ/กล่อง, วงกลมไอคอน + ชื่อ + badge ระดับสีเขียว (emerald) ทั้งหมดทุกระดับ
   - **ไอคอนอยู่ระดับ item**: มี `icon` (path จริง) หรือ `short` (ตัวย่อ text-monogram fallback) — `buildSkillCard(skill)` (desktop) และ `buildSkillMiniCard(skill)` (carousel มือถือ) ต่างมี logic fallback แบบเดียวกัน
   - **ประวัติสำคัญที่ต้องรู้ก่อนแก้ Skills อีก** (rollback เกิดขึ้นแล้ว 2 ครั้ง อย่าทำผิดซ้ำ):
     1. เคยลองจัดใหม่เป็น 14 หมวดย่อยบน desktop → rollback กลับ 5+1 หมวด
     2. เคยลองทำ **circular "orbit" wheel UI** (วงแหวนไอคอนหมุนลากได้) สำหรับมือถือแทน pagination เดิม ทำเสร็จสมบูรณ์แล้ว (drag-to-rotate, focus item ขยาย, prev/next) แต่ผู้ใช้ดูแล้วบอก **"ไม่สวย"** ขอ rollback เต็มรูปแบบทันที (revert โค้ดทั้งหมด) — **ห้ามเสนอ orbit UI อีกโดยไม่ถามก่อน หรือถ้าจะทำต้องเปลี่ยนแนวการออกแบบให้ต่างจากเดิมมากๆ**
     3. หลัง rollback orbit แล้วผู้ใช้เสนอไอเดียใหม่เอง = carousel auto-advance ที่ใช้อยู่ปัจจุบัน — ปรับจำนวนไอคอนต่อหน้าไปมา 3 รอบ (4→6→8 ในรูปแบบ 4×2) ก่อนจะลงตัวที่ 4×2=8 ตามที่อธิบายด้านบน — **นี่คือดีไซน์สุดท้าย**อย่าเปลี่ยนกลับไปแบบอื่นโดยไม่ถาม
6. **Projects (`#projects`)** — **เปลี่ยนจาก mock data ทั้งหมดเป็นข้อมูลจริงแล้ว, ตอนนี้มี 7 โปรเจกต์รวม (2026-07-27)** — ถอด mock 6 รายการเดิมออกหมด (Office-wide Hardware Rollout, Helpdesk Ticketing Optimization, Wi-Fi Infrastructure Upgrade, Active Directory Cleanup, Backup & DR Plan, Remote Support Toolkit) ทั้งจาก Supabase และ `MOCK_DATA`
   - **ถอด category filter tabs ออกทั้งหมดแล้ว (2026-07-27)** — ผู้ใช้บอก "ไม่ต้องจัดหมวดหมู่" เอา `#projects-tabs` (ปุ่ม All/Support/Infrastructure/Maintenance) ออก, เอา category badge บนการ์ด overview และใน modal ออกด้วย (field `category` ในข้อมูลยังเก็บไว้ใน DB แต่ไม่ได้ render แล้ว) — เปลี่ยนเป็น **pagination แทน**: แสดง **6 โปรเจกต์ต่อหน้า** (`PROJECTS_PER_PAGE = 6`) พร้อมปุ่มเลขหน้า (`#projects-pagination`) ด้านล่าง grid — โค้ดหลัก: `renderProjectGrid()`, `renderProjectPagination()`, ตัวแปร `projectsPage`
   - **โปรเจกต์ Setup ใหญ่ 3 รายการ (details breakdown เต็ม 5 หมวด)**: Dohome **Buriram** → Dohome **Surat Thani** → Dohome **Amata Nakorn** — ทั้งหมดเป็น "Setup Newstore IT System" (Greenfield branch build-out) เนื้อหาเหมือนกันทุกตัวอักษร ต่างแค่ชื่อสาขา + รูปภาพ, หมวด `Infrastructure`, ติด `Featured` ทั้ง 3
   - **โปรเจกต์ใหม่เพิ่ม 4 รายการ (2026-07-27)** เรียงอยู่**บนสุด** (สั่ง sort_order ก่อนแล้ว แต่**ลำดับที่แน่นอนในกลุ่ม 4 นี้ยังไม่ final — ผู้ใช้บอก "add them first, sort later" จะขอจัดลำดับใหม่ทีหลัง**):
     1. **Preventive Maintenance & Hardware Upgrade — Dohome Bangna (100 PCs)** — desc สั้นอย่างเดียว ไม่มี `details`, หมวด `Maintenance`, icon 🖥️, รูปจาก `photos/Projects/pm-computer-bn/` (12 รูป)
     2. **Network Preventive Maintenance — 6 Dohome Branches** (ขอนแก่น/อุดรธานี/รังสิต/บางบัวทอง/บางนา/เพชรเกษม) — หมวด `Maintenance`, icon 🌐, รูปจาก `photos/Projects/pm-network/` (12 รูป) — **อัปเดต 2026-07-27: เพิ่ม `details` breakdown เต็มแล้ว** (1 กลุ่ม "Network Maintenance & Optimization" 4 ข้อ: Network Inspection & Maintenance, Switch Aggregation (L2), High Availability Switching (L3), Server Network Backup) แปลจากข้อความไทยที่ผู้ใช้ส่งมา
     3. **IT System Restoration & Renovation — Dohome Ubon Ratchathani** — งานฟื้นฟูหลังน้ำท่วม (IT Disaster Recovery), หมวด `Infrastructure`, icon 🛠️, รูปจาก `photos/Projects/renovate-ub/` (12 รูป) — ไม่มีไฟล์ .txt ต้นทาง ผู้ใช้พิมพ์รายละเอียดในแชทแทน — **อัปเดต 2026-07-27: เพิ่ม `details` breakdown เต็มแล้ว** (1 กลุ่ม "Restoration Operations" 5 ข้อ: Damage Assessment & Triage, Temporary Office Setup, Network Redesign & Wiring, Hardware Replacement & Installation, Network Standardization & QC) แปลจากข้อความไทยที่ผู้ใช้ส่งมา
     4. **IT Operations & Knowledge Transfer Support — Dohome BW Branch** — คุมสาขาชั่วคราวช่วงเปลี่ยนผ่าน มี.ค.–มิ.ย. 2565 + สอนงาน IT คนใหม่, หมวด `Support`, icon 🎓, รูปจาก `photos/Projects/tranning-bw/` (**13 รูป** — มีไฟล์พิเศษ `IMG_4814_preview.jpeg` เพิ่มจาก 12 ไฟล์เลขปกติ) — **อัปเดต 2026-07-27: เพิ่ม `details` breakdown เต็มแล้ว** (1 กลุ่ม "Operations & Handover" 4 ข้อ: Temporary Branch Operations, Training & Knowledge Transfer, IT Asset Audit (Recheck), Standard Compliance Check) แปลจากข้อความไทยที่ผู้ใช้ส่งมา
   - ทั้ง 3 หมวดหมู่ตอนนี้ใช้จริง: `Infrastructure` (4), `Maintenance` (2), `Support` (1) — filter tab บนเว็บนับอัตโนมัติจากข้อมูล
   - โฟลเดอร์ต้นทางของ 4 โปรเจกต์ใหม่อยู่ที่ `D:\Project_port\my project\Pm Computer BN\`, `PM Network\`, `Renovate UB\`, `Tranning BW\` (เหมือน `My project\Setup CB/SR/BR\` เดิม — เป็น scratch source ไม่ push ขึ้น repo)
   - **Data model ใหม่**: เพิ่มคอลัมน์ **`details` (jsonb)** ในตาราง `projects` (มี migration `add_details_to_projects` แล้ว) — โครงสร้างเหมือน `experience.responsibilities`: array ของ `{title, items}` แสดงเป็น breakdown เต็ม 5 หมวด (Network & Infrastructure / Hardware & End-User Devices / Retail & POS Systems / Special Systems & IoT / Management QA & Handover) — render ด้วย logic ใน `openProjectModal()` (ไม่ใช้ `renderResponsibilityList()` ตรงๆ เพราะ modal โปรเจกต์กว้างกว่าการ์ด Journey เลยทำ list **แถวเดียวเต็มความกว้าง** แทนการแบ่ง 2 คอลัมน์)
   - **การ์ด overview** (`renderProjectGrid()`): ตอนนี้ใช้ **รูปแรกใน `images[0]` เป็นรูปปกจริง** (ไม่ใช่ icon emoji อีกต่อไป ถ้ามีรูป) fallback เป็น icon เฉพาะโปรเจกต์ที่ไม่มีรูป — การ์ดเหลือแค่ รูป + badge หมวดหมู่ + badge Featured + title + ปุ่ม **"More →"** (เอา description ออกจากการ์ด overview แล้ว ไปโชว์เต็มใน modal แทน)
   - **Modal รายละเอียด** (`#project-modal`) ปรับใหญ่หลายรอบ ล่าสุดเป็นแบบนี้:
     - กว้าง **`max-w-[1440px]`** (เท่า container หลักของเว็บ, ขยายจาก `max-w-4xl` เดิม)
     - ลำดับเนื้อหา: badge หมวด/Featured → title → desc สั้น (1 บรรทัด ภาพรวมโครงการ) → **`details` breakdown เต็ม (แถวเดียวยาวเต็มความกว้าง ไม่ใช่ 2 คอลัมน์)** → **รูปภาพ grid 2/3/4 คอลัมน์ตามขนาดจอ** (`#project-modal-images`, responsive `grid-cols-2 sm:grid-cols-3 lg:grid-cols-4`)
     - **ไม่มีแถบ tags pill แล้ว** (เคยมี ผู้ใช้ขอเอาออก) — field `tags` ในข้อมูลยังเก็บไว้เผื่ออนาคตแต่ไม่ได้ render
     - **ไม่มี hero image + horizontal thumbnail strip แบบเดิมแล้ว** (ถอดออกตอนเปลี่ยนเป็น image grid) — คลิกรูปไหนใน grid ก็เปิด full-screen lightbox (`openLightbox(project, index)`) เหมือนเดิม เลื่อนดูรูปอื่นต่อได้
     - **แก้บั๊ก scroll ทะลุพื้นหลัง**: เดิม lock scroll แค่ `<body>` ตอนเปิด modal/lightbox แต่ browser จริงมัก scroll ที่ `<html>` ทำให้ scroll wheel ทะลุไปเลื่อนหน้าหลังได้ — แก้ด้วย helper `lockPageScroll(lock)` แบบ reference-counted ที่ toggle `overflow-hidden` ทั้ง `<html>` และ `<body>` พร้อมกัน, นับจำนวนการ lock ซ้อนกันไว้ (กันปัญหาเปิด lightbox ซ้อนบน modal แล้วปิด lightbox ทำให้ scroll หลุดล็อกทั้งที่ modal หลักยังเปิดอยู่)
   - **รูปภาพ**: ทุกโปรเจกต์มีรูปจริงครบ 12 รูป เรียงตามชื่อไฟล์ (1, 2, 3, ... 12) ไม่ใช่เรียงตามเนื้อเรื่องแบบที่เคยลองก่อนหน้า — โฟลเดอร์แยกตามโปรเจกต์ใน `photos/Projects/setup-cb|sr|br/`
7. **About Me (`#about`)** — **ปรับใหญ่หลายรอบ 2026-07-26**:
   - **เอาย่อหน้าแนะนำตัว ("I'm an IT professional...") ออกทั้งหมดแล้ว** — เหลือแค่รูปภาพ + Personal Details เท่านั้น ไม่มี intro text
   - **Layout ใช้ CSS `grid-template-areas`** (คลาส `.about-grid`) แทน Tailwind grid-cols เดิม เพื่อคุมลำดับสลับ mobile/desktop ได้อิสระ:
     - Mobile: `"photo" "details"` (รูปอยู่บน Personal Details อยู่ล่าง)
     - Desktop (`md:` ≥768px): `"details photo"` (Personal Details ซ้าย 3fr, รูปขวา 2fr)
   - **Personal Details ปัจจุบันมี 9 รายการ** เรียงเป็น: Full Name, Age, Date of Birth, Phone Number, Address, Nationality, Availability (ไม่มีไอคอน เป็น plain text ล้วน) → **Line ID, Email อยู่ท้ายสุด มีไอคอนจริง** (`photos/icons/line.png`, `gmail.png` วางบนพื้นหลังวงกลม `bg-slate-100 dark:bg-slate-800` แบบเดียวกับไอคอนอื่นในเว็บ ไม่ใช่วงส้มแบบเดิม)
     - **ประวัติสำคัญ**: เคยเข้าใจผิดคำสั่งไทยสั้นๆ ของผู้ใช้ ("เก็บแค่ไอคอน Fullname Phone line email") ว่าคือ "เก็บแค่ 4 รายการนี้" แล้วลบ 5 รายการที่เหลือทิ้งไปทั้งหมด — ที่จริงผู้ใช้หมายถึง "เก็บไอคอนไว้แค่ 4 อันนี้ ข้อมูลอื่นให้อยู่ครบ" ต้องคืนข้อมูลทั้งหมดกลับมาแล้วแก้ใหม่ — **บทเรียน: คำสั่งไทยสั้นๆ ที่พูดถึง element (ไอคอน/กรอบ) คู่กับชื่อ item อาจกำกวมว่าหมายถึง "แค่ item เหล่านี้" หรือ "element ของ item เหล่านี้" ต้องถามให้ชัดก่อนลบข้อมูลจริง**
   - **ข้อมูลจริงที่อัปเดตแล้ว**: Age 31 years old, Date of Birth March 23 1998, Phone 062-197-1764, Address 112 Moo 3, Nong Kaeo, Mueang Sisaket, Sisaket 33000, Thailand, Line ID pattarapong.it, Email pattarapong123@gmail.com
   - การ์ด/กรอบสี่เหลี่ยมรอบแต่ละ Personal Details item ถูกถอดออกแล้ว (เคยมี border+bg card ตอนนี้เหลือแค่ icon+text ลอยอยู่ตรงๆ)
8. **Footer** — ลิงก์ด่วน (Skills / Projects / About), social, ปีลิขสิทธิ์อัตโนมัติ

## Image Lightbox (ใช้เฉพาะ Projects modal — Career Gallery ไม่ใช้)
- คลิกรูปใน Projects modal image grid → เปิด full-screen lightbox (`#image-lightbox`, z-[70])
- ไม่มีฟีเจอร์ซูม/ลาก (ถอดออกตามคำขอผู้ใช้ในอดีต — อย่าเพิ่มกลับมาโดยไม่ถาม)
- เลื่อนดูรูปถัดไป/ก่อนหน้า: คลิกฝั่งซ้าย/ขวาของรูป, ปุ่มลูกศร prev/next, swipe บนมือถือ, คีย์บอร์ด ← / →, Escape ปิด
- ใช้ตัวแปร global `lightboxProject`/`lightboxIndex` และฟังก์ชัน `openLightbox(project, index)`
- ใช้ `lockPageScroll(true/false)` ร่วมกับ project modal (ดูหัวข้อ Projects ด้านบน)

## หน้าเว็บโหลดครั้งแรก
- บังคับ scroll ไปบนสุด (`window.scrollTo(0,0)` + `history.scrollRestoration = 'manual'`) ทุกครั้งที่โหลดหน้าใหม่
- `<html>` และ `<body>` มี `overflow-x: hidden` + `max-width: 100vw` ทั้งคู่ (เพิ่ม body เข้ามาแก้บั๊ก mobile narrow-column — ดูหัวข้อ Navigation ด้านบน)

## Design System หลัก
- **Blue accent** (`accent-50`–`accent-900`): โลโก้ navbar, nav-link hover, ปุ่ม Download CV border, hero photo glow, timeline node, date badge
- **Orange**: หัวข้อ section, eyebrow label, active filter tab, ปุ่ม Hero "My Projects", typing effect, "More/Less" indicator, hover border ของการ์ด Projects, active dot ใน Skills carousel
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
  - `projects` — id, sort_order, title, category, featured, icon, description, tags (jsonb, ไม่ได้ใช้แสดงผลแล้วแต่ยังเก็บไว้), **`details` (jsonb, grouped breakdown — ว่างเปล่า `[]` สำหรับ 4 โปรเจกต์ใหม่ที่เป็น short-desc only)**, images (jsonb) — **7 แถว ข้อมูลจริงทั้งหมด** (sort_order -6..-3 = 4 โปรเจกต์ใหม่ 2026-07-27 ยังไม่ final order, -2/-1/0 = Buriram/Surat Thani/Amata Nakorn, ใช้เลขติดลบเพื่อแทรกก่อนแถวเดิมโดยไม่ต้อง renumber)
  - `skills` — id, sort_order, category, icon (ไม่ใช้แล้ว), items (jsonb) — ข้อมูลจริง 6 แถว/60 items, sort_order ปัจจุบัน 1-6 = Server & Monitoring / Hardware / OS & Software / CCTV / Management / Network (Network ย้ายมาท้ายสุด)
- โค้ด `loadTable()` ดึงข้อมูลเรียงตาม `sort_order`, map `description` → `desc`, fallback ไปใช้ `MOCK_DATA` ถ้า fetch ล้มเหลว (MOCK_DATA ทุกตารางตรงกับ DB จริงแล้ว รวม Projects 3 รายการล่าสุด)
- ฟังก์ชัน render responsibilities: `renderResponsibilitiesBlock(item)` / `renderResponsibilityList(items)` (ใช้กับ Journey); Projects modal details ใช้ logic แยกของตัวเองใน `openProjectModal()` (list เต็มความกว้าง ไม่แบ่งคอลัมน์)

## ฟีเจอร์ที่เคยขอแล้ว "ยกเลิก/rollback" — สำคัญ อย่าทำใหม่โดยไม่ถาม
- **ปุ่ม Sign in + แก้ไขเนื้อหาผ่านหน้าเว็บ + auto-push**: ยกเลิกหลังอธิบายความเสี่ยง (static site ไม่มี server) — ถ้าจะทำใหม่ต้องใช้ Supabase Auth จริง + RLS + Edge Function
- **Zoom/pan บนรูปใน Image Lightbox**: เคยทำแล้วถอดออก เหลือคลิกซ้าย-ขวา/swipe เท่านั้น
- **Lightbox บน Career Transition Gallery**: เคยมีแล้วถอดออก แทนที่ด้วย drag-to-pan — ห้ามเพิ่มกลับมาโดยไม่ถาม
- **Skills แบ่งเป็น 14 หมวดย่อย**: rollback กลับ 5+1 หมวดเดิม
- **Badge ระดับความชำนาญแยกสีตามระดับ**: เปลี่ยนเป็นเขียวทั้งหมดแทนแล้ว ห้ามแยกสีอีก
- **Skills mobile: circular "orbit" wheel UI** (วงแหวนไอคอนลากหมุนได้): ทำเสร็จสมบูรณ์แล้วแต่ผู้ใช้บอก "ไม่สวย" ขอ rollback เต็มรูปแบบทันที — ปัจจุบันใช้ carousel auto-advance 4×2=8 แทน (ดูหัวข้อ Skills) — ห้ามเสนอ orbit UI อีกโดยไม่ถามหรือไม่เปลี่ยนดีไซน์ให้ต่างจากเดิมมากๆ
- **Projects modal: tags pill แถว, hero image + thumbnail strip gallery**: ถอดออกแล้ว เปลี่ยนเป็น details breakdown + image grid แทน

## สิ่งที่ยังเป็น Placeholder / ควรแก้ก่อน publish จริง
- Social links (GitHub, LinkedIn) ยังเป็น URL ตัวอย่าง
- **Projects, Education, Experience, Skills เป็นข้อมูลจริงครบทั้งหมดแล้ว** — เหลือแค่ About Me บางส่วน (ดูด้านล่าง) และ Social links ที่ยังเป็น placeholder
- Personal Details ใน About Me: Full Name/Age/Date of Birth/Phone/Address/Nationality/Availability/Line ID/Email เป็นของจริงหมดแล้ว (อัปเดตล่าสุด 2026-07-26) — ไม่มี field ไหนเป็น mock อีกต่อไปในหัวข้อนี้
- Skills บางรายการยังไม่มีไอคอนจริง (แสดงเป็น text-monogram แทน) — รอผู้ใช้ส่งไฟล์ไอคอนเพิ่ม
- Skills บางรายการที่ผู้ใช้ไม่ได้ระบุระดับความชำนาญมา ผมเดาให้แบบสมเหตุสมผลจาก context งานจริง (Face Access, Scanner, Rack Server, Monitor, IT Asset Management, Stock Card, Device Equipment, Expired Asset) — **ผู้ใช้ยังไม่ได้ confirm ตัวเลขพวกนี้ 100%** ถ้าคุยเรื่อง Skills ต่อควรถามยืนยันอีกที
- ปุ่ม Download CV ลิงก์ไปไฟล์จริงแล้ว (`assets/Pattarapong_Tensuna_CV.pdf.pdf`)
- Projects อาจมีเพิ่มอีกในอนาคต (ผู้ใช้ทำทีละโปรเจกต์ ส่งโฟลเดอร์รูป + .txt รายละเอียดมาให้ทำทีละอัน) — ทำตาม pattern เดิม: คัดลอกรูปไป `photos/Projects/<slug>/`, insert แถวใหม่ใน Supabase `projects` (sort_order ติดลบให้แทรกบนสุดถ้าเป็นงานล่าสุด), sync `MOCK_DATA.projects` ให้ตรงกัน, ถามว่าต้องการ `desc` สั้นอย่างเดียวหรือ `details` breakdown เต็มแบบ 3 โปรเจกต์ปัจจุบัน

## วิธีใช้ต่อในแชทใหม่
เปิดไฟล์นี้แนบไปพร้อมกับไฟล์ `D:\Project_port\index.html` (หรือบอกพาธ) แล้วอธิบายว่าต้องการแก้ไข/เพิ่มอะไรต่อ ระบบจะเข้าใจ context ของโปรเจกต์ทั้งหมดจากไฟล์นี้

**อัปเดตล่าสุดหลังจาก** (2026-07-26): ปรับ Skills section มือถือใหม่ทั้งหมด (ลอง orbit UI แล้ว rollback → ลงตัวที่ carousel auto-advance 4×2=8 ทุก 3 วิ), ย้าย/ย่อชื่อหมวด Skills (Network ไปท้ายสุด, ชื่อสั้นลง), ปรับ About Me ใหญ่ (ตัด intro paragraph, ปรับ layout มือถือ/desktop ด้วย grid-template-areas, ถอดกรอบการ์ด Personal Details, ใส่ไอคอนจริง Line/Gmail, อัปเดตข้อมูลจริงครบ), แก้บั๊กจริงบนมือถือ 2 อย่าง (หน้าเว็บบีบแคบ, scroll ทะลุพื้นหลัง modal), **เพิ่ม Projects จริง 3 รายการแทน mock ทั้งหมด** (Amata Nakorn, Surat Thani, Buriram — greenfield store setup, รูปจริง 12 รูป/โปรเจกต์, breakdown รายละเอียดเต็ม 5 หมวดผ่านคอลัมน์ใหม่ `projects.details`), ปรับ Projects modal ใหญ่ (กว้างเท่า container หลัก, image grid แทน gallery เดิม, ถอด tags, แก้ scroll-lock บั๊ก)
