# Liquid Crystal Display (LCD)

## Introduction

An LCD (Liquid Crystal Display) is a thin, flat electronic screen that uses liquid crystals and a backlight to show images, text, and videos. It is widely used in digital watches, calculators, computer monitors, televisions, and smartphones.

An LCD works by using a backlight and tiny rod-shaped molecules called liquid crystals that twist or straighten out when electricity is applied, acting as a gate to block or let light through.

### Main Parts of an LCD

* Backlight: A bright light source (usually LEDs) at the back that shines white light forward.
* Polarizing Filters: Two special glass filters placed at right angles (perpendicular) to each other. One lets only vertical light waves through, and the other lets only horizontal waves through.
* Liquid Crystal Layer: A special fluid-like material sandwiched between the polarizers that can bend light.
* Color Filters: Tiny red, green, and blue (RGB) filters that mix to create full-color images.

## 16 × 2 LCD

A 16 × 2 LCD is a compact electronic module that shows 16 characters per line across two parallel rows, running typically on a 5V power supply and costing roughly ₹120 to ₹250.

It is widely used in DIY electronics with controllers like Arduino via standard parallel wiring or an I2C adapter.

### Core Technical Specifications

* Display Format: 16 columns by 2 rows (32 total characters)
* Size:
  * Character Grid: 16 characters per line across 2 lines (32 characters total).
  * Matrix per Character: 5 dots wide by 8 dots high (including the cursor line).
  * Total Pixels: 5 × 7 dot matrix for each character block configuration totall ing1,280 individual pixels across the entire screen with 5 × 7 × 16 = 560 pixels in the top and bottom rows separated by a gap of 5 × 16 × 2 = 160 pixels between the rows or 1,280 dots (32 characters × 40 dots per character block)
* Operating Voltage: 4.7V to 5.3V
* Backlight Options: Blue, green, or yellow-green LED
* Controller Chip: Typically uses a [Hitachi HD44780](https://en.wikipedia.org/wiki/HD44780_(integrated_circuit)) or compatible driver to control the dots via 4-bit or 8-bit parallel or I2C interfaces.
* Communication Modes: 4-bit, 8-bit parallel, or I2C bus
* Pin Configuration & Interfacing
* Standard 16-Pin Layout: Includes power pins (VCC, GND), contrast adjustment (V0), control lines (RS, RW, E), and 8 data lines (D0–D7) plus backlight pins.
* I2C Alternative: Reduces the required micro-controller pins down to just four (VCC, GND, SDA, SCL) using a pre-soldered backpack module.
* Programming Support: Fully compatible with standard microcontrollers through built-in libraries.
