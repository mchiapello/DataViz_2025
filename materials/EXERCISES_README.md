# Esercizi - Due Modalità Disponibili

Questo corso offre **due versioni** dei file di esercizi per adattarsi al tuo stile di apprendimento.

## 📁 Struttura delle Cartelle

```
materials/
├── exercises_blank/          # Esercizi senza codice di supporto
│   ├── 04_geometrie_base_exercises.R
│   ├── 05_estetiche_mappature_exercises.R
│   ├── 07_facets_coordinate_exercises.R
│   ├── 08_scale_trasformazioni_exercises.R
│   ├── 09_themes_personalizzazione_exercises.R
│   └── 10_visualizzazioni_avanzate_exercises.R
│
└── exercises_scaffold/       # Esercizi con codice iniziale (scaffold)
    ├── 04_geometrie_base_exercises.R
    ├── 05_estetiche_mappature_exercises.R
    ├── 07_facets_coordinate_exercises.R
    ├── 08_scale_trasformazioni_exercises.R
    ├── 09_themes_personalizzazione_exercises.R
    └── 10_visualizzazioni_avanzate_exercises.R
```

## 🎯 Quale Versione Scegliere?

### 📝 **Esercizi Blank** (`exercises_blank/`)

**Per chi preferisce:**
- Scrivere il codice completamente da zero
- Sfida maggiore
- Consolidare la sintassi di ggplot2

**Struttura:**
```r
# ESERCIZIO 1: Scatter Plot Base
# Obiettivo: Creare uno scatter plot per esplorare la relazione tra 
#            cilindrata (displ) e consumo autostrada (hwy)
# Dataset: mpg

# Il tuo codice qui:




```

### 🏗️ **Esercizi Scaffold** (`exercises_scaffold/`)

**Per chi preferisce:**
- Concentrarsi sui concetti di ggplot2
- Avere una struttura di partenza
- Ridurre errori di sintassi

**Struttura:**
```r
# ESERCIZIO 1: Scatter Plot Base
# Obiettivo: Creare uno scatter plot per esplorare la relazione tra 
#            cilindrata (displ) e consumo autostrada (hwy)
# Dataset: mpg

# Il tuo codice qui:
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point()  # <-- Completa questa riga
```

Gli esercizi scaffold includono:
- ✅ Struttura base del codice `ggplot()`
- ✅ Nomi delle funzioni chiave
- ✅ Commenti inline (`# <--`) con suggerimenti
- ✅ Parametri da completare evidenziati

## 🚀 Come Iniziare

1. **Scegli la tua modalità** in base al tuo livello di comfort
2. **Apri il file** corrispondente in RStudio
3. **Esegui il blocco SETUP** all'inizio del file
4. **Completa gli esercizi** nell'ordine suggerito
5. **Confronta** con le soluzioni (`*_SOLUTIONS.R`) a fine corso

## 💡 Suggerimenti

- **Principianti**: Inizia con `exercises_scaffold/`
- **Intermedi**: Prova `exercises_blank/` per prima, consulta scaffold se blocchi
- **Avanzati**: Usa `exercises_blank/` e sperimenta con variazioni
- **Tutti**: Non esitare a passare tra le due versioni!

## 🔄 Passare da una Versione all'Altra

Puoi liberamente:
- Iniziare con scaffold e passare a blank man mano che acquisisci confidenza
- Usare blank per alcuni moduli e scaffold per altri
- Confrontare le due versioni per imparare trucchi di sintassi

## ❓ Domande?

Se hai dubbi su quale versione usare:
- Scaffold è **sempre** una scelta sicura per iniziare
- Puoi sempre cambiare versione durante il corso
- Le soluzioni funzionano per **entrambe** le versioni

---

**Buon lavoro! 📊✨**

REVELO Training - Data Viz 2025
