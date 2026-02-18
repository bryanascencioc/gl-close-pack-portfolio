import csv
import sqlite3
from pathlib import Path

ROOT = Path(__file__).resolve().parent
CSV_PATH = ROOT / "fGL.csv"
DB_PATH = ROOT / "gl_close.db"

def main():
    if not CSV_PATH.exists():
        raise FileNotFoundError(f"Missing {CSV_PATH}")

    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()

    cur.execute("DROP TABLE IF EXISTS fGL;")
    cur.execute("""
        CREATE TABLE fGL (
            ClosePeriod TEXT,
            Entity TEXT,
            PostingDate TEXT,
            DocNo TEXT,
            DocType TEXT,
            Account TEXT,
            Amount REAL,
            Currency TEXT,
            Text TEXT
        );
    """)

    with CSV_PATH.open("r", encoding="utf-8-sig", newline="") as f:
        reader = csv.DictReader(f)
        rows = []
        for r in reader:
            rows.append((
                r.get("ClosePeriod",""),
                r.get("Entity",""),
                r.get("PostingDate",""),
                r.get("DocNo",""),
                r.get("DocType",""),
                str(r.get("Account","")),
                float(r.get("Amount") or 0),
                r.get("Currency",""),
                r.get("Text",""),
            ))

    cur.executemany("""
        INSERT INTO fGL
        (ClosePeriod, Entity, PostingDate, DocNo, DocType, Account, Amount, Currency, Text)
        VALUES (?,?,?,?,?,?,?,?,?);
    """, rows)

    conn.commit()
    conn.close()
    print(f"Loaded {len(rows)} rows into {DB_PATH}")

if __name__ == "__main__":
    main()
