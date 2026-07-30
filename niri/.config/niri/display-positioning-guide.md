# Niri Output Positioning Cheatsheet

## Get Logical Sizes

```bash
niri msg outputs
```

Look for `Logical size: WxH` on each output.

## Logical Size Formula

```
logical_size = round(physical_size / scale)
```

Example: 3840×2160 at scale 1.66 → `round(3840/1.66) × round(2160/1.66)` = 2313 × 1301

## Positioning Formulas

All positions are in **logical (scaled) pixels**.

| You want to place your monitor… | Position formula |
|---|---|
| Right of monitor A | `x = A_logical_width` |
| Left of monitor A | `x = -your_logical_width` |
| Below monitor A | `y = A_logical_height` |
| Above monitor A | `y = -your_logical_height` |
| Vertically centered against A | `y = (A_logical_height - your_logical_height) / 2` |
| Horizontally centered against A | `x = (A_logical_width - your_logical_width) / 2` |

## Common Pitfall

If you change any output's **scale**, its logical dimensions change. Old position values (calculated for the previous scale) will be wrong — always recalculate.

## Quick Example

```
eDP-1: 1920×1200 @ scale 1.33 → logical 1440×900,  position (0, 0)
DP-2:  3840×2160 @ scale 1.66 → logical 2313×1301, position (?, ?)

Place DP-2 to the right of eDP-1, center-aligned vertically:
  x = 1440          (eDP-1 logical width)
  y = (900 - 1301) / 2 = -200   (center-aligned)
```