# Project Summary — Pattarapong Tensuna Portfolio Website

## ภาพรวมโปรเจกต์
เว็บไซต์พอร์ตโฟลิโอแบบไฟล์เดียว (`index.html`) สำหรับ Pattarapong Tensuna ตำแหน่ง IT Support / IT Officer / Helpdesk / IT Administrator
- **Tech stack**: HTML + Tailwind CSS (CDN) + Vanilla JavaScript + Supabase JS client (CDN) — เชื่อมต่อ Supabase จริงแล้ว (ดูหัวข้อ "Supabase Integration" ด้านล่าง)
- **Hosting**: GitHub Pages (static) — โค้ด `index.html` + asset ทั้งหมดอยู่ใน repo เดียวกับที่ push อัตโนมัติผ่าน git
- **GitHub repo**: https://github.com/pattarapong123-lang/pattarapong.ten (branch `main`)
- **โครงสร้างไฟล์**:
  - `D:\Project_port\index.html` — เว็บไซต์ทั้งหมด (section เดียว ไม่มีหน้า Contact แยก)
  - `D:\Project_port\assets\Pattarapong_Tensuna_CV.pdf.pdf` — ไฟล์ CV จริงของผู้ใช้ (ปุ่ม Download CV ลิงก์ไปที่นี่)
  - `D:\Project_port\photos\p1.png` — รูปโปรไฟล์ hero section (วงกลม)
  - `D:\Project_port\photos\a1.jpg` — รูปโปรไฟล์เต็มตัวที่ใช้ใน About Me section
  - `D:\Project_port\photos\Gallery\s1.jpg` – `s11.jpg` — รูปภาพสภาพแวดล้อมงาน/โครงสร้างพื้นฐานจริง (11 รูป) ใช้ใน Career Transition Gallery (ลากดูซ้าย-ขวาได้ ไม่มี lightbox แล้ว) และเป็น placeholder ใน Projects modal gallery (3 จาก 6 โปรเจกต์, กดดูเต็มจอได้ผ่าน lightbox ในส่วนนั้น) — ไฟล์เดิม `photos\s1.jpeg`–`s6.jpeg` ถูกลบและย้ายไปที่โฟลเดอร์นี้แล้ว
  - `D:\Project_port\photos\Logos\dohome.png`, `foryouall.png`, `fountaintree.png` — โลโก้บริษัท/สถานที่ทำงานจริง แสดงเป็นวงกลมมุมขวาบนของการ์ดใน Work Experience timeline
  - `D:\Project_port\photos\icons\*.png` (+ `switch.jpg`) — ไอคอนทักษะจริง 12 ไฟล์ (cctv, com, linux, ms365, printer, proxmox, switch, vm, wifi, windows, zabbix, zstack) ใช้ใน Skills section (ไอคอนต่อ item ไม่ใช่ต่อหมวดหมู่)
  - ปัจจุบันมีรูปทั้งหมด ~30 รูปใน `photos/` (รวมโฟลเดอร์ `Gallery/` 11 รูป, `Logos/` 3 รูป, `icons/` 12 รูป)

## ลำดับ Section บนหน้าเว็บ (บนลงล่าง)
1. **Navigation** — fixed navbar, smooth scroll, dark/light toggle (persist ผ่าน localStorage), hamburger menu บนมือถือ. เมนู Journey / Skills / Projects / About และปุ่ม theme toggle จัดกลุ่มชิดขวาสุดของ navbar
2. **Hero (`#home`)** — 2 คอลัมน์: ซ้ายเป็นชื่อตัวพิมพ์ใหญ่, "Hi, my name is" + typing effect หมุนตำแหน่งงาน (สีส้ม), badge "Available for Work" (สีเขียว emerald), ปุ่ม "My Projects" (สีส้ม, ลิงก์ `#projects`) + Download CV, social links (GitHub/LinkedIn/Email — ยังเป็น placeholder URL); ขวาเป็นรูปโปรไฟล์วงกลมพร้อม glow animation แบบ breathing สีฟ้า (blue)
3. **Career Transition Gallery (`#gallery`)** — marquee เลื่อนภาพแนวนอนแบบ infinite loop อัตโนมัติ (JS-driven ผ่าน `scrollLeft`, ไม่ใช้ CSS animation แล้ว), หยุดเมื่อ hover, **ลากด้วยเมาส์/นิ้ว (drag-to-pan) เพื่อเลื่อนซ้าย-ขวาเองได้** — **ไม่มีฟีเจอร์กดดูเต็มจอ (lightbox) แล้ว ตามคำขอผู้ใช้** (ถูกถอดออก, รูปในส่วนนี้ไม่เชื่อมกับ Image Lightbox อีกต่อไป — lightbox ยังใช้ในส่วน Projects modal เท่านั้น) รูปทั้งหมด 11 รูปอยู่ที่ `photos/Gallery/s1.jpg` – `s11.jpg`
4. **My Journey (`#journey`)** — timeline แบบ tab สลับ Education/Work Experience, default tab = Work Experience:
   - **ข้อมูลเป็นของจริงทั้งหมดแล้ว ทั้ง Education และ Work Experience** (ไม่ใช่ mock/placeholder อีกต่อไป — ดูรายละเอียดด้านล่าง)
   - Timeline node (วงกลมไอคอนกลาง) สีฟ้า (accent-600/500), ไอคอนขนาด `w-4 h-4`
   - **การ์ด Work Experience กดขยายดูรายละเอียดได้ ("More/Less")** — เมื่อขยาย การ์ดจะ**กว้างเต็มแถว (span ทั้ง 2 คอลัมน์ของ layout ซ้าย-ขวา) แทนที่จะยืดลงด้านล่างอย่างเดียว** ทำให้ไม่ยาวเกินไปเวลารายละเอียดเยอะ และ list "Key Responsibilities" จัดเป็น 2 คอลัมน์บนจอกว้าง (`sm:columns-2`) เพื่อลดความสูง
   - **แต่ละการ์ด Work Experience มีโลโก้บริษัทเป็นวงกลมมุมขวาบน** (ขนาด 80px บนจอกว้าง / 64px มือถือ) ดึงจาก `photos/Logos/*.png`; title/subtitle เผื่อ padding-right ไว้ไม่ให้ทับกับโลโก้
   - "Key Responsibilities" รองรับ 2 รูปแบบข้อมูล: list เดียว (flat array of strings) หรือแบ่งเป็นหมวดหมู่ (`[{title, items}]`) แล้ว render เป็น sub-heading แยกกลุ่ม — งานที่มีหน้าที่หลายหมวด (เช่น IT Officer Setup) ใช้แบบแบ่งกลุ่ม
   - แท็บ Education ไม่มีปุ่มขยาย/โลโก้ (เป็น card แบบเดิม แสดง date/title/subtitle/org/desc เท่านั้น)

### ข้อมูล Work Experience จริง (เรียงจากล่าสุด)
   1. **06/2023 — Present**: IT Support @ Dohome public company limited (Bangna Branch | Bangprakong | Chachoengsao) — 11 responsibilities (flat list): Network Infrastructure, Wireless Network, Server & Virtualization, Software & Collaboration, Remote Support & Monitoring, Hardware Asset, CCTV & Surveillance, POS & Peripherals, Access Control, MDM, IT Inventory & Asset Lifecycle
   2. **06/2021 — 06/2023**: IT Officer Setup @ Dohome public company limited (Headquarter | Bangkok) — responsibilities แบ่ง 2 กลุ่ม: "Project Deployment" (5 ข้อ) และ "Infrastructure Renovation & Support" (5 ข้อ)
   3. **06/2019 — 06/2021**: IT Service Onsite @ FOR YOU ALL CO., LTD. (Bo Thong | Chonburi) — 3 responsibilities: IT Hardware & Office Equipment, CCTV & Smart Classroom, Onsite Support (300+ หน่วยงานราชการใน Chonburi/Rayong/Chachoengsao)
   4. **11/2018 — 03/2019**: IT Support Trainee @ Fountaintree Resort (Pakchong | Nakhon Ratchasima) — 5 responsibilities: User Support, Hardware & Software Systems, CCTV & Surveillance Systems, Wireless Network (Wi-Fi), Office Equipment & Peripherals
   - รูปแบบวันที่มาตรฐาน: ตัวเลข `MM/YYYY` ทั้งหมด (ไม่ใช้ชื่อเดือนเต็ม เช่น "November")

### ข้อมูล Education จริง (เรียงจากล่าสุด)
   1. **2015 — 2019**: Bachelor's Degree, Business Computer @ Sisaket Rajabhat University | Sisaket — Faculty of Business Administration and Accountancy, GPA 2.25
   2. **2010 — 2013**: High School, Arts-Mathematics Program @ Satreesiriket School | Sisaket — GPA 2.60
   3. **2007 — 2009**: Middle School, General Education @ Kraipakdee Wittayakom School | Sisaket — GPA 3.30
   - (Primary School entry เดิมถูกลบออกตามคำขอผู้ใช้ เหลือ 3 รายการ)

5. **Skills (`#skills`)** — filter tabs ตามหมวด, active tab สีส้ม, badge ระดับความชำนาญ (Advanced=เขียว, Intermediate=ส้ม, Basic=เทา) — **ข้อมูลจริงแล้ว** (4 หมวด/12 ทักษะ, อัปเดต 2026-07-25): **OS & Collaboration** (Windows Server/Client, Linux, Microsoft 365), **Virtualization & Infrastructure** (Proxmox VE, VMware, ZStack), **Networking & Monitoring** (Switching L2/L3, Wireless Network Wi-Fi, Zabbix Monitoring), **Hardware & Peripherals** (CCTV & Surveillance, Printers & Peripherals, IP Phone & Communication) — แต่ละ item มีไอคอนรูปจริงเป็นของตัวเอง (ไม่ใช่อีโมจิต่อหมวดแบบเดิมแล้ว) จาก `photos/icons/*.png` (และ `switch.jpg`)
6. **Projects (`#projects`)** — filter tabs พร้อมตัวนับ (All / Infrastructure / Process / Networking / Administration / Security / Tools)
   - การ์ดโปรเจกต์: cover เป็น placeholder icon (emoji), badge หมวดหมู่, badge "Featured" ถ้ามี, title, description (ไม่มี tag pill บนการ์ด)
   - กดการ์ดเปิด **modal รายละเอียด** ที่ขยายกว้างขึ้นแล้ว (`max-w-4xl`, gallery สูง `h-72 sm:h-[28rem]`) แสดงรูปภาพแกลเลอรี + thumbnail, category, badge Featured, title, description เต็ม, tag pill ทั้งหมด
   - **รูปในแกลเลอรี (ทั้ง Projects modal และ Career Transition Gallery) กดดูเต็มจอได้ผ่าน Image Lightbox ตัวเดียวกัน** (ดูหัวข้อถัดไป)
   - ข้อมูลรูปภาพอยู่ในคอลัมน์ `projects.images` (jsonb array) — 3 จาก 6 โปรเจกต์มีรูป (ใช้ `photos/s1–s6.jpeg` ซ้ำเป็น placeholder), อีก 3 ยังไม่มีรูป
7. **About Me (`#about`)** — bio + "Personal Details" (ข้อมูลส่วนตัวส่วนใหญ่ยังเป็น mock) + รูปโปรไฟล์เต็มตัว `photos/a1.jpg`
8. **Footer** — ลิงก์ด่วน (Skills / Projects / About), social, ปีลิขสิทธิ์อัตโนมัติ

## Image Lightbox (ใช้เฉพาะ Projects modal แล้ว — Career Transition Gallery ไม่ใช้แล้ว)
- คลิกรูปใน Projects modal (main gallery) → เปิด full-screen lightbox (`#image-lightbox`, z-[70])
- **ไม่มีฟีเจอร์ซูม/ลาก** (เคยทำไว้แล้วถอดออกตามคำขอผู้ใช้ — อย่าเพิ่มกลับมาโดยไม่ถาม)
- เลื่อนดูรูปถัดไป/ก่อนหน้าทำได้หลายทาง: **คลิกฝั่งซ้าย/ขวาของรูป**, ปุ่มลูกศร prev/next, **swipe บนมือถือ**, คีย์บอร์ด ← / → , Escape ปิด
- ใช้ตัวแปร global `lightboxProject`/`lightboxIndex` และฟังก์ชัน `openLightbox(project, index)` — รับ object ใดๆ ที่มี `{title, images: []}` ไม่จำเป็นต้องเป็น project จริงจาก DB
- **Career Transition Gallery ไม่เชื่อมกับ lightbox นี้แล้ว** (ถอดออกตามคำขอผู้ใช้ 2026-07-25) — ตัว pseudo-object `careerGalleryProject` และ listener ที่เคยเปิด lightbox จากรูปใน marquee ถูกลบทิ้งไปแล้ว แทนที่ด้วยฟีเจอร์ drag-to-pan ในตัว marquee เอง (ดูหัวข้อ Career Transition Gallery ด้านบน) — **ถ้าจะทำ lightbox กลับมาที่ gallery ต้องถามผู้ใช้ก่อน**

## หน้าเว็บโหลดครั้งแรก
- บังคับ scroll ไปบนสุด (`window.scrollTo(0,0)` + `history.scrollRestoration = 'manual'`) ทุกครั้งที่โหลดหน้าใหม่

## Design System หลัก
- **Blue accent** (`accent-50`–`accent-900` ใน tailwind.config, ค่าเดียวกับ Tailwind `blue`): ใช้กับโลโก้ navbar, nav-link hover, ปุ่ม Download CV border, hero photo glow, timeline node วงกลม, date badge ในไทม์ไลน์
- **Orange**: สีเน้นหลักของหัวข้อ section, eyebrow label, active filter tab (Skills/Projects/Journey), ปุ่ม Hero "My Projects", "Hi, my name is" + role ที่พิมพ์หมุน, "More/Less" indicator ใน Journey, ปุ่ม hover border ของการ์ด Projects
- Badge "Available for Work" เป็นสีเขียว (emerald) — ไม่ใช่ส้มหรือฟ้า
- **Font**: Inter (เนื้อหาทั่วไป), JetBrains Mono (โค้ด/แท็ก/ตัวเลข)
- **Dark/Light mode**: Tailwind `darkMode: 'class'`, persist ผ่าน localStorage, default ตาม `prefers-color-scheme`
- **Animation**: scroll-reveal (IntersectionObserver + `.reveal`), typing effect, glow pulse, marquee infinite scroll, tab fade transition, grid-rows expand/collapse (Work Experience card detail, ตอนนี้ขยายแบบ `sm:col-span-3` ด้วย), modal fade-in

## Supabase Integration (เชื่อมต่อจริงแล้ว)
- Project: `pattarapong123-lang's Project` (ref `aftnbucohvfmhmxvsmjh`, region ap-northeast-1)
- `SUPABASE_URL` / `SUPABASE_ANON_KEY` ใน `index.html` เป็นค่าจริง
- **สำคัญ: client สร้างด้วย `global.fetch` override ที่บังคับ `cache: 'no-store'`** — เพราะเจอปัญหาจริงว่า browser cache response เก่าของ Supabase REST ไว้ ทำให้แก้ข้อมูลใน DB แล้วเว็บไม่อัปเดตทันที (ต้องรีเฟรชหลายรอบ) การ override นี้แก้ปัญหาถาวรแล้ว — **อย่าลบ option นี้ออก**
- ตาราง (ทั้งหมดเปิด RLS พร้อม policy "public can read" — อ่านได้ทุกคน แต่ไม่มีใครเขียน/แก้ผ่านหน้าเว็บได้):
  - `education` — id, sort_order, date, title, subtitle, org, description, created_at (3 แถว, ข้อมูลจริงแล้ว)
  - `experience` — เหมือน education **บวก 2 คอลัมน์ใหม่**: `responsibilities` (jsonb — flat array ของ string หรือ array ของ `{title, items}` สำหรับงานที่แบ่งหมวด), `logo` (text — path ไปยังรูปโลโก้ เช่น `./photos/Logos/dohome.png`) (4 แถว, ข้อมูลจริงแล้ว)
  - `projects` — id, sort_order, title, category, featured, icon, description, tags (jsonb), images (jsonb), created_at
  - `skills` — id, sort_order, category, icon (คอลัมน์นี้ไม่ใช้แล้ว, เป็น null หมด), items (jsonb: `[{name, level, icon}]` — **icon อยู่ระดับ item แล้ว ไม่ใช่ระดับ category**), created_at — ข้อมูลจริงแล้ว (4 แถว)
- โค้ด `loadTable()` ดึงข้อมูลเรียงตาม `sort_order`, map `description` → `desc`, fallback ไปใช้ `MOCK_DATA` ในไฟล์ถ้า fetch ล้มเหลวหรือตารางว่าง (MOCK_DATA ของ education/experience อัปเดตให้ตรงกับ DB จริงแล้วเช่นกัน เพื่อให้ fallback ถูกต้องด้วย)
- ฟังก์ชัน render responsibilities อยู่ที่ `renderResponsibilitiesBlock(item)` / `renderResponsibilityList(items)` ใน `<script>` — ตรวจชนิดข้อมูลอัตโนมัติ (`typeof data[0] === 'object'` → grouped, else flat)

## ฟีเจอร์ที่เคยขอแล้ว "ยกเลิก" — สำคัญ อย่าทำใหม่โดยไม่ถาม
- **ปุ่ม Sign in (admin/admin) + แก้ไขเนื้อหา/รูปผ่านหน้าเว็บ + auto-push ขึ้น GitHub/Supabase**: ยกเลิกทั้งหมดหลังอธิบายความเสี่ยงด้านความปลอดภัย (เว็บเป็น static site บน GitHub Pages ไม่มี server ตัวเอง) ผู้ใช้เลือกจะแก้ไขเองผ่าน Supabase dashboard หรือขอให้ผมแก้ให้แทน — ถ้าจะทำใหม่ในอนาคตต้องใช้ Supabase Auth จริง + RLS policy + Edge Function เก็บ token ฝั่ง server
- **Zoom/pan บนรูปใน Image Lightbox**: เคยทำ (คลิกเพื่อซูม 2.5x + ลากดูรอบรูป) แล้วผู้ใช้ขอถอดออก เหลือแค่คลิกซ้าย-ขวา/swipe เพื่อเลื่อนดูรูปถัดไปแบบง่ายๆ

## สิ่งที่ยังเป็น Placeholder / ควรแก้ก่อน publish จริง
- Social links (GitHub, LinkedIn) ยังเป็น URL ตัวอย่าง
- Personal Details ใน About Me ส่วนใหญ่ยังเป็น mock data (Full Name และ Email เป็นของจริงอยู่แล้ว)
- **Projects ในฐานข้อมูล Supabase ยังเป็น mock/ตัวอย่าง** ไม่ใช่ของจริงของผู้ใช้ (Education/Experience/Skills เป็นข้อมูลจริงแล้วทั้งหมด)
- Projects modal gallery: 3 จาก 6 โปรเจกต์ยังไม่มีรูปจริง (ใช้ placeholder จาก photos/s*.jpeg ซ้ำกัน หรือว่างเปล่า)
- ปุ่ม Download CV ลิงก์ไปไฟล์จริงแล้ว (`assets/Pattarapong_Tensuna_CV.pdf.pdf`)

## วิธีใช้ต่อในแชทใหม่
เปิดไฟล์นี้แนบไปพร้อมกับไฟล์ `D:\Project_port\index.html` (หรือบอกพาธ) แล้วอธิบายว่าต้องการแก้ไข/เพิ่มอะไรต่อ ระบบจะเข้าใจ context ของโปรเจกต์ทั้งหมดจากไฟล์นี้

**อัปเดตล่าสุดหลังจาก**: เติมข้อมูล Work Experience และ Education จริงทั้งหมด (4 งาน + 3 การศึกษา, ลบ Primary School), เพิ่มโลโก้บริษัทในการ์ด Work Experience, ปรับการ์ดขยายแบบกว้างเต็มแถวแทนยืดลง + responsibilities แบบแบ่งกลุ่มได้, ทำ Image Lightbox ใช้ร่วมกันทั้ง Projects และ Career Gallery (เอาฟีเจอร์ซูม/ลากออกแล้วเหลือคลิก/swipe เลื่อนรูป), ขยาย Projects modal ให้กว้างขึ้น, แก้บั๊ก Supabase fetch caching (เพิ่ม `cache: 'no-store'`), มาตรฐานรูปแบบวันที่เป็น `MM/YYYY`
