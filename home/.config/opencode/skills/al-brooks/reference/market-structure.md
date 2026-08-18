# Market Structure

Brooks reads structure top-down: the market phase, then swing points, then
legs, then bars. This file covers phase classification, the always-in concept,
trends, trading ranges, breakouts, and measured moves.

## Market phase

At any time the market is in one of three states, plus two transitions:

| State | Signature |
|---|---|
| **Bull trend** | Sequence of higher highs and higher lows (HH, HL). Pullbacks are small (1-5 bars) and do not overlap the prior swing low. Most bars close near their highs. |
| **Bear trend** | Sequence of lower highs and lower lows (LH, LL). Pullbacks are small and do not overlap the prior swing high. Most bars close near their lows. |
| **Trading range** | Overlapping bars, roughly equal swing highs and lows, no net directional progress. Buyers and sellers in balance. |
| **Breakout** (transition) | A strong trend bar (or bar cluster) closes beyond a range extreme or a major swing point, starting a new trend. |
| **Reversal** (transition) | The current trend fails (a breakout fails, or a reversal bar forms at a key level) and price transitions to the opposite trend or back to a range. |

Determining phase:

1. Find the swing highs and swing lows (local extrema on the chart).
2. Ask: are the swings forming a clear sequence in one direction with small,
   non-overlapping pullbacks? That is a trend.
3. If swings alternate direction without net progress, it is a range.
4. If a strong bar is pushing beyond a defined level, it is a breakout - mark
   the transition and watch whether the close holds.

## Always-in

The always-in question: at this bar, if forced to hold a position until the
next meaningful swing point, would you be long or short?

- **Always-in long** - the market is in a bull trend or bull breakout; most
  bars are bull trend bars; pullbacks are bought.
- **Always-in short** - the market is in a bear trend or bear breakout; most
  bars are bear trend bars; rallies are sold.
- **Always-in flat** - rare; the market is truly directionless (a tight range).

The always-in bias is the reference frame for every setup. A pullback buy is
a bet the always-in direction continues. A reversal or FBO is a bet it flips.

## Trends

A trend is a persistent move in one direction with a sequence of swings in
that direction and smaller pullbacks.

- **Strong trend** - consecutive trend bars in one direction, tiny pullbacks,
  price rarely touches the EMA, breakouts are relentless. Best traded by
  buying pullbacks (bull) or selling rallies (bear).
- **Weak trend** - overlapping bars, deep pullbacks that overlap prior swing
  points, price oscillates around the EMA. More range-like; trade the edges
  rather than chasing.
- **Trend ending** - the last breakout fails, a climax bar forms (a huge
  trend bar that is too extended), or the trend bars become smaller and
  pullbacks deepen. Signals the transition to a reversal or range.

The two main ways to trade a trend:
- **Buy the pullback (bull)** / **sell the rally (bear)** - enter in the
  direction of the trend on a small pullback. Low risk, high win rate, but
  many small entries as the trend grinds.
- **Trade the breakout** - enter on a strong breakout bar. Fewer, higher
  reward trades, but a higher failure rate (many breakouts fail).

### Pullback counts: High 1/2/3 and Low 1/2/3

Brooks numbers the pullbacks within a single trend leg. The number tells you
where you are in the leg and how to trade it.

In a **bull trend**, pullbacks make lows - they are numbered **L1, L2, L3**:

- **Low 1 (L1)** - the first pullback low after the leg begins. The earliest
  and often the most aggressive buy. In a strong trend, L1 alone can carry
  the whole leg.
- **Low 2 (L2)** - the second pullback low. The most common and reliable buy
  in a strong bull trend; Brooks calls buying L2 in a strong trend a high-
  probability trade.
- **Low 3 (L3)** - the third pullback low. By L3 the trend is getting old;
  the leg is likely near its end. L3 buys are lower quality and often fail,
  and a move beyond L3 usually means the trend is over.

In a **bear trend**, pullbacks are rallies that make highs - numbered
**H1, H2, H3**, mirror-image of the above: sell H1 (aggressive), sell H2
(reliable), sell H3 (late, lower quality).

Counting rules:

- Count only pullbacks that swing **against** the trend within the same leg.
  Each pullback is a swing high (bear) or swing low (bull) that does not end
  the leg.
- The count **resets** when the leg ends: a new trend high/low, a trend
  change, or the start of a new leg. A fresh leg starts counting at H1/L1.
- A bar that continues the trend direction is not a pullback and does not
  advance the count.
- In practice H1/H2 and L1/L2 are the entries worth taking; H3/L3 signals the
  move is exhausting and is a warning to stop adding to the position.

In the labeling schema this is the `pullback_count` field, and the entries are
the `PULLBACK_BUY` / `PULLBACK_SELL` setups (see setups.md).

## Trading ranges

A trading range is a horizontal band of overlapping bars with no net
directional progress.

- Mark the **range high** and **range low** (the major swing points bounding
  the range).
- Trading the range means **buying near the low and selling near the high**
  (fade the extremes) with stops beyond the range.
- A range breakout above the high or below the low starts a new move - but
  most breakouts fail on the first attempt. Wait for a close beyond the range
  and a follow-through bar before treating it as a real breakout.

## Breakouts and failed breakouts

A breakout is a strong bar (or bars) closing beyond a defined level: a range
extreme, a prior swing high/low, a trendline, or a channel.

- **Trading range breakout** - price closes beyond the range high/low. If the
  close holds and the next bar continues, a trend begins.
- **Failed breakout (FBO)** - price closes beyond a level, then immediately
  closes back inside. An FBO at a major level is one of the strongest reversal
  signals in the method. The failure of the breakout tells you the market has
  rejected that direction.
- **Trendline/channel breakout** - a bar closes beyond a trendline or channel
  line. In a mature trend this often signals a trend change or at least a
  deep pullback.

## Measured moves

A measured move projects how far a leg is likely to travel, giving profit
targets and potential reversal zones.

- **Bull measured move** - project the height of the prior up leg up from the
  bottom of the current pullback. The target is that projection; a close
  beyond it is a trend extension, a stall at it is a potential reversal.
- **Bear measured move** - the mirror image projected down.
- **Channel/equidistant move** - a common Brooks pattern: a pullback to the
  channel bottom, then a leg that travels roughly the height of the prior leg
  to the channel top. The equidistant target is a frequent place for a
  reversal.

Measured moves are approximations, not guarantees. They mark likely
profit-taking and reversal zones, not certain outcomes.

## Higher-timeframe context (the frame around the 5m)

Brooks reads the 5m chart through the lens of higher timeframes. The 60m
chart provides the bias; prior-period levels act as magnets that price is
drawn toward and as breakout levels that matter when tested.

### The 60m 20 EMA as the 5m filter

- Compute the 20 EMA on the 60m candles (the "60m 20 EMA").
- When the 5m price is **above** the 60m 20 EMA, the higher-timeframe bias is
  LONG. Pullback buys on the 5m are favored; a pullback that reaches the 60m
  EMA often marks a good 5m buy.
- When the 5m price is **below** the 60m 20 EMA, the bias is SHORT. Rallies
  are sold on the 5m; a rally that reaches the 60m EMA often marks a good 5m
  sell.
- When the 5m price is riding the 60m 20 EMA without a clear side, the bias
  is FLAT.

### Prior-period levels (magnets and breakout levels)

These are calculated from the higher-timeframe data (daily, weekly, monthly,
yearly) and become horizontal levels on the 5m chart:

| Label | Level |
|---|---|
| `PDO` | Previous day open |
| `PDH` | Previous day high |
| `PDL` | Previous day low |
| `PDC` | Previous day close |
| `PWH` | Previous week high |
| `PWL` | Previous week low |
| `PWC` | Previous week close |
| `PMH` | Previous month high |
| `PML` | Previous month low |
| `PMC` | Previous month close |
| `PYH` | Previous year high |
| `PYL` | Previous year low |
| `PYC` | Previous year close |
| `WCLOSE` | This week's close-to-date (an in-progress level) |

How they behave:

- **Magnets:** price is drawn toward these levels, especially the closes
  (`PDC`, `PWC`, `PMC`, `PYC`) and the opens (`PDO`). Expect price to stall,
  reverse, or at least slow when it reaches a close level. A pullback to a
  prior close in the direction of the higher-timeframe bias is a high-quality
  entry zone.
- **Breakout levels:** the highs and lows (`PDH`, `PDL`, `PWH`, `PWL`, ...)
  act as breakout levels. A close beyond them is a breakout; a close beyond
  then back inside is a failed breakout (FBO) and often a reversal.
- **Stacking:** the more prior-period levels cluster in a zone, the stronger
  that zone. For example a previous day close sitting on a previous week high
  is a major level.

When reading the 5m, always state the nearest prior-period level above and
below price. If a bar touches one, that is `levels_hit` in the labeling
schema.

## The 20 EMA on the 5m chart

The 5m 20 EMA is the reference line of the current move.

- In a **strong bull trend**, price rides above the EMA; pullbacks to it are
  buys, and a close below it is a warning (deep pullback or trend change).
- In a **strong bear trend**, price rides below the EMA; rallies to it are
  sells, and a close above it is a warning.
- In a **trading range**, price oscillates across the EMA; it has little
  predictive value beyond marking the middle of the range.
- A **close beyond the EMA** against the trend (bull bar closing above in a
  bear move, or bear bar closing below in a bull move) is the first sign of a
  possible change. Treat it as context, not a setup on its own.

The EMA is a reference, never a signal. It does not create setups; it helps
you read the always-in direction and the quality of pullbacks.
