#!/bin/bash
echo "=== TES 1: CEK DI BUILD ==="
ls build/web/assets/assets/materi/aljabar/ 2>&1
echo ""
echo "=== TES 2: CEK DI MANIFEST ==="
cat build/web/assets/AssetManifest.json | grep -o "aljabar" | head -n 1
if [ $? -eq 0 ]; then
  echo "-> Manifest ADA aljabar"
else
  echo "-> Manifest TIDAK ADA aljabar (ini penyebabnya)"
fi
echo ""
echo "=== TES 3: COBA BUKA LEWAT HTTP ==="
# Harus serve dulu di terminal lain, baru jalankan ini
curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:9090/assets/assets/materi/aljabar/id.json
echo " <- HTTP code untuk id.json (200 = ada, 404 = tidak ada)"
