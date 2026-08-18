---
name: al-brooks
description: Al Brooks price action methodology for reading 5m and daily OHLCV candles. Use when labeling candle data, classifying market phase (trend / trading range / transition), identifying bar-by-bar structure, determining setups (pullback, breakout, failed breakout, reversal, range fade), or reasoning about ES/futures price action the way Al Brooks does in Trading Price Action (Trends, Reversals, Ranges) and Reading Price Charts Bar by Bar.
---

# Al Brooks Price Action Method

Read the market bar by bar, no indicators. Every bar is a momentary battle
between buyers and sellers; the close records who won. The method is a
statistical reading of bar structure, market phase, and context - not a
prediction tool. The edge comes from repeatedly taking high-probability
bets with controlled risk, not from being right.

## The three inviolable principles

1. **Context is everything.** No bar, pattern, or signal means anything out of
   context. The same bar is bullish at the bottom of a range and bearish at
   the top. Always read structure first, bar second.
2. **The market is always in one of three states:** bull trend, bear trend,
   or trading range - plus the two transitions between them (breakouts and
   reversals). State always wins over any single bar.
3. **It is a probability game.** Trades win roughly 40-60% of the time. The
   profit comes from cutting losers fast and letting winners run at roughly
   1:2 to 1:3 reward-to-risk. Every individual trade is noise.

## The market cycle (how Brooks determines where you are)

Brooks does not use the classic 4-stage cycle. He classifies the market into
states and tracks how one state turns into the next:

1. **Trading range** - overlapping bars, roughly equal highs and lows, no
   persistent direction. Buyers and sellers are in balance.
2. **Bull/bear breakout** - a strong trend bar (or series) pushes beyond the
   range extreme with a close beyond it. This is the transition from range to
   trend.
3. **Trend** - persistent direction via a sequence of higher highs/higher
   lows (bull) or lower highs/lower lows (bear), broken by small pullbacks.
   The trend continues until a failed breakout or climax signals reversal.
4. **Trend reversal / back to range** - the trend exhausts, the last push
   fails, or a reversal bar forms at a key level, and the market returns to a
   new trading range.

To classify a chart or a bar:

- **Is there a clear sequence of swing points in one direction with small
  pullbacks?** If yes, it is a trend. Mark its direction.
- **Are bars overlapping in a horizontal band with no net progress?** If yes,
  it is a trading range. Mark the top and bottom of the range.
- **Is a strong bar breaking out of a defined level?** It is a breakout
  (transition). Watch whether the close holds beyond the level.
- **Has the most recent leg failed (breakout immediately reversed)?** It is a
  failed breakout, the strongest early sign of a reversal.

The "always-in" question frames the same idea dynamically: at this bar, if
you were forced to hold a position until the next swing point, would you be
long or short? That answer is the always-in bias, and every setup is a bet
that the always-in direction either continues or flips.

## What Brooks analyzes (in order of priority)

1. **Market phase** - trend, range, or transition (see above).
2. **Market structure** - swing highs/lows, higher highs / higher lows,
   lower highs / lower lows, legs of the move, measured moves.
3. **Higher-timeframe context** - the 20 EMA on the 60m chart as a filter for
   the 5m (price above it is bullish context, below it bearish), plus the
   weekly close and the prior day / week / month / year high, low, and close
   acting as magnets and breakout levels.
4. **Individual bars and bar patterns** - trend bar, pullback bar, doji,
   inside/outside bar, reversal bar, signal bar, bar pairs.
5. **The 20 EMA on the 5m chart** - the reference line of the current move.
   In a strong trend price rides it; pullbacks that hold it are buys (bull),
   closes beyond it signal a deeper pullback or possible trend change.
6. **Pullback count (H1/H2/H3, L1/L2/L3)** - the numbered pullback in the
   current trend leg. High 1/2/3 are the rallies sold in a bear trend,
   Low 1/2/3 are the lows bought in a bull trend. The number tells you how
   mature the move is and how to size the entry.
7. **The setup** - the specific entry condition that follows from 1-6.

Full detail on each layer is in the reference files:
- `reference/market-structure.md` - phase, always-in, trends, ranges, measured moves
- `reference/bar-reading.md` - every bar type and pattern he reads
- `reference/setups.md` - the entry setup catalog (pullbacks, breakouts, FBO, reversal, range fade)

## Labeling workflow (for 5m and daily candles)

When labeling a sequence of OHLCV candles, produce one label set per bar in
this order. The labels are designed to be consumed by downstream ML/RAG
systems, so keep them enumerable and consistent.

For each bar `i`, given bars `i-10 .. i+1`:

1. **phase** - one of `TREND_UP | TREND_DOWN | RANGE | BREAKOUT_UP | BREAKOUT_DOWN | REVERSAL`
2. **always_in** - one of `LONG | SHORT | FLAT`
3. **bar_type** - one of `TREND_BULL | TREND_BEAR | PULLBACK | DOJI | INSIDE | OUTSIDE | REVERSAL | NEUTRAL`
4. **structure** - position of the bar relative to the cycle:
   `IN_TREND | AT_RANGE_HIGH | AT_RANGE_LOW | BREAKOUT | PULLBACK | TREND_EXTENSION | NEW_SWING_HIGH | NEW_SWING_LOW`
5. **hft_bias** - higher-timeframe context from the 60m 20 EMA and the prior
   day/week/month/year closes: `LONG | SHORT | FLAT`
6. **ema_relation** - where the bar sits relative to the 5m 20 EMA:
   `ABOVE | BELOW | CROSSING_UP | CROSSING_DOWN | ON`
7. **pullback_count** - the numbered pullback within the current trend leg,
   counting bars that swing against the trend: `H1 | H2 | H3 | L1 | L2 | L3 | NONE`
8. **levels_hit** - any prior-period levels the bar touched, comma-separated
   subset of `PDO | PDH | PDL | PDC | PWH | PWL | PWC | PMH | PML | PMC | PYH | PYL | PYC | WCLOSE`
9. **signal_bar** - `true | false` (is this bar the trigger bar for a setup)
10. **setup** - the setup the bar triggers, if any:
    `PULLBACK_BUY | PULLBACK_SELL | BREAKOUT_BUY | BREAKOUT_SELL | FBO_BUY | FBO_SELL | REVERSAL_BUY | REVERSAL_SELL | RANGE_FADE_BUY | RANGE_FADE_SELL | NONE`
11. **confidence** - `HIGH | MEDIUM | LOW` based on strength of the trend bar,
    how clean the structure is, and whether the setup is at a key level.

Labeling rules:

- Use the close, not the intra-bar path, for classification. The close decides
  who won the bar.
- Classify phase using the last several bars of structure, not one bar. One
  trend bar does not make a trend.
- Do not call a breakout a reversal. A breakout becomes a reversal only when
  the breakout fails (price closes back inside the range), which is an FBO.
- A signal bar must be a strong trend bar in the setup direction and must be
  followed by an entry. Do not mark `signal_bar=true` on weak or doji bars.
- Set `confidence=HIGH` only when phase, bar type, and level all agree (e.g.
  a strong bull trend bar closing above a measured-move target in a bull
  trend).
- `pullback_count` is counted only within a single trend leg and resets when
  the leg ends (a new swing high/low, a trend change, or a new range). A bar
  that pushes further in the trend direction is not a pullback.
- `hft_bias` is read from the 60m chart's 20 EMA and prior-period closes, NOT
  from the 5m bar itself. When 60m data is unavailable, mark it `FLAT` and
  note the absence.
- `levels_hit` only reports levels that actually exist in the provided data.
  Do not invent prior-period levels; if a period's data is absent, omit it.

## Usage notes

- Never invent levels. Use actual swing points, bar highs/lows, or measured
  moves computed from the data.
- When asked to explain why a bar is labeled a certain way, walk through the
  three principles (context, state, probability) and cite the specific bar
  evidence.
- For a single bar this method is not predictive. State the always-in bias and
  the setup, not a guaranteed direction.
