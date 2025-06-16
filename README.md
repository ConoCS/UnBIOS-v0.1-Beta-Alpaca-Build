# UnBIOS-v0.1-Beta-Alpaca-Build

---
## What project is this?
I'm ambitious about creating a custom 16-bit BIOS. Honestly, this project started just for fun. But when I take "just for fun" seriously, who knows—it might turn into something big, right?

## Alpaca?
I like alpacas :>

## What language is this BIOS written in?
I'm using 100% pure Assembly. However, I’m open to using languages like C in the future (especially for a 64-bit BIOS).

## Why ORG 0x7C00 and dw 0xAA55 everywhere?
Because I’m still testing the ASM routines one by one to make sure they actually work on real machines. I use emulators like QEMU (I'm like a pampered baby, yes 🍼) because I can't get other emulators to work properly.
It would be super helpful if you try running this on a real machine or any emulator that doesn't auto-setup the segment registers. I’d be very grateful to you 🙌🙌🙌

---
License – GNU General Public License v3.0
© 2025 ConoCs

This project is licensed under the terms of the GNU General Public License v3.0.
You may copy, distribute, and modify the software as long as you track changes/dates in source files. Any modifications to or software including (via compiler) GPL-licensed code must also be made available under the GPL with source code.

For full license details, see: https://www.gnu.org/licenses/gpl-3.0.html
