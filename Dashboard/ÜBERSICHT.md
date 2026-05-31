# DASHBOARD — TOOL-ÜBERSICHT

> Kurze Referenz: Was machst du wo, und in welcher Reihenfolge?

---

## REIHENFOLGE (4 Schritte)

| Schritt | Tool | Was du machst | Datei |
|---------|------|---------------|-------|
| 1 | **Supabase** | Datenbank aufsetzen, API-Keys holen | `SCHRITT_1_SUPABASE.md` |
| 2 | **Claude** | Code generieren lassen | `SCHRITT_2_CLAUDE.md` |
| 3 | **VS Code** | Code einfügen + API-Keys eintragen | *(direkt in index.html)* |
| 4 | **Vercel** | Dashboard online stellen + Handy-Zugriff | `SCHRITT_3_VERCEL.md` |

---

## WAS MACHT WAS?

### Supabase (Cloud-Datenbank)
- **Was:** Speichert alle deine Daten (Todos, Workouts, Finanzen, Wasser, Gewicht, Abos)
- **Warum:** Damit PC und Handy synchron sind — beide lesen/schreiben in dieselbe Datenbank
- **Kosten:** Kostenlos (Free Tier)
- **URL:** https://supabase.com

### Claude (KI-Code-Generator)
- **Was:** Schreibt den kompletten `index.html`-Code auf einen Prompt hin
- **Warum:** Der Code ist zu groß/komplex um ihn manuell zu schreiben (~2000+ Zeilen)
- **Empfehlung:** Claude Sonnet 3.5 oder neuer (claude.ai)
- **URL:** https://claude.ai

### VS Code (Code-Editor)
- **Was:** Du öffnest die generierte `index.html` und trägst deine Supabase-Keys ein
- **Warum:** Zwei Zeilen Code editieren (URL + API-Key)
- **Kosten:** Kostenlos
- **URL:** https://code.visualstudio.com

### Vercel (Hosting)
- **Was:** Stellt dein Dashboard öffentlich im Internet bereit
- **Warum:** Damit du es auch auf dem Handy als App nutzen kannst (PWA-Style)
- **Kosten:** Kostenlos (Hobby Plan)
- **URL:** https://vercel.com

---

## DEIN LOKALER PROJEKTORDNER

```
Dashboard/
├── index.html          ← Dein komplettes Dashboard (von Claude generiert)
├── ÜBERSICHT.md        ← Diese Datei
├── SCHRITT_1_SUPABASE.md
├── SCHRITT_2_CLAUDE.md
└── SCHRITT_3_VERCEL.md
```

---

## WICHTIG: Wo welche Daten landen

```
Du (Browser/Handy)
       ↕  fetch() API-Calls
   Supabase (Cloud-DB)
       ↕  automatisch sync
Du (anderes Gerät)
```

Kein eigener Server nötig. Alles läuft über Supabase direkt.
