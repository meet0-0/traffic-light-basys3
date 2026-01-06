# 🚦 Traffic Light Controller with Pedestrian Crossing (Basys 3)

## 📌 Overview
This project implements a **real-world traffic light controller with pedestrian crossing support** using **VHDL** on the **Basys 3 FPGA (Artix-7)**.

A finite state machine (FSM) controls vehicle traffic lights, while a pedestrian push button (BTNU) allows safe pedestrian crossing. The design correctly handles real hardware constraints such as button bounce, clock-domain crossing, and FPGA I/O standards.

---

## 🎯 Features
- Traffic light FSM: Green → Yellow → Red
- Pedestrian crossing request using BTNU
- Accurate timing using a 100 MHz → 1 Hz clock divider
- LED indicators:
  - **LD0** – Green
  - **LD1** – Yellow
  - **LD2** – Red
  - **LD3** – Pedestrian indicator
- Pedestrian LED behavior:
  - Turns ON immediately when requested
  - Blinks during pedestrian crossing
- Countdown timer on the 7-segment display

---

## 🧠 Design Architecture

### Clock Domains
| Clock | Purpose |
|-----|--------|
| 100 MHz | Button debouncing and request latching |
| 1 Hz | FSM timing, LED control, pedestrian blinking |

---

## 🔄 FSM Behavior

### Normal Operation
GREEN (LD0)
→ YELLOW (LD1)
→ RED (LD2)
→ GREEN


### Pedestrian Request Flow
1. User presses **BTNU**.
2. Pedestrian request is latched
3. System finishes current traffic cycle
4. At RED:
   - Red light remains ON
   - Pedestrian LED (LD3) blinks
5. Near timeout:
   - Pedestrian LED blinks faster
6. System returns to GREEN

---

## 🛠️ Hardware Mapping (Basys 3)

| Signal | Board Pin | Description |
|------|----------|-------------|
| clk100MHz | W5 | 100 MHz system clock |
| reset | U18 | Reset button |
| ped_btn | T18 | Pedestrian request (BTNU) |
| LD0 | U16 | Green |
| LD1 | E19 | Yellow |
| LD2 | U19 | Red |
| LD3 | V19 | Pedestrian LED |

All I/O pins use **LVCMOS33** i.e. 3.3V to avoid bank voltage conflicts.

---

## 🧪 Simulation
A dedicated VHDL testbench (`top_tb.vhd`) verifies:
- FSM transitions
- Pedestrian request handling
- LED blinking behavior
- Countdown timing

---

## 🧩 Engineering Challenges Solved
- Reliable handling of momentary push-button inputs
- Clock-domain crossing between fast and slow logic
- Event latching to prevent missed requests
- Safe FPGA I/O constraint management
- FSM-based real-time control design

---

## 🧠 Skills Demonstrated
- VHDL (RTL design)
- Finite State Machines (FSM)
- FPGA clocking and timing
- Button debouncing
- Simulation and debugging

---

## 🚀 Future Improvements
- Walk / Don’t-Walk indicators
- Configurable timing via switches
- Emergency vehicle override
- Multi-intersection support

Thank you and Have a Good Day :)
