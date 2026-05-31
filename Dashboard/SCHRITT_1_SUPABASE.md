# SCHRITT 1 — SUPABASE SETUP

**Zeit:** ~5 Minuten  
**Ziel:** Datenbank erstellen + API-Keys holen

---

## 1. Account & Projekt erstellen

1. Gehe auf https://supabase.com → **"Start your project"**
2. Mit GitHub einloggen (empfohlen) oder E-Mail
3. **"New Project"** klicken
4. Einstellungen:
   - **Name:** `my-dashboard` (egal, nur für dich)
   - **Database Password:** Irgendwas Sicheres — merken oder in Notiz speichern
   - **Region:** `Frankfurt (eu-central-1)` ← wählen, weil du in Bayern bist = schneller
5. **"Create new project"** → ca. 1-2 Minuten warten

---

## 2. Datenbank aufsetzen (SQL ausführen)

1. Im Supabase-Dashboard links auf **"SQL Editor"** klicken
2. **"New query"** klicken
3. Den folgenden SQL-Code komplett reinkopieren:

```sql
-- 1. TODOS TABLE
CREATE TABLE IF NOT EXISTS todos (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    date_str TEXT NOT NULL,
    text TEXT NOT NULL,
    done BOOLEAN DEFAULT FALSE,
    queued BOOLEAN DEFAULT FALSE,
    done_at BIGINT
);

-- 2. WATER LOGS TABLE
CREATE TABLE IF NOT EXISTS water_logs (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    date_str TEXT NOT NULL,
    amount_ml INT NOT NULL
);

-- 3. SUPPLEMENTS TABLE
CREATE TABLE IF NOT EXISTS supplements (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name TEXT NOT NULL,
    window TEXT NOT NULL,
    start_hour INT NOT NULL,
    end_hour INT NOT NULL,
    is_low BOOLEAN DEFAULT FALSE
);

-- 4. WEIGHT LOGS TABLE
CREATE TABLE IF NOT EXISTS weight_logs (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    date_str TEXT NOT NULL UNIQUE,
    weight_kg NUMERIC(5,2) NOT NULL,
    photo_url TEXT
);

-- 5. WORKOUT LOGS TABLE
CREATE TABLE IF NOT EXISTS workout_logs (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    date_str TEXT NOT NULL,
    location TEXT NOT NULL,
    split_name TEXT NOT NULL,
    exercise_name TEXT NOT NULL,
    weight_kg NUMERIC(5,2) NOT NULL,
    reps INT NOT NULL,
    completed BOOLEAN DEFAULT TRUE
);

-- 6. FINANCES TABLE
CREATE TABLE IF NOT EXISTS finance_accounts (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name TEXT NOT NULL,
    type TEXT NOT NULL,
    balance NUMERIC(12,2) DEFAULT 0.00,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 7. SUBSCRIPTIONS TABLE
CREATE TABLE IF NOT EXISTS subscriptions (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name TEXT NOT NULL,
    amount NUMERIC(10,2) NOT NULL,
    renewal_day INT NOT NULL,
    last_deducted_month TEXT
);
```

4. Oben rechts auf **"Run"** (oder `Ctrl+Enter`) klicken
5. Unten sollte stehen: `Success. No rows returned` → alles gut ✓

---

## 3. API-Keys holen

1. Links im Menü: **"Project Settings"** (Zahnrad-Icon ganz unten)
2. Dann: **"API"**
3. Zwei Werte kopieren und irgendwo zwischenspeichern:

| Was | Wo | Beispiel |
|-----|----|---------|
| **Project URL** | Unter "Project URL" | `https://abcdefgh.supabase.co` |
| **anon / public Key** | Unter "Project API keys" → `anon public` | `eyJhbGci...` (langer String) |

> ⚠️ Den `service_role` Key NICHT nehmen — nur `anon public`!

---

## 4. Fertig!

Du hast jetzt:
- ✓ 7 Tabellen in deiner Cloud-Datenbank
- ✓ Project URL
- ✓ API Key (anon)

→ Weiter mit **SCHRITT_2_CLAUDE.md**
