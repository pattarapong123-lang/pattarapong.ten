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
  - `D:\Project_port\photos\Gallery\s1.jpg` – `s15.png` — รูปภาพสภาพแวดล้อมงาน/โครงสร้างพื้นฐานจริง **15 รูป** ใช้ใน Career Transition Gallery และเป็น placeholder ใน Projects modal gallery (3 จาก 6 โปรเจกต์) — **นามสกุลไฟล์ไม่เท่ากันทุกไฟล์** เพราะผู้ใช้อัปเดตรูปทีละไฟล์หลายรอบ: ส่วนใหญ่เป็น `.jpg`, แต่ `s5` = `.png`, `s7` = `.jpeg`, `s12`/`s15` = `.png` — **ต้องเช็ค path จริงในโค้ดก่อนแก้ อย่าเดานามสกุล**
  - `D:\Project_port\photos\Logos\dohome.png`, `foryouall.png`, `fountaintree.png` — โลโก้บริษัท/สถานที่ทำงานจริง แสดงเป็นวงกลมมุมขวาบนของการ์ดใน Work Experience timeline
  - `D:\Project_port\photos\icons\*.png` (+ ไม่กี่ไฟล์เป็น `.jpg`) — ไอคอนทักษะจริง **50 ไฟล์** ใช้ใน Skills section (ไอคอนต่อ item ไม่ใช่ต่อหมวดหมู่) — ไฟล์ที่ยังไม่มีไอคอนจริงจะ fallback เป็น text-monogram badge แทน (ดูหัวข้อ Skills ด้านล่าง)
  - ปัจจุบันมีรูปทั้งหมด ~70 รูปใน `photos/` (Gallery 15, Logos 3, icons 50, root 2)

## ลำดับ Section บนหน้าเว็บ (บนลงล่าง)
1. **Navigation** — fixed navbar, smooth scroll, dark/light toggle (persist ผ่าน localStorage), hamburger menu บนมือถือ. เมนู Journey / Skills / Projects / About และปุ่ม theme toggle จัดกลุ่มชิดขวาสุดของ navbar
2. **Hero (`#home`)** — 2 คอลัมน์: ซ้ายเป็นชื่อตัวพิมพ์ใหญ่, "Hi, my name is" + typing effect หมุนตำแหน่งงาน (สีส้ม), badge "Available for Work" (สีเขียว emerald), ปุ่ม "My Projects" (สีส้ม, ลิงก์ `#projects`) + Download CV, social links (GitHub/LinkedIn/Email — ยังเป็น placeholder URL); ขวาเป็นรูปโปรไฟล์วงกลมพร้อม glow animation แบบ breathing สีฟ้า (blue)
3. **Career Transition Gallery (`#gallery`)** — **ไม่มี lightbox แล้ว** (ถอดออกตามคำขอผู้ใช้) รูปทั้งหมด **15 รูป** จาก `photos/Gallery/`:
   - **Auto-scroll + drag-to-pan + momentum/inertia**: marquee เลื่อนอัตโนมัติตลอด, หยุดเมื่อ hover, **ลากด้วยเมาส์/นิ้วเพื่อเลื่อนซ้าย-ขวาเองได้ และถ้าลาก "สะบัด" เร็วๆ แล้วปล่อย รูปจะไหลต่อเองแล้วค่อยๆ ช้าลง (momentum) ก่อนกลับเข้าสู่ auto-scroll ปกติ** — ใช้ pointer events คำนวณ velocity ระหว่างลาก แล้ว decay ด้วย friction หลังปล่อยมือ (ฟังก์ชัน `initMarquee()` ใน `<script>`)
   - **สำคัญทางเทคนิค**: marquee ขับเคลื่อนด้วย `transform: translateX()` ผ่าน JS (ไม่ใช้ native `scrollLeft`/`overflow-x` บน wrapper) เพราะถ้า wrapper เป็น scroll container จะ clip เอฟเฟกต์ hover-scale (การ์ดขยาย 1.5x ตอน hover) ทั้งแนวตั้งด้วย ไม่ใช่แค่แนวนอน — การซ่อน horizontal overflow ของทั้งหน้าเว็บทำที่ **`html { overflow-x: hidden }`** แทน (ไม่ใช่ที่ section `#gallery` เหมือนเดิม) เพื่อให้การ์ดขยายตอน hover โผล่พ้นแถวได้อย่างอิสระโดยไม่ถูกตัด — **ถ้าจะแก้ marquee นี้ในอนาคต ห้ามใส่ `overflow-x: auto`/`hidden` กลับเข้าไปที่ `.marquee-wrapper` หรือ `#gallery` section เด็ดขาด เดี๋ยว hover-scale จะพังอีก**
   - ไฟล์เดิม `photos\s1.jpeg`–`s6.jpeg` (นอก Gallery folder) ถูกลบไปนานแล้ว ไม่ต้องอ้างอิงอีก
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

5. **Skills (`#skills`)** — **ข้อมูลจริงแล้ว, อัปเดตล่าสุด 2026-07-25** — **6 หมวด / 60 ทักษะ** เรียงลำดับตามที่ผู้ใช้กำหนด (ไม่ใช่เรียงตามตัวอักษร):
   1. **Networking** (12): Switch L3, Switch L2, Wi-Fi, LAN, Fiber Optic, IP/VLAN, Firewall, Huawei, Cisco, Ruijie, H3C, Unifi
   2. **Server & Monitoring Center** (12): Proxmox, VMware, ZStack, NAS Storage/SMB Sharing, Zabbix, OCS Inventory, Uptime Kuma, Print Server, Wireless Controller, DHCP Server, Backup Server, Server Room
   3. **Hardware** (12): Computer, Printer, POS, Thermal Printer, IP Phone, Notebook, Sound/Amp, Handheld, Face Access, Scanner, Rack Server, Monitor
   4. **OS & Software** (12): Windows, Linux, Microsoft 365, Microsoft Office, Chrome, Edge, SAP, ERP, PDF, Other Software, VNC Remote, RustDesk
   5. **CCTV** (8): IP Camera, Analog Camera, NVR, XVR, DVR, DSS, LAN/PoE, RG Cable
   6. **Management** (4): IT Asset Management, Stock Card, Device Equipment, Expired Asset
   - **ดีไซน์การ์ด**: ไม่มีกรอบ/กล่อง (border/bg card ถูกถอดออกตามคำขอผู้ใช้) เหลือแค่วงกลมไอคอน + ชื่อ + badge ระดับ ลอยอยู่บนพื้นหลัง section ตรงๆ, hover ยกขึ้นเบาๆ (`hover:-translate-y-1`) แทนการเปลี่ยนสีกรอบ
   - **Badge ระดับความชำนาญเป็นสีเขียว (emerald) ทั้งหมดทุกระดับแล้ว** (Advanced/Intermediate/Basic ไม่แยกสีกันอีกต่อไป — เคยเป็นเขียว/ส้ม/เทา ผู้ใช้ขอให้เป็นเขียวหมด) — ดูตัวแปร `SKILL_LEVEL_STYLES`/`SKILL_LEVEL_DOTS`
   - **ไอคอนอยู่ระดับ item ไม่ใช่ระดับหมวดหมู่**: แต่ละ skill มี `icon` (path รูปจริงใน `photos/icons/`) หรือถ้ายังไม่มีไอคอนจริงจะมี `short` (ตัวย่อ 2-4 ตัวอักษร เช่น "DHCP", "SRV", "MON") แสดงเป็น text-monogram badge แทนรูป — ฟังก์ชัน `buildSkillCard(skill)` เช็คว่ามี `skill.icon` ไหม ถ้าไม่มีก็ fallback ไป `skill.short`
   - **Mobile: แสดงทีละ 4 รายการ (2x2) แล้วปัด/เลื่อนซ้าย-ขวาดูหน้าถัดไป** (scroll-snap, native touch scroll) — ใช้เทคนิค: JS แบ่ง items เป็นกลุ่มละ 4 ห่อด้วย `<div class="skill-page ... sm:contents">`, ที่ breakpoint `sm` ขึ้นไป wrapper นี้จะ `display: contents` (หายไปจาก layout tree) ทำให้ card ทั้งหมดไหลกลับเข้า grid ปกติเหมือนเดิมบนจอใหญ่ — ตัวแปร `SKILLS_PER_MOBILE_PAGE = 4` ใน `renderSkillGrid()`
   - **ประวัติที่ควรรู้**: เคยลองจัดใหม่เป็น 14 หมวดย่อย (หมวดละ ≤6 รายการ พอดี 1 แถว) แล้วผู้ใช้ขอ **rollback กลับมาเป็น 5 หมวดเดิม** เพราะหมวดเยอะไป (`git revert` commit `c2d1473` → `d2e19b2`) — **อย่าจัดกลุ่มใหม่เป็นหมวดย่อยจำนวนมากอีกโดยไม่ถาม** ถ้าต้องการลดความยาวต่อหมวด ให้ใช้ mobile pagination (มีอยู่แล้ว) แทน
6. **Projects (`#projects`)** — filter tabs พร้อมตัวนับ (All / Infrastructure / Process / Networking / Administration / Security / Tools)
   - การ์ดโปรเจกต์: cover เป็น placeholder icon (emoji), badge หมวดหมู่, badge "Featured" ถ้ามี, title, description (ไม่มี tag pill บนการ์ด)
   - กดการ์ดเปิด **modal รายละเอียด** ที่ขยายกว้างขึ้นแล้ว (`max-w-4xl`, gallery สูง `h-72 sm:h-[28rem]`) แสดงรูปภาพแกลเลอรี + thumbnail, category, badge Featured, title, description เต็ม, tag pill ทั้งหมด
   - **รูปในแกลเลอรีของ Projects modal กดดูเต็มจอได้ผ่าน Image Lightbox** (Career Gallery ไม่มี lightbox แล้ว — ดูหัวข้อถัดไป)
   - ข้อมูลรูปภาพอยู่ในคอลัมน์ `projects.images` (jsonb array) — 3 จาก 6 โปรเจกต์มีรูป ใช้รูปจาก `photos/Gallery/` ซ้ำเป็น placeholder (Office-wide Hardware Rollout: s1,s2 / Helpdesk Ticketing Optimization: s3 / Wi-Fi Infrastructure Upgrade: s4,s5.png,s6 — **s5 เป็น .png ไม่ใช่ .jpg**), อีก 3 โปรเจกต์ยังไม่มีรูป
7. **About Me (`#about`)** — bio + "Personal Details" (ข้อมูลส่วนตัวส่วนใหญ่ยังเป็น mock) + รูปโปรไฟล์เต็มตัว `photos/a1.jpg`
8. **Footer** — ลิงก์ด่วน (Skills / Projects / About), social, ปีลิขสิทธิ์อัตโนมัติ

## Image Lightbox (ใช้เฉพาะ Projects modal เท่านั้น — Career Transition Gallery ไม่ใช้แล้ว)
- คลิกรูปใน Projects modal (main gallery) → เปิด full-screen lightbox (`#image-lightbox`, z-[70])
- **ไม่มีฟีเจอร์ซูม/ลาก** (เคยทำไว้แล้วถอดออกตามคำขอผู้ใช้ — อย่าเพิ่มกลับมาโดยไม่ถาม)
- เลื่อนดูรูปถัดไป/ก่อนหน้าทำได้หลายทาง: **คลิกฝั่งซ้าย/ขวาของรูป**, ปุ่มลูกศร prev/next, **swipe บนมือถือ**, คีย์บอร์ด ← / → , Escape ปิด
- ใช้ตัวแปร global `lightboxProject`/`lightboxIndex` และฟังก์ชัน `openLightbox(project, index)` — รับ object ใดๆ ที่มี `{title, images: []}` ไม่จำเป็นต้องเป็น project จริงจาก DB
- **Career Transition Gallery ไม่เชื่อมกับ lightbox นี้แล้ว** — ตัว pseudo-object `careerGalleryProject` และ listener ที่เคยเปิด lightbox จากรูปใน marquee ถูกลบทิ้งไปแล้ว แทนที่ด้วยฟีเจอร์ drag-to-pan + momentum ในตัว marquee เอง (ดูหัวข้อ Career Transition Gallery ด้านบน) — **ถ้าจะทำ lightbox กลับมาที่ gallery ต้องถามผู้ใช้ก่อน**

## หน้าเว็บโหลดครั้งแรก
- บังคับ scroll ไปบนสุด (`window.scrollTo(0,0)` + `history.scrollRestoration = 'manual'`) ทุกครั้งที่โหลดหน้าใหม่
- `<html>` มี `overflow-x: hidden` (เพิ่มเข้ามาเพื่อรองรับ hover-scale ของ Career Gallery โดยไม่ให้เกิด scrollbar แนวนอนทั้งหน้า — ดูหัวข้อ Career Transition Gallery)

## Design System หลัก
- **Blue accent** (`accent-50`–`accent-900` ใน tailwind.config, ค่าเดียวกับ Tailwind `blue`): ใช้กับโลโก้ navbar, nav-link hover, ปุ่ม Download CV border, hero photo glow, timeline node วงกลม, date badge ในไทม์ไลน์
- **Orange**: สีเน้นหลักของหัวข้อ section, eyebrow label, active filter tab (Skills/Projects/Journey), ปุ่ม Hero "My Projects", "Hi, my name is" + role ที่พิมพ์หมุน, "More/Less" indicator ใน Journey, ปุ่ม hover border ของการ์ด Projects
- **Green (emerald)**: badge "Available for Work" และตอนนี้ badge ระดับความชำนาญใน Skills ทุกระดับด้วย (ไม่แยกสีตามระดับแล้ว)
- **Font**: Inter (เนื้อหาทั่วไป), JetBrains Mono (โค้ด/แท็ก/ตัวเลข)
- **Dark/Light mode**: Tailwind `darkMode: 'class'`, persist ผ่าน localStorage, default ตาม `prefers-color-scheme`
- **Animation**: scroll-reveal (IntersectionObserver + `.reveal`), typing effect, glow pulse, Career Gallery auto-scroll + drag + momentum (JS `transform`, ไม่ใช่ CSS animation), tab fade transition, grid-rows expand/collapse (Work Experience card detail), modal fade-in, Skills mobile scroll-snap pagination

## Supabase Integration (เชื่อมต่อจริงแล้ว)
- Project: `pattarapong123-lang's Project` (ref `aftnbucohvfmhmxvsmjh`, region ap-northeast-1)
- `SUPABASE_URL` / `SUPABASE_ANON_KEY` ใน `index.html` เป็นค่าจริง
- **สำคัญ: client สร้างด้วย `global.fetch` override ที่บังคับ `cache: 'no-store'`** — เพราะเจอปัญหาจริงว่า browser cache response เก่าของ Supabase REST ไว้ ทำให้แก้ข้อมูลใน DB แล้วเว็บไม่อัปเดตทันที (ต้องรีเฟรชหลายรอบ) การ override นี้แก้ปัญหาถาวรแล้ว — **อย่าลบ option นี้ออก**
- ตาราง (ทั้งหมดเปิด RLS พร้อม policy "public can read" — อ่านได้ทุกคน แต่ไม่มีใครเขียน/แก้ผ่านหน้าเว็บได้):
  - `education` — id, sort_order, date, title, subtitle, org, description, created_at (3 แถว, ข้อมูลจริงแล้ว)
  - `experience` — เหมือน education **บวก 2 คอลัมน์ใหม่**: `responsibilities` (jsonb — flat array ของ string หรือ array ของ `{title, items}` สำหรับงานที่แบ่งหมวด), `logo` (text — path ไปยังรูปโลโก้ เช่น `./photos/Logos/dohome.png`) (4 แถว, ข้อมูลจริงแล้ว)
  - `projects` — id, sort_order, title, category, featured, icon, description, tags (jsonb), images (jsonb), created_at — ยังเป็น mock/ตัวอย่าง
  - `skills` — id, sort_order, category, icon (คอลัมน์นี้ไม่ใช้แล้ว เป็น null หมด), items (jsonb: `[{name, level, icon?, short?}]` — **icon อยู่ระดับ item**, ถ้าไม่มี `icon` จะมี `short` แทนสำหรับ text-monogram fallback), created_at — ข้อมูลจริงแล้ว **6 แถว / 60 items รวม** (sort_order 1-6 = Networking, Server & Monitoring Center, Hardware, OS & Software, CCTV, Management)
- โค้ด `loadTable()` ดึงข้อมูลเรียงตาม `sort_order`, map `description` → `desc`, fallback ไปใช้ `MOCK_DATA` ในไฟล์ถ้า fetch ล้มเหลวหรือตารางว่าง (MOCK_DATA ของทุกตารางตรงกับ DB จริงแล้ว รวม skills)
- ฟังก์ชัน render responsibilities อยู่ที่ `renderResponsibilitiesBlock(item)` / `renderResponsibilityList(items)` ใน `<script>` — ตรวจชนิดข้อมูลอัตโนมัติ (`typeof data[0] === 'object'` → grouped, else flat)

## ฟีเจอร์ที่เคยขอแล้ว "ยกเลิก/rollback" — สำคัญ อย่าทำใหม่โดยไม่ถาม
- **ปุ่ม Sign in (admin/admin) + แก้ไขเนื้อหา/รูปผ่านหน้าเว็บ + auto-push ขึ้น GitHub/Supabase**: ยกเลิกทั้งหมดหลังอธิบายความเสี่ยงด้านความปลอดภัย (เว็บเป็น static site บน GitHub Pages ไม่มี server ตัวเอง) ผู้ใช้เลือกจะแก้ไขเองผ่าน Supabase dashboard หรือขอให้ผมแก้ให้แทน — ถ้าจะทำใหม่ในอนาคตต้องใช้ Supabase Auth จริง + RLS policy + Edge Function เก็บ token ฝั่ง server
- **Zoom/pan บนรูปใน Image Lightbox**: เคยทำ (คลิกเพื่อซูม 2.5x + ลากดูรอบรูป) แล้วผู้ใช้ขอถอดออก เหลือแค่คลิกซ้าย-ขวา/swipe เพื่อเลื่อนดูรูปถัดไปแบบง่ายๆ
- **Lightbox บน Career Transition Gallery**: เคยมี (คลิกรูปในมาร์คีเปิดเต็มจอ) ผู้ใช้ขอถอดออกทั้งหมด แทนที่ด้วย drag-to-pan — ห้ามเพิ่มกลับมาโดยไม่ถาม
- **Skills แบ่งเป็น 14 หมวดย่อย (หมวดละ ≤6 รายการ)**: เคยทำเพื่อให้แต่ละหมวดพอดี 1 แถวบน desktop grid แล้วผู้ใช้ขอ rollback กลับมาเป็นหมวดเดิม (ตอนนี้คือ 6 หมวด รวม Management ที่เพิ่มมาใหม่) เพราะรู้สึกว่าหมวดเยอะเกินไป — ใช้ mobile pagination แทนถ้าต้องการลดความยาวต่อหมวด
- **Badge ระดับความชำนาญแยกสีตามระดับ** (เขียว/ส้ม/เทา): ผู้ใช้ขอให้เป็นสีเขียวทั้งหมดทุกระดับแทน — ห้ามเปลี่ยนกลับไปแยกสีโดยไม่ถาม

## สิ่งที่ยังเป็น Placeholder / ควรแก้ก่อน publish จริง
- Social links (GitHub, LinkedIn) ยังเป็น URL ตัวอย่าง
- Personal Details ใน About Me ส่วนใหญ่ยังเป็น mock data (Full Name และ Email เป็นของจริงอยู่แล้ว)
- **Projects ในฐานข้อมูล Supabase ยังเป็น mock/ตัวอย่าง** ไม่ใช่ของจริงของผู้ใช้ (Education/Experience/Skills เป็นข้อมูลจริงแล้วทั้งหมด)
- Projects modal gallery: 3 จาก 6 โปรเจกต์ยังไม่มีรูปจริง (ใช้ placeholder จาก `photos/Gallery/s*` ซ้ำกัน หรือว่างเปล่า)
- Skills บางรายการยังไม่มีไอคอนจริง (แสดงเป็น text-monogram แทน) — รอผู้ใช้ส่งไฟล์ไอคอนเพิ่ม
- Skills บางรายการที่ผู้ใช้ไม่ได้ระบุระดับความชำนาญมา ผมเดาให้แบบสมเหตุสมผลจาก context งานจริง (Face Access, Scanner, Rack Server, Monitor, IT Asset Management, Stock Card, Device Equipment, Expired Asset ล้วนเป็น Intermediate ยกเว้น Monitor และ IT Asset Management เป็น Advanced) — **ผู้ใช้ยังไม่ได้ confirm ตัวเลขพวกนี้ 100%** ถ้าคุยเรื่อง Skills ต่อควรถามยืนยันอีกที
- ปุ่ม Download CV ลิงก์ไปไฟล์จริงแล้ว (`assets/Pattarapong_Tensuna_CV.pdf.pdf`)

## วิธีใช้ต่อในแชทใหม่
เปิดไฟล์นี้แนบไปพร้อมกับไฟล์ `D:\Project_port\index.html` (หรือบอกพาธ) แล้วอธิบายว่าต้องการแก้ไข/เพิ่มอะไรต่อ ระบบจะเข้าใจ context ของโปรเจกต์ทั้งหมดจากไฟล์นี้

**อัปเดตล่าสุดหลังจาก** (2026-07-25): ขยาย Career Transition Gallery เป็น 15 รูป + เพิ่ม momentum/inertia ตอนลากแล้วปล่อย + แก้บั๊ก hover-scale ถูก clip (ย้าย `overflow-x:hidden` จาก section ไปที่ `<html>`) + ถอด lightbox ออกจาก gallery ทั้งหมด, ปรับปรุง Skills section ใหญ่: เติมไอคอนจริงเกือบทั้งหมด, ลองจัด 14 หมวดแล้ว rollback กลับ 5+1 หมวด (Networking/Server & Monitoring Center/Hardware/OS & Software/CCTV/Management รวม 60 รายการ), ถอดกรอบการ์ดออก, ทำ badge ระดับเป็นสีเขียวทั้งหมด, ทำ mobile pagination แบบ swipe ทีละ 4 รายการ, เรียงลำดับหมวดใหม่ตามที่ผู้ใช้ต้องการ
