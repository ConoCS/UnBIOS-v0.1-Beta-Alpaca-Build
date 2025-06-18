# UnBIOS v0.1 Beta | Alpaca RETRO Build 🦙

---

## 🔧 What Is This Project?

I'm working on a custom 16-bit BIOS. Just for fun... at first.  
But when I take “just for fun” seriously, who knows? It might turn into something big, right?

This is the **Alpaca Build** of UnBIOS: a passion project combining pure Assembly and a stubborn desire to understand how low-level systems tick.

---

## 🦙 Why Alpaca?

Because I like alpacas. That’s it. No deeper lore (yet).

---

## 🧠 What Language Is This BIOS Written In?

This project is written in **100% pure x86 Assembly (16-bit)**.

In the future, I might move toward **C or C with inline Assembly**, especially if I go 32-bit or 64-bit.  
For now, everything's hand-crafted from scratch.

---

## 💻 Why `ORG 0x7C00` and `dw 0xAA55`?

Because I’m currently building and testing a traditional boot sector (MBR-style).  
Most BIOSes expect boot code to load at `0x7C00` and check for the `0xAA55` boot signature at the end.

I use **QEMU** for testing (yes, I’m pampered 🍼), but I’d love it if someone tried this on real hardware or stricter emulators that don't auto-fix segment registers. Your feedback = 💎.

---

## 🌟 What Will UnBIOS Look Like in the Future?

There might be two different versions:

UnBIOS v1.0 | RETRO Build

UnBIOS v2.0 - v.60 | UEFI BIOS Build

Each version will be tailored to ensure compatibility with both old and modern hardware.
The goal is to make UnBIOS flexible and accessible to everyone — from retro enthusiasts to modern-day users, young and old alike.

---

## 🚀 When Will the UEFI Version of UnBIOS Be Released?

Development will run in parallel with the ongoing UnBIOS v0.1 BETA - Alpaca RETRO Build.
While I’m working on the 16-bit BIOS (which is the most fun part 😄), I’ll also be developing a 64-bit UEFI-compatible version — to support modern machines that require UEFI booting.

> Note: The UEFI build may also include CSM (Compatibility Support Module) for those who want to run legacy OSes freely.

---

# How to Compile with NASM
1. Fork or download the source code.

2. Use NASM to compile the .asm file. (Note: The ASM file does not use %include yet.)

3. Compile it into a .img or .bin file. Then run it using an emulator like BOCHS or QEMU (but testing on real hardware is highly recommended to verify if the code actually works).

4. Run it, and feel free to give feedback or submit a pull request to help this project grow!
   
## **Btw. I'm Assembly beginner :). Sorry if my code looks noobis**

## 📜 License – GNU General Public License v3.0

This project is licensed under the [GNU GPL v3.0](https://www.gnu.org/licenses/gpl-3.0.html).

You are free to:
- Copy, distribute, and modify the software.
- As long as you track changes/dates in the source files.
- All modified versions must remain open-source under the same license.

---

© 2025 ConoCs  
Project maintained by a sleep-deprived alpaca enthusiast. 🧠💻🦙
