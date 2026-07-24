# Project Summary — Pattarapong Tensuna Portfolio Website

## ภาพรวมโปรเจกต์
เว็บไซต์พอร์ตโฟลิโอแบบไฟล์เดียว (`index.html`) สำหรับ Pattarapong Tensuna ตำแหน่ง IT Support / IT Officer / Helpdesk / IT Administrator
- **Tech stack**: HTML + Tailwind CSS (CDN) + Vanilla JavaScript + Supabase JS client (CDN, พร้อม fallback เป็น mock data ถ้ายังไม่ตั้งค่า Supabase)
- **โครงสร้างไฟล์**:
  - `D:\Project_port\index.html` — เว็บไซต์ทั้งหมด (มี section เดียวไม่มีหน้า Contact แยกแล้ว — ดูหัวข้อ "การเปลี่ยนแปลงล่าสุด" ด้านล่าง)
  - `D:\Project_port\assets\Pattarapong_Tensuna_CV.pdf.pdf` — ไฟล์ CV จริงของผู้ใช้ (ปุ่ม Download CV ลิงก์ไปที่นี่)
  - `D:\Project_port\photos\p1.png` — รูปโปรไฟล์ hero section (วงกลม)
  - `D:\Project_port\photos\a1.jpg` — รูปโปรไฟล์เต็มตัวที่ใช้ใน About Me section (แทนที่การ์ดสถิติ 4 อันเดิม)
  - `D:\Project_port\photos\s1.jpeg` – `s6.jpeg` — รูปภาพสภาพแวดล้อมงาน/โครงสร้างพื้นฐาน (ใช้ใน Career Transition Gallery)

## ลำดับ Section บนหน้าเว็บ (บนลงล่าง) — ปัจจุบัน
1. **Navigation** — fixed navbar, smooth scroll, dark/light toggle (persist ผ่าน localStorage), hamburger menu บนมือถือ. เมนู: Journey / Skills / Projects / About (**ไม่มี Contact แล้ว** — ถูกลบออกทั้ง section)
2. **Hero (`#home`)** — เลย์เอาต์ 2 คอลัมน์: ซ้ายเป็นชื่อ (ตัวพิมพ์ใหญ่ทั้งหมด), "Hi, my name is" กับ typing effect หมุนตำแหน่งงาน เป็น**สีส้ม**แล้ว (เดิมเป็นสีฟ้า), badge "Available for Work" (สีเขียว emerald), ปุ่ม **"My Projects"** (เดิมชื่อ "Contact Me" เปลี่ยนข้อความ+ลิงก์ไป `#projects` แล้ว, สีพื้นหลังเป็น**สีส้ม** `bg-orange-500` เดิมเป็นสีฟ้า) + ปุ่ม Download CV, social links (GitHub/LinkedIn/Email — ยังเป็น placeholder URL); ขวาเป็นรูปโปรไฟล์วงกลมพร้อม glow animation แบบ breathing
3. **Career Transition Gallery (`#gallery`)** — หัวข้อ "Career Transition **Gallery**" (Gallery สีส้ม) พร้อม marquee เลื่อนภาพแนวนอนแบบ infinite loop หยุดเมื่อ hover การ์ดมีกรอบสีฟ้า
4. **My Journey (`#journey`)** — timeline แบบ tab สลับ Education/Work Experience:
   - หัวข้อ "My **Journey**" (Journey สีส้ม) + subtitle, tab ปุ่ม active สีส้ม / inactive สีเทาเข้ม มีไอคอนในปุ่ม
   - Timeline zigzag ซ้าย-ขวา เชื่อมด้วยเส้นกลาง ไอคอนวงกลมสีฟ้า glow เฉพาะของแต่ละรายการ
   - การ์ด: badge วันที่พื้นสีฟ้าทึบ + ไอคอนปฏิทิน, title ตัวหนาสีขาว, subtitle สีส้ม, description สีเทาอ่อน
   - Default tab = Education
5. **Skills (`#skills`)** — รีดีไซน์ใหม่ทั้งหมด (ไม่ใช่การ์ดหมวดหมู่แบบเดิมแล้ว):
   - หัวข้อ "My **Skills**" (Skills **สีส้ม** — เดิมสีฟ้า) กึ่งกลางหน้า + subtitle + eyebrow "02. Skills" (สีส้ม)
   - **Filter tabs แบบเดียวกับ Journey**: Helpdesk & Support / OS & Software / Networking & Infrastructure / Hardware / IT Administration / Security & Compliance — active tab **สีส้ม** (เดิมสีฟ้า)
   - แต่ละ tab แสดงการ์ด skill ย่อย (ไอคอนวงกลม + ชื่อ skill + badge ระดับความชำนาญ: Advanced=เขียว, Intermediate=ส้ม, Basic=เทา)
   - ข้อมูลอยู่ใน `MOCK_DATA.skills` ในไฟล์ (category → items[] พร้อม level ต่อ item), render ผ่าน `renderSkillTabs()` / `renderSkillGrid()` ใน JS
6. **Projects (`#projects`)** — รีดีไซน์ใหม่ทั้งหมด:
   - หัวข้อ "My **Projects**" (Projects **สีส้ม**) กึ่งกลางหน้า + subtitle + eyebrow "03. Projects" (สีส้ม)
   - **Filter tabs พร้อมตัวนับ**: All / Infrastructure / Process / Networking / Administration / Security / Tools (นับจำนวนโปรเจกต์ในแต่ละหมวดอัตโนมัติ)
   - การ์ดโปรเจกต์: cover เป็น placeholder icon (emoji) แทนรูปจริง (ยังไม่มีภาพสกรีนช็อตโปรเจกต์), badge หมวดหมู่มุมขวาบน, badge "Featured" (สีเหลือง/amber) ถ้ามี, title, description, tag ทักษะ (สีส้มเข้ากับธีม)
   - ข้อมูลอยู่ใน `MOCK_DATA.projects` (title, category, featured, icon, desc, tags[]), render ผ่าน `renderProjectTabs()` / `renderProjectGrid()`
7. **About Me (`#about`)** — รีดีไซน์หลายรอบ ปัจจุบันเป็นดังนี้:
   - หัวข้อ "About **Me**" (Me สีส้ม) **จัดกึ่งกลางหน้า** เหมือน Journey/Projects (เดิมชิดซ้าย) + subtitle, **ไม่มี eyebrow label "04. About Me" แล้ว** (ถูกลบออก)
   - เลย์เอาต์ 2 คอลัมน์: ซ้าย (col-span-3) = bio paragraph **สั้นเดียว** (ย่อหน้าที่ 2 และข้อความ placeholder bio note ถูกลบออกแล้ว) ตามด้วย **"Personal Details"** heading + การ์ด 2 คอลัมน์ (Full Name, Age, Date of Birth, Phone Number, Line ID, Email, Address, Nationality, Availability — เป็น mock data ทั้งหมด รอผู้ใช้แก้เป็นข้อมูลจริง)
   - ขวา (col-span-2) = **รูปโปรไฟล์เต็มตัว** `photos/a1.jpg` (แทนที่การ์ดสถิติ "3+ Years / 500+ Tickets / 99% Uptime / 10+ Systems" ที่ถูกลบออกไปแล้ว) จัดตำแหน่งให้ขอบบนตรงกับ "Personal Details" heading
8. **Footer** — ลิงก์ด่วน (Skills / Projects / About — **ไม่มี Contact แล้ว**), social, ปีลิขสิทธิ์อัตโนมัติ

## ⚠️ Section ที่ถูกลบออกไปแล้ว
- **Contact section ทั้งหมดถูกลบ** (form + ข้อมูลติดต่อ Email/Availability/Location) เพราะข้อมูลซ้ำซ้อนกับที่อื่นในหน้า — ลบทั้ง HTML, nav links (desktop/mobile/footer), และ JS handler (`contact-form` submit listener, Supabase `contact_messages` insert logic) ออกหมดแล้ว
- ปุ่ม Hero ที่เคยชื่อ "Contact Me" ลิงก์ไป `#contact` ถูกเปลี่ยนเป็นปุ่ม **"My Projects"** ลิงก์ไป `#projects` แทน

## Design System หลัก (อัปเดตล่าสุด)
- **สีหลักของปุ่ม/ลิงก์ทั่วไป**: ยังคง Blue accent (`accent-50` ถึง `accent-900` ใน tailwind.config) — เช่น โลโก้ navbar, nav-link hover, ปุ่ม Download CV border
- **สีส้ม (Orange) กลายเป็นสีเน้นหลักของหัวข้อ section แล้ว**: ใช้กับคำสำคัญใน heading ("Gallery", "Journey", "Skills", "Projects", "Me"), eyebrow label ("0X. ...", ยกเว้น About ที่ลบ eyebrow ออกแล้ว), active filter tab (Skills/Projects), badge ระดับ Intermediate, tag chip ใน Projects, ปุ่ม Hero "My Projects", ข้อความ "Hi, my name is" และ role ที่พิมพ์หมุนใน Hero
- **หมายเหตุสำคัญ**: badge "Available for Work" ยังเป็น**สีเขียว (emerald)** ไม่ใช่สีส้ม แม้จะดูคล้ายกันในบางภาพที่ผู้ใช้แนบมา — ควรถามผู้ใช้ให้ชัดก่อนถ้ามีคำสั่งเปลี่ยนสี badge นี้อีก
- **Font**: Inter (เนื้อหาทั่วไป), JetBrains Mono (โค้ด/แท็ก/ตัวเลข)
- **Dark/Light mode**: ผ่าน Tailwind `darkMode: 'class'` toggle ปุ่มบน navbar, persist ผ่าน localStorage, default ตาม `prefers-color-scheme`
- **Animation**: scroll-reveal (IntersectionObserver + `.reveal` class), typing effect, glow pulse, marquee infinite scroll, tab fade transition (Journey/Skills/Projects ใช้ pattern เดียวกัน)

## Supabase Integration (ยังไม่ผูกจริง)
- ตัวแปร `SUPABASE_URL` / `SUPABASE_ANON_KEY` เป็น placeholder อยู่ในไฟล์ `index.html` (ค้นหาคำว่า `YOUR_SUPABASE_URL`)
- ถ้าใส่ค่าจริง ระบบจะดึงข้อมูลจากตาราง `education`, `experience`, `skills`, `projects` โดยอัตโนมัติ (ตาราง `contact_messages` ไม่ใช้แล้วเพราะลบ contact form ออก)
- ถ้าไม่ตั้งค่า ระบบจะ fallback ไปใช้ mock data ที่ hardcode ไว้ในไฟล์ (ใช้งานได้ปกติ — เป็นโหมดปัจจุบัน)

## สิ่งที่ยังเป็น Placeholder / ควรแก้ก่อน publish จริง
- Social links (GitHub, LinkedIn) ยังเป็น URL ตัวอย่าง (`https://github.com/`, `https://linkedin.com/`)
- **Personal Details ใน About Me ทั้งหมดเป็น mock data**: Age, Date of Birth, Phone Number, Line ID, Address, Nationality — ต้องแก้เป็นข้อมูลจริง (Full Name และ Email เป็นของจริงอยู่แล้ว)
- ข้อมูล Projects section ยังเป็นตัวอย่าง/ปรับจากงาน IT จริงคร่าวๆ ยังไม่มีภาพสกรีนช็อตจริง (ใช้ icon emoji แทน cover image)
- Supabase ยังไม่ได้เชื่อมต่อจริง (ใช้ mock data)
- ปุ่ม Download CV ลิงก์ไปไฟล์จริงแล้ว (`assets/Pattarapong_Tensuna_CV.pdf.pdf`)

## วิธีใช้ต่อในแชทใหม่
เปิดไฟล์นี้แนบไปพร้อมกับไฟล์ `D:\Project_port\index.html` (หรือบอกพาธ) แล้วอธิบายว่าต้องการแก้ไข/เพิ่มอะไรต่อ ระบบจะเข้าใจ context ของโปรเจกต์ทั้งหมดจากไฟล์นี้ — ไฟล์นี้อัปเดตล่าสุดหลังจาก: รีดีไซน์ Skills/Projects/About เป็นสีส้ม, ลบ Contact section, เพิ่มรูปโปรไฟล์ใน About, ย้าย Personal Details กลับไปอยู่คอลัมน์ซ้ายข้างรูป
