# SCHRITT 3 — VERCEL DEPLOYMENT

**Zeit:** ~5 Minuten  
**Ziel:** Dashboard online stellen → auf Handy als App nutzbar  
**Wo:** https://vercel.com

---

## Vorbereitung

- `index.html` muss fertig sein (Schritt 2 erledigt)
- Supabase-Keys müssen in der `index.html` eingetragen sein
- GitHub-Account empfohlen (kostenlos)

---

## Option A — Per GitHub (empfohlen, automatische Updates)

### 1. GitHub Repo erstellen
1. https://github.com → **"New repository"**
2. Name: `my-dashboard` (oder egal)
3. **"Private"** lassen ← wichtig, wegen API-Keys in der Datei!
4. **"Create repository"**

### 2. Dateien hochladen
1. Im neuen Repo: **"uploading an existing file"** klicken
2. Deine `index.html` per Drag & Drop rein
3. **"Commit changes"** klicken

### 3. Vercel verbinden
1. https://vercel.com → **"Sign Up"** (mit GitHub einloggen)
2. **"Add New Project"**
3. Dein `my-dashboard` Repo auswählen → **"Import"**
4. Einstellungen so lassen wie sie sind → **"Deploy"**
5. ~1 Minute warten → fertig!

### 4. Deine URL
Vercel gibt dir eine URL wie: `https://my-dashboard-xyz.vercel.app`

Das ist dein Dashboard — von überall erreichbar.

**Bonus: Auto-Deploy**  
Wenn du später die `index.html` in GitHub aktualisierst, deployed Vercel automatisch die neue Version.

---

## Option B — Direkt per Drag & Drop (einfacher, aber kein Auto-Update)

1. https://vercel.com → anmelden
2. Auf der Startseite: **deinen Projektordner** direkt per Drag & Drop ins Browser-Fenster ziehen
3. Vercel deployed sofort
4. URL kopieren → fertig

---

## Dashboard auf Handy als App installieren

### iPhone (Safari)
1. Deine Vercel-URL im Safari öffnen
2. Unten: **Teilen-Button** (Quadrat mit Pfeil hoch)
3. **"Zum Home-Bildschirm"** tippen
4. Name eingeben → **"Hinzufügen"**

### Android (Chrome)
1. Deine Vercel-URL in Chrome öffnen
2. Oben rechts: **drei Punkte** → **"Zum Startbildschirm hinzufügen"**
3. Bestätigen

→ Jetzt hast du dein Dashboard als App-Icon auf dem Handy, das sich wie eine native App anfühlt!

---

## Fertig! Dein komplettes Setup:

```
PC-Browser          Handy-App
     ↘                  ↙
      index.html (Vercel)
              ↕
         Supabase DB
    (alle Daten synchron)
```

Änderungen auf dem PC sind sofort auf dem Handy sichtbar — und umgekehrt.
