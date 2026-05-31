# SCHRITT 2 — CODE MIT CLAUDE GENERIEREN

**Zeit:** ~3-5 Minuten (Prompt eintippen + warten)  
**Ziel:** Kompletten `index.html` Code generieren lassen  
**Wo:** https://claude.ai (Neuer Chat, Claude Sonnet 3.5 oder höher)

---

## Vorbereitung

- Supabase-Keys aus Schritt 1 bereithalten
- Neuen Chat bei claude.ai öffnen
- Den Prompt unten komplett kopieren und einfügen

---

## DER MASTER-PROMPT (komplett kopieren!)

```
# MASTER PROMPT: THE ULTIMATE CYBER-MINIMALIST PERSONAL DASHBOARD (EPISODE 1, 2 & 3 INTEGRATED)

Act as a world-class Frontend Engineer, Software Architect, and UI/UX Designer. 
Your task is to build a SINGLE, FULLY-CONTAINED, PRODUCTION-READY `index.html` file. 
CRITICAL RULE: Do NOT use any placeholders, do NOT output `// TODO` or `... rest of the code`. Every single feature, logic block, style, and HTML element must be written out completely. The code must be self-contained: CSS inside `<style>`, JS inside a single `<script>` at the bottom. No external CSS/JS frameworks allowed, except vanilla Tailwind via CDN if needed, but pure custom CSS is preferred for the cyber-minimalist premium look.

## 1. VISUAL SYSTEM & DESIGN LANGUAGE (THE CHASSIS)
- **Theme:** Cyber-minimalist luxury dark mode. Base background color: `#050506`.
- **Background Effects:** Two ambient radial color washes layered: A warm copper/orange wash (`rgba(224, 118, 88, 0.16)`) at top-right (82% across, 14% down) and a cool titanium grey wash (`rgba(180, 180, 200, 0.06)`) at bottom-left (18% across, 90% down). Apply a 36-second alternating keyframe scale/translate animation to simulate an organic drift.
- **Film Grain Overlay:** Use a CSS pseudo-element (`body::after`) with a repeating tiny geometric dot texture (white at 1.4% opacity) to create a high-end tactile screen feel.
- **Typography:** Sans-serif stack (`-apple-system, BlinkMacSystemFont, "Inter"`) for interface text; Monospace stack (`ui-monospace, "SF Mono", Menlo`) for numbers, values, statuses, and logs to emphasize data precision.
- **Cards:** Glassmorphism chassis (`background: rgba(255, 255, 255, 0.04)`, `backdrop-filter: blur(24px) saturate(1.2)`, border `1px solid rgba(255,255,255,0.06)`).

## 2. NAVIGATION & COMPONENT 1: GLOBAL TOP-BAR
- **Global Header:** Title "MY SYSTEM" utilizing a hard contrast gradient overlay (`linear-gradient(180deg, #FFFFFF 0%, #C7C4BC 120%)`).
- **Tab Switcher Layout:** Premium horizontal low-profile tab bar switcher with active states for 3 main views: `[1. FOCUS & ENGINE]` | `[2. HEALTH & PROGRESSION]` | `[3. WEALTH & COMMITMENTS]`.
- **Top-Bar Stats:**
  1. *Daily Goals Compact Pill:* Text showing "GOALS: X/Y Done".
  2. *Tech Stack Badge:* A clean tag saying `SYS: STACK // VANILLA-JS // SUPABASE`.
  3. *Fluid Hydro Tracker:* Calculates an adaptive daily target based on user profile constants (Male, 80kg, 4 hours activity/week, heavy caffeine, ADHD/Stimulant modifiers = Target 3750ml). Displays a miniature visual horizontal grid of the last 14 days. Includes instant `+250ml` and `-250ml` interactive buttons updating the database state immediately.

## 3. ENGINE MODULES (TAB 1: FOCUS & ENGINE)
- **The LED Goal Ticker:** Horizontal dark strip overlayed with a repeating linear scanline pattern. Left: Green pulsing micro-LED box (`box-shadow: 0 0 8px #6BE3A4`). Center: Displays the current active incomplete goal text. Cycles automatically through all incomplete goals every 5 seconds using a strict vertical "slide out / slide in" CSS animation matrix. If zero goals exist, show: "No goals set for today — add one to get rolling.". If all goals are done, show: "✓ All goals done — solid day."
- **The Day Ring (Awake Metric):** Large SVG circle tracking awake window (8:00 AM to 12:00 AM midnight). Color transitions dynamically across a sophisticated "Sun Palette" gradient (Morning amber -> Midday flame -> Evening indigo -> Bedtime deep purple) mapping exactly to the elapsed percentage of the awake day. Center text renders: Big percentage number, current text phase (e.g., "MIDDAY PUSH"), live 12h clock (`hh:mm AM/PM`), and detailed precise micro-copy countdown timer ("4h 12m awake time left").
- **Dynamic Advanced To-Do Cards:** 
  - *Today Card:* Complete checklist. Rows support full custom checkbox toggles, custom drag-and-drop event reordering handles (`⋮⋮`), inline edit trigger capability on clicking text, custom delete trigger, and a secondary action button to flag a goal as a "Queued Focus Item" (turns the row amber with a `is-queued` styling flash animation).
  - *Streak Pill:* Displays current consecutive "Perfect Day" streak count with an active amber glow bolt emoji (`⚡`) when streak > 0.
  - *All Done State:* If all goals in the list are checked true, the entire Today Card dynamically renders a subtle green radial aura (`rgba(107,227,164,0.08)`) and changes its header sub-text to `all done — solid day`.
  - *Push Button:* A wide, dashed border action button reading "Push remaining to tomorrow" that automatically transfers all unchecked items into tomorrow's list.
  - *Tomorrow Card:* Displays tomorrow's upcoming items as a read-only list view (checkboxes locked). Includes an independent input line for seamless planning.

## 4. CLINICAL PROGRESSION MODULE (TAB 2: HEALTH & PROGRESSION)
- **Supplement Tracker Matrix:**
  - Displays configured daily intake schedule rows. Labels must parse explicit text metrics (e.g., "Creatine Monohydrate [5g]", "L-Theanine [200mg]").
  - Grouped into chronographic windows: Morning (07:00-10:00), Midday (12:00-14:00), Evening (19:00-22:00).
  - *Missed Dose Alarm:* Real-time JS clock check. If the local system time surpasses the `end_hour` of an unchecked supplement window, the specific row must flash red persistently with an automated warning tag: `⚠️ CRITICAL: DOSE MISSED`.
  - *Stock Depletion Toggle:* A button labeled "Running Low". Clicking it activates a state that pushes the item text directly onto a secondary scrolling Nasdaq-style red ticker alert at the card bottom.
- **Weight Analytics Tracker:**
  - Double column metric card. Left: Manual entry input box for daily weight in kg, mapping records against a dotted goal line indicator graph line. Center overlay explains physiological water retention shifts due to muscle glycogen storage. Right: A dual-slot image comparison drag-drop zone mockup showing "Before" and "Current" image frames with metadata text strings (Date + Mass).
- **Progressive Overload Gym Engine:**
  - System architecture to configure multiple training venues ("Home Base", "Metropolitan Gym") and routine splits ("Upper Push A", "Lower Quad Focus").
  - *Exercise Builder Row:* Fields to set Exercise Title, Baseline Weight, and micro-increment settings (e.g., "Barbell Bench Press, Base: 80kg, Step: 2.5kg").
  - *Automated Overload Trigger:* Input log for active sets and reps. If a user inputs a log entry where reps >= 8, the UI must intercept and throw a glowing algorithmic banner badge card: `🔥 OVERLOAD SUCCESS: INCREASE BY +2.5kg NEXT SESSION`.
  - Includes a prominent "MARK WORKOUT SESSION DONE" finalize button to archive records into local array structures.
  - *Body Mass Composition Estimator:* Calculates strength-to-weight ratio adjustments. Color-coded output flags estimated weight changes (Green = Muscle synthesis profile, Amber = Adipose accumulation warning).

## 5. CAPEX RECONCILIATION & OBLIGATIONS (TAB 3: WEALTH & COMMITMENTS)
- **Net Worth Core Aggregator:**
  - Large premium text rendering current aggregated Net Worth balance. Displays dynamic secondary text tracking "All-Time High [ATH]" and "All-Time Low [ATL]".
  - Incorporates a beautiful pure CSS/JS responsive pie-chart module visualizing total allocation splits across manual asset account inputs:
    * *Banks:* (e.g., "Star One Checking", "Revolut Pocket")
    * *Investments:* (e.g., "Vanguard All-World Index")
    * *Crypto:* (e.g., "Bitcoin Cold Storage")
    * *Other Assets:* (e.g., "Real Estate / Primary Residence", "Physical Luxury Assets")
- **The 1% Purchase Filter Rule:**
  - A utility processing potential retail desires. Input box allows typing an asset title and price (e.g., "Custom Workstation Laptop, $5000").
  - The logic instantly divides the cost against the calculated Net Worth variable. If the value exceeds 1.0% of total wealth, it prints an authoritative system warning overlay message detailing exactly how much capital threshold is being risked (e.g., "Warning: This purchase consumes 1.92% of total Net Worth. Exceeds the 1% Capital Rule.").
- **Automated Orders Deductor:**
  - Input log to file an active purchase order. Requires selecting a specific active Bank Account from the database dropdown. Upon pressing "Execute Order", the system automatically subtracts the funds from the specified bank balance, instantly updating the global Net Worth counter, allocation matrices, and charts.
- **Subscription Deck (Abo Ledger):**
  - Grid deck layout tracking repeating software/service commitments. Includes input for Name, Price, and a native calendar date-picker interface to define monthly renewal marks.
  - *Auto-Deduct Simulator:* JS logic calculating if the current day matches the renewal day, executing a simulated passive balance deduction from the primary account.
  - *Pre-Emptive Expiring Highlight:* Real-time indicator loop. If a subscription renewal date is within `<= 3 days` from the active calendar date, the individual abo asset card flashes a crimson warning tone to prevent hidden card charges.

## 6. BACKEND DATABASE OVERRIDE (SUPABASE & SYNC ENGINE)
- **Supabase Integration Interface:**
  - At the very top of the JavaScript section, provide a crystal clear Configuration Object where the user can plug in their Supabase credentials:
    ```javascript
    const SUPABASE_CONFIG = {
      url: "YOUR_SUPABASE_URL_HERE",
      anonKey: "YOUR_SUPABASE_ANON_KEY_HERE"
    };
    ```
  - Write complete, robust asynchronously chained fetch functions utilizing the native standard browser `fetch()` API to perform complete CRUD actions (GET, POST, PATCH, DELETE) targeting the following Supabase database table endpoints mapped out in the schema: `todos`, `water_logs`, `supplements`, `weight_logs`, `workout_logs`, `finance_accounts`, `subscriptions`.
  - Inside every single add, toggle, edit, or delete event listener in the UI, execute the local data state update AND immediately fire the matching asynchronous API call to Supabase to keep PC and mobile data seamlessly synced in real-time.
  - Provide a robust local-storage cache fallback mechanism within the network fetch layer so that if the credentials strings are blank or empty, the entire dashboard remains fully functional locally without crashing.

Generate the single, comprehensive, beautifully structured `index.html` text now. Remember: Write every single line of JavaScript out to completion. No omissions. No shortcuts. Proceed.
```

---

## Nach der Generierung

Claude gibt dir einen riesigen HTML-Code-Block aus. So gehst du vor:

1. Den kompletten Code von `<!DOCTYPE html>` bis `</html>` kopieren
2. Neuen Ordner auf dem PC erstellen: z.B. `Dashboard`
3. Neue Datei erstellen: `index.html`
4. Mit VS Code öffnen → Code einfügen → speichern
5. Ganz oben im `<script>`-Bereich nach `SUPABASE_CONFIG` suchen
6. Deine Keys eintragen:
   ```javascript
   const SUPABASE_CONFIG = {
     url: "https://DEINE-URL.supabase.co",
     anonKey: "dein-anon-key-hier"
   };
   ```
7. Speichern → `index.html` im Browser öffnen zum Testen

→ Danach weiter mit **SCHRITT_3_VERCEL.md**
