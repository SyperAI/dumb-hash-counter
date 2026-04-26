import hashlib
from pathlib import Path

from fastapi import FastAPI, HTTPException

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get("/hash")
async def calculate_hash(file_path: Path):
    if not file_path.exists():
        raise HTTPException(status_code=404, detail="File not found")

    hash_md5 = hashlib.md5()

    try:
        hash_md5.update(str(file_path.read_bytes()).encode())
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

    return hash_md5.hexdigest()
