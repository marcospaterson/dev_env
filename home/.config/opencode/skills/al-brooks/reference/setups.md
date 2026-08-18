# Setups

A setup is a specific, repeatable set of conditions that gives a favorable
bet. Every setup is defined by: **phase** (the market state), **structure**
(where it sits), **signal bar** (the trigger), **entry**, **stop**, and
**target**. A setup is a bet on the always-in direction - either that it
continues (trend setups) or that it flips (reversal setups).

The general shape of every trade:

- **Entry** - a limit order at a level, or a stop order on a breakout.
- **Signal bar** - a strong trend bar in the entry direction right before
  entry (see bar-reading.md).
- **Stop** - just beyond the signal bar's extreme (below the low for a buy,
  above the high for a sell), or beyond the swing point.
- **Target** - a measured move, the opposite side of the range, or a prior
  swing point.
- **Risk** - always small relative to the target (roughly 1:2 to 1:3).

## Trend setups

### Pullback buy (bull trend) / pullback sell (bear trend)

Enter in the direction of the trend on a small pullback.

- **Conditions:** clear trend (HH/HL or LH/LL), pullback of 1-5 bars that
  does not break the prior swing point.
- **Signal bar:** a bull trend bar (buy) closing after the pullback stall.
- **Entry:** buy at the pullback low / stop above the pullback.
- **Stop:** below the signal bar low.
- **Target:** prior swing high / measured move.
- **Confidence:** HIGH in a strong trend, MEDIUM in a weak trend.

The **pullback count** picks the exact entry within the leg:

| Count | Trade | Notes |
|---|---|---|
| **L1** (bull) / **H1** (bear) | Aggressive entry on the first pullback | Best in a very strong trend; can carry the whole leg. |
| **L2** (bull) / **H2** (bear) | The classic, most reliable entry | High probability in a strong trend. The benchmark pullback trade. |
| **L3** (bull) / **H3** (bear) | Late, lower-quality entry | Trend is exhausting; often the last push. Prefer to skip or fade. |

### Buy/sell setup with higher-timeframe confirmation

Before marking any trend pullback setup, check the higher-timeframe context
(see market-structure.md):

1. **60m 20 EMA bias** - is the 5m price above (LONG bias) or below (SHORT
   bias) it? Entering with this bias raises confidence.
2. **Prior-period levels** - does the pullback land on a magnet (prior day /
   week / month / year close) or a breakout level (prior high/low)? A pullback
   that lands on a prior-period close in the trend's favor is a high-quality
   entry.
3. **5m 20 EMA** - does the pullback hold at or above the 5m 20 EMA in a bull
   trend (or below in a bear trend)? If price closes beyond it against the
   trend, the setup weakens.

Raise `confidence` by one step (up to HIGH) when all three confirm, lower it
by one when the 60m bias disagrees.

### Breakout buy / breakout sell

Enter on a strong bar that breaks a defined level.

- **Conditions:** a range extreme, swing point, or channel line being tested.
- **Signal bar:** a strong trend bar that closes beyond the level.
- **Entry:** stop order beyond the level.
- **Stop:** just inside the level.
- **Target:** measured move or opposite range edge.
- **Confidence:** MEDIUM - many breakouts fail; the FBO is the counter-trade.

## Range setups

### Range fade buy / range fade sell

Buy near the range low, sell near the range high.

- **Conditions:** a clear trading range with defined high and low; price near
  one edge.
- **Signal bar:** a reversal bar or strong trend bar turning away from the
  edge.
- **Entry:** limit near the edge.
- **Stop:** beyond the range edge.
- **Target:** the opposite edge.
- **Confidence:** HIGH at clean range extremes with a strong signal bar.

## Reversal setups

### Failed breakout (FBO) buy / sell

The strongest reversal signal. Price breaks a level, then closes back inside.

- **Conditions:** a breakout of a range extreme, swing point, or channel
  fails (close back inside).
- **Signal bar:** a trend bar closing back into the range in the opposite
  direction.
- **Entry:** on the reversal bar or next bar in the new direction.
- **Stop:** beyond the failed breakout extreme.
- **Target:** measured move or opposite range edge.
- **Confidence:** HIGH when the FBO happens at a major level with a strong
  counter-trend bar.

### Reversal bar buy / sell

A strong trend bar against the current trend at a key level.

- **Conditions:** mature trend, price extended (climax bar, or at a measured
  move target / major swing point).
- **Signal bar:** the reversal bar itself - a large body bar closing hard
  against the trend.
- **Entry:** on the reversal bar close or next bar.
- **Stop:** beyond the reversal bar extreme.
- **Target:** measured move back or opposite range edge.
- **Confidence:** MEDIUM - one bar is not a trend change; wait for follow-up
  (a second counter-trend bar or a pullback that fails to make a new extreme).

## Setup decision checklist

Before labeling a setup, answer all of:

1. What is the **phase**? (trend, range, breakout, reversal)
2. What is the **always-in** bias?
3. What is the **higher-timeframe bias**? (5m price vs 60m 20 EMA, and the
   prior day/week/month/year closes)
4. What is the **pullback count**? (H1/H2/H3, L1/L2/L3, or none)
5. Where is price relative to **key levels**? (range edges, swings, measured
   moves, prior-period highs/lows/closes, the 5m 20 EMA)
6. Is there a credible **signal bar**? (strong trend bar, correct direction)
7. Does the **direction** of the setup agree with phase and the higher-TF
   bias, or is it a deliberate counter-trend (reversal) bet?

If the answer to 6 is no, there is no clean setup - label NONE and move on.
