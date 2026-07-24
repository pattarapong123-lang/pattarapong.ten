# Project Summary — Pattarapong Tensuna Portfolio Website

## ภาพรวมโปรเจกต์
เว็บไซต์พอร์ตโฟลิโอแบบไฟล์เดียว (`index.html`) สำหรับ Pattarapong Tensuna ตำแหน่ง IT Support / IT Officer / Helpdesk / IT Administrator
- **Tech stack**: HTML + Tailwind CSS (CDN) + Vanilla JavaScript + Supabase JS client (CDN) — **เชื่อมต่อ Supabase จริงแล้ว** (ดูหัวข้อ "Supabase Integration" ด้านล่าง)
- **Hosting**: GitHub Pages (static) — โค้ด `index.html` + asset ทั้งหมดอยู่ใน repo เดียวกับที่ push อัตโนมัติผ่าน git
- **GitHub repo**: https://github.com/pattarapong123-lang/pattarapong.ten (branch `main`)
- **โครงสร้างไฟล์**:
  - `D:\Project_port\index.html` — เว็บไซต์ทั้งหมด (section เดียว ไม่มีหน้า Contact แยก)
  - `D:\Project_port\assets\Pattarapong_Tensuna_CV.pdf.pdf` — ไฟล์ CV จริงของผู้ใช้ (ปุ่ม Download CV ลิงก์ไปที่นี่)
  - `D:\Project_port\photos\p1.png` — รูปโปรไฟล์ hero section (วงกลม)
  - `D:\Project_port\photos\a1.jpg` — รูปโปรไฟล์เต็มตัวที่ใช้ใน About Me section
  - `D:\Project_port\photos\s1.jpeg` – `s6.jpeg` — รูปภาพสภาพแวดล้อมงาน/โครงสร้างพื้นฐาน (ใช้ทั้งใน Career Transition Gallery และเป็น placeholder ใน Projects modal gallery)
  - ปัจจุบันมีรูปทั้งหมด ~10 รูปใน `photos/` (ผู้ใช้ตั้งใจจะมีรวม ~50 รูป — ยังไม่ได้เพิ่มเข้ามา)

## ลำดับ Section บนหน้าเว็บ (บนลงล่าง)
1. **Navigation** — fixed navbar, smooth scroll, dark/light toggle (persist ผ่าน localStorage), hamburger menu บนมือถือ. เมนู Journey / Skills / Projects / About **และปุ่ม theme toggle ถูกจัดกลุ่มชิดขวาสุดของ navbar ทั้งหมด** (ไม่ใช่ justify-between แบบเดิมที่กระจายซ้าย-กลาง-ขวา)
2. **Hero (`#home`)** — 2 คอลัมน์: ซ้ายเป็นชื่อตัวพิมพ์ใหญ่, "Hi, my name is" + typing effect หมุนตำแหน่งงาน (สีส้ม), badge "Available for Work" (สีเขียว emerald — **ไม่ใช่สีส้ม** แม้จะดูคล้ายกันในบางภาพ), ปุ่ม "My Projects" (สีส้ม, ลิงก์ `#projects`) + Download CV, social links (GitHub/LinkedIn/Email — ยังเป็น placeholder URL); ขวาเป็นรูปโปรไฟล์วงกลมพร้อม glow animation แบบ breathing **สีฟ้า (blue) เหมือนเดิม** (เคยลองเปลี่ยนเป็นส้มแล้วผู้ใช้ให้เปลี่ยนกลับ)
3. **Career Transition Gallery (`#gallery`)** — marquee เลื่อนภาพแนวนอนแบบ infinite loop หยุดเมื่อ hover
4. **My Journey (`#journey`)** — timeline แบบ tab สลับ Education/Work Experience:
   - **Default tab เปลี่ยนจาก Education เป็น Work Experience แล้ว**
   - Timeline node (วงกลมไอคอนกลาง) เป็น**สีฟ้า (accent-600/500)** เหมือนเดิม (เคยลองเปลี่ยนเป็นส้มแล้วผู้ใช้ให้เปลี่ยนกลับ) ขนาดไอคอนภายในปรับหลายรอบ ปัจจุบันอยู่ที่ `w-4 h-4`
   - ไอคอนชุด Education ถูกเปลี่ยนให้สอดคล้องกับระดับการศึกษาจริงมากขึ้น: graduation cap → university/institution building → certificate/achievement badge → book (แทนที่ laptop/code-brackets เดิมที่ไม่เกี่ยวกับการศึกษา)
   - ระยะห่างระหว่างการ์อดในไทม์ไลน์ลดลง (`mb-4`, `gap-6` แทน `mb-10`/`gap-8`) ให้การ์ดอยู่ใกล้ node มากขึ้น
   - **การ์ดในแท็บ Work Experience เท่านั้น** ตอนนี้กดได้ (cursor-pointer + hover lift + เงา) กดแล้วขยาย panel แสดง "Key Responsibilities" (ปัจจุบันเป็น placeholder text ยังไม่ใช่ข้อมูลจริง) พร้อมตัวบ่งชี้ "More/Less" มุมขวาล่างพร้อมลูกศร chevron หมุนตอนขยาย — แท็บ Education ไม่มีพฤติกรรมนี้
5. **Skills (`#skills`)** — filter tabs ตามหมวด (Helpdesk & Support / OS & Software / Networking & Infrastructure / Hardware / IT Administration / Security & Compliance), active tab สีส้ม, badge ระดับความชำนาญ (Advanced=เขียว, Intermediate=ส้ม, Basic=เทา)
6. **Projects (`#projects`)** — filter tabs พร้อมตัวนับ (All / Infrastructure / Process / Networking / Administration / Security / Tools)
   - การ์ดโปรเจกต์: cover เป็น placeholder icon (emoji), badge หมวดหมู่, badge "Featured" ถ้ามี, title, description
   - **แท็กเทคโนโลยี (tag pill) ถูกลบออกจากหน้าการ์ดแล้ว** (ยังเก็บข้อมูล tags ไว้ใน DB/mock data แต่ไปแสดงใน modal แทน)
   - **การ์ดทุกใบกดได้แล้ว** — กดแล้วเปิด modal แสดงรายละเอียดเต็ม: รูปภาพแกลเลอรี (พร้อมปุ่ม prev/next และแถบ thumbnail ถ้ามีมากกว่า 1 รูป), category, badge Featured, title, description เต็ม, และ tag pill ทั้งหมด — ถ้าโปรเจกต์ไม่มีรูป จะ fallback แสดง icon เดิมแทน
   - ข้อมูลรูปภาพอยู่ในคอลัมน์ใหม่ `projects.images` (jsonb array) — ตอนนี้มีรูป placeholder (ใช้ `photos/s1–s6.jpeg` ซ้ำ) ให้ 3 จาก 6 โปรเจกต์ (Office-wide Hardware Rollout, Helpdesk Ticketing Optimization, Wi-Fi Infrastructure Upgrade) ส่วนอีก 3 โปรเจกต์ยังไม่มีรูป (images ว่าง)
7. **About Me (`#about`)** — bio + "Personal Details" (ข้อมูลส่วนตัวส่วนใหญ่ยังเป็น mock) + รูปโปรไฟล์เต็มตัว `photos/a1.jpg`
8. **Footer** — ลิงก์ด่วน (Skills / Projects / About), social, ปีลิขสิทธิ์อัตโนมัติ

## หน้าเว็บโหลดครั้งแรก
- บังคับ scroll ไปบนสุด (`window.scrollTo(0,0)` + `history.scrollRestoration = 'manual'`) ทุกครั้งที่โหลดหน้าใหม่ ไม่ว่า URL จะมี hash หรือเบราว์เซอร์จะจำตำแหน่ง scroll เดิมไว้ก็ตาม

## Design System หลัก
- **Blue accent** (`accent-50`–`accent-900` ใน tailwind.config, ค่าเดียวกับ Tailwind `blue`): ใช้กับโลโก้ navbar, nav-link hover, ปุ่ม Download CV border, **hero photo glow, timeline node วงกลม, date badge ในไทม์ไลน์**
- **Orange**: สีเน้นหลักของหัวข้อ section, eyebrow label, active filter tab (Skills/Projects/Journey), ปุ่ม Hero "My Projects", "Hi, my name is" + role ที่พิมพ์หมุน, "More/Less" indicator ใน Journey, ปุ่ม hover border ของการ์ด Projects
- Badge "Available for Work" เป็นสีเขียว (emerald) — ไม่ใช่ส้มหรือฟ้า
- **Font**: Inter (เนื้อหาทั่วไป), JetBrains Mono (โค้ด/แท็ก/ตัวเลข)
- **Dark/Light mode**: Tailwind `darkMode: 'class'`, persist ผ่าน localStorage, default ตาม `prefers-color-scheme`
- **Animation**: scroll-reveal (IntersectionObserver + `.reveal`), typing effect, glow pulse, marquee infinite scroll, tab fade transition, grid-rows expand/collapse (Work Experience card detail), modal fade-in

## Supabase Integration (เชื่อมต่อจริงแล้ว)
- Project: `pattarapong123-lang's Project` (ref `aftnbucohvfmhmxvsmjh`, region ap-northeast-1)
- `SUPABASE_URL` / `SUPABASE_ANON_KEY` ใน `index.html` เป็นค่าจริงแล้ว (ไม่ใช่ placeholder อีกต่อไป)
- ตาราง (ทั้งหมดเปิด RLS พร้อม policy "public can read" — อ่านได้ทุกคน แต่**ไม่มีใครเขียน/แก้ผ่านหน้าเว็บได้** เพราะไม่มี policy insert/update/delete):
  - `education` — id, sort_order, date, title, subtitle, org, description, created_at
  - `experience` — โครงสร้างเดียวกับ education
  - `projects` — id, sort_order, title, category, featured, icon, description, tags (jsonb), **images (jsonb, เพิ่มใหม่)**, created_at
  - `skills` — id, sort_order, category, icon, items (jsonb: `[{name, level}]`), created_at (ตารางเดิมที่มีอยู่ก่อน ถูก drop แล้วสร้างใหม่ให้ตรงกับโค้ด เพราะของเดิมว่างอยู่แล้ว)
- โค้ด `loadTable()` ดึงข้อมูลเรียงตาม `sort_order`, map `description` → `desc` ให้ตรงกับ field ที่ตัว render ใช้, และ fallback ไปใช้ `MOCK_DATA` ในไฟล์ถ้า fetch ล้มเหลวหรือตารางว่าง
- **ข้อมูลในตารางตอนนี้เป็น mock/placeholder เดียวกับที่ hardcode ไว้ในไฟล์** (Bachelor of Science ที่ Example University, Dohome public company limited ฯลฯ) — **ยังไม่ใช่ประวัติการศึกษา/ประสบการณ์จริงของผู้ใช้** (เช่น Vocational Certificate, Rajamangala University ที่เคยเห็นในภาพหน้าจอที่ผู้ใช้ส่งมาก่อนหน้านี้ ยังไม่ถูกใส่เข้าไป) — รอผู้ใช้ยืนยันแล้วจะอัปเดตตรงในฐานข้อมูลได้เลยโดยไม่ต้องแก้โค้ด

## ฟีเจอร์ที่เคยขอแล้ว "ยกเลิก" — สำคัญ อย่าทำใหม่โดยไม่ถาม
- **ปุ่ม Sign in (admin/admin) + แก้ไขเนื้อหา/รูปผ่านหน้าเว็บ + auto-push ขึ้น GitHub/Supabase**: ผู้ใช้ขอมาแล้วแต่ **ยกเลิกทั้งหมด** หลังจากอธิบายความเสี่ยงด้านความปลอดภัย เพราะเว็บนี้เป็น static site (GitHub Pages, ไม่มี server ของตัวเอง):
  - เช็ค admin/admin ฝั่ง JS ล้วนๆ ไม่ใช่การรักษาความปลอดภัยจริง (ใครก็ bypass ได้ผ่าน DevTools)
  - ถ้าเปิดสิทธิ์ให้ anon key เขียนข้อมูลได้เพื่อรองรับปุ่มแก้ไข จะทำให้ใครก็เขียน/ลบข้อมูลเว็บได้โดยไม่ต้อง login
  - Auto-push ขึ้น GitHub จากหน้าเว็บ static ต้องมี GitHub token ฝังในโค้ด ซึ่งใครก็ขโมยไปยึด repo ได้
  - ผู้ใช้ตัดสินใจ: จะแก้ไขเนื้อหาเองโดยตรง (ผ่าน Supabase dashboard หรือขอให้ผมแก้ให้ทีหลัง) แทน
  - ถ้าจะทำ feature นี้ใหม่ในอนาคต แนวทางที่ปลอดภัยกว่าคือ Supabase Auth จริง + RLS policy จำกัดเฉพาะ user ที่ authenticated เป็น admin + ใช้ Supabase Edge Function เป็นตัวกลางเก็บ GitHub token ไว้ฝั่ง server (ไม่ใช่ฝังในหน้าเว็บ)
  - **สิ่งที่ยังคงอยู่จาก feature นี้**: เฉพาะส่วน modal ดูรายละเอียด+รูปเพิ่มของ Projects (ข้อ 2 ที่ไม่เกี่ยวกับ admin) — ดูหัวข้อ Projects ด้านบน

## สิ่งที่ยังเป็น Placeholder / ควรแก้ก่อน publish จริง
- Social links (GitHub, LinkedIn) ยังเป็น URL ตัวอย่าง
- Personal Details ใน About Me ส่วนใหญ่ยังเป็น mock data (Full Name และ Email เป็นของจริงอยู่แล้ว)
- ข้อมูล Education / Experience / Projects / Skills ในฐานข้อมูล Supabase ยังเป็น mock/ตัวอย่าง ไม่ใช่ของจริงของผู้ใช้
- Projects modal gallery: 3 จาก 6 โปรเจกต์ยังไม่มีรูปจริง (ใช้ placeholder จาก photos/s*.jpeg ซ้ำกัน หรือว่างเปล่า)
- "Key Responsibilities" ที่ขยายในการ์ด Work Experience เป็น placeholder text ทั้งหมด ยังไม่ใช่หน้าที่ความรับผิดชอบจริงต่อรายตำแหน่งงาน
- ปุ่ม Download CV ลิงก์ไปไฟล์จริงแล้ว (`assets/Pattarapong_Tensuna_CV.pdf.pdf`)
- โฟลเดอร์ `photos/` มีรูปแค่ ~10 รูป ผู้ใช้ตั้งใจจะมีรวม ~50 รูป — ยังไม่ได้เพิ่มเข้ามา

## วิธีใช้ต่อในแชทใหม่
เปิดไฟล์นี้แนบไปพร้อมกับไฟล์ `D:\Project_port\index.html` (หรือบอกพาธ) แล้วอธิบายว่าต้องการแก้ไข/เพิ่มอะไรต่อ ระบบจะเข้าใจ context ของโปรเจกต์ทั้งหมดจากไฟล์นี้ — อัปเดตล่าสุดหลังจาก: เชื่อมต่อ Supabase จริง (education/experience/skills/projects), push ขึ้น GitHub (`pattarapong123-lang/pattarapong.ten`), เพิ่ม modal รายละเอียด+แกลเลอรีรูปใน Projects, จัดเมนู navbar ชิดขวา, บังคับ scroll-to-top ตอนโหลดหน้า, ปรับ default tab ของ Journey เป็น Work Experience, ปรับไอคอน/ระยะห่าง/สีของ timeline node หลายรอบ, และยกเลิกฟีเจอร์ admin login + auto-publish ตามคำขอผู้ใช้
