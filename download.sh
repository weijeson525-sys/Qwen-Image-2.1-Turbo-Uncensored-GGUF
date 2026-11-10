#!/usr/bin/env bash
# Download weights for this model from Hugging Face.
# No token / no credentials needed (public repo, gated=false).
# Usage:
#   ./download.sh                # download default quant (AD-Q4_K)
#   ./download.sh <quant>        # download another quant, e.g. ./download.sh AD-Q2_K
#   ./download.sh --list         # list all available quants and sizes
#   ./download.sh --mmproj       # download mmproj file(s) only
set -euo pipefail
# Reject unexpected extra arguments: a stray extra arg must never start a download.
if [ "$#" -gt 1 ]; then
  echo "ERROR: too many arguments (expected at most 1). Usage: ./download.sh [QUANT|--list|--mmproj|--help]" >&2
  exit 1
fi


HF_REPO="AtomicChat/Qwen-Image-2.1-Turbo-Uncensored-GGUF"
BASE="https://huggingface.co/$HF_REPO/resolve/main"
DEFAULT_QUANT="AD-Q4_K"

list_quants() {
  echo "Available quants (from HF, verified 2026-11-09):"
  echo "  Qwen-Image-2.1-Turbo-Uncensored-AD-Q2_K  3.34 GB  Qwen-Image-2.1-Turbo-Uncensored-AD-Q2_K.gguf"
  echo "  Qwen-Image-2.1-Turbo-Uncensored-AD-Q3_K  4.18 GB  Qwen-Image-2.1-Turbo-Uncensored-AD-Q3_K.gguf"
  echo "  Qwen-Image-2.1-Turbo-Uncensored-AD-Q4_K  5.29 GB  Qwen-Image-2.1-Turbo-Uncensored-AD-Q4_K.gguf"
  echo "  Qwen-Image-2.1-Turbo-Uncensored-AD-Q5_K  6.28 GB  Qwen-Image-2.1-Turbo-Uncensored-AD-Q5_K.gguf"
  echo "  Qwen-Image-2.1-Turbo-Uncensored-AD-Q6_K  7.49 GB  Qwen-Image-2.1-Turbo-Uncensored-AD-Q6_K.gguf"
  echo "  Qwen-Image-2.1-Turbo-Uncensored-BF16  16.39 GB  Qwen-Image-2.1-Turbo-Uncensored-BF16.gguf"
  echo "  Qwen-Image-2.1-Turbo-Uncensored-Q8_0  8.71 GB  Qwen-Image-2.1-Turbo-Uncensored-Q8_0.gguf"
  echo "  mmproj-Qwen-Image-2.1-Turbo-Uncensored-BF16.gguf  1.16 GB  (extra file)"
  echo "  mmproj-Qwen-Image-2.1-Turbo-Uncensored-F16.gguf  1.16 GB  (extra file)"
}

files_for() {
  case "$1" in
    Qwen-Image-2.1-Turbo-Uncensored-AD-Q2_K|AD-Q2_K) echo "Qwen-Image-2.1-Turbo-Uncensored-AD-Q2_K.gguf|3336289216|e42dac4f385fc49e5812721ff930e2417fbcc9fd148c01a78c8492ebbe54dd2a" ;;
    Qwen-Image-2.1-Turbo-Uncensored-AD-Q3_K|AD-Q3_K) echo "Qwen-Image-2.1-Turbo-Uncensored-AD-Q3_K.gguf|4184140736|e6bd367602ef37ac08f4b0e0915d716b734c8c8c8957864cc81a50314715a3df" ;;
    Qwen-Image-2.1-Turbo-Uncensored-AD-Q4_K|AD-Q4_K) echo "Qwen-Image-2.1-Turbo-Uncensored-AD-Q4_K.gguf|5287517120|8123f36d2b3e562deef164dffdae33bdb1d152797ad10bb630827eaa7bce795d" ;;
    Qwen-Image-2.1-Turbo-Uncensored-AD-Q5_K|AD-Q5_K) echo "Qwen-Image-2.1-Turbo-Uncensored-AD-Q5_K.gguf|6281292736|ea5473082841c6a0eda38d2d42d784ca5bc6f3a2e8cf648e305ea4da6373525b" ;;
    Qwen-Image-2.1-Turbo-Uncensored-AD-Q6_K|AD-Q6_K) echo "Qwen-Image-2.1-Turbo-Uncensored-AD-Q6_K.gguf|7490550720|f30f66b0fa833d3ce95c522271fc96182cc2c72a1e577d9b3444633b201b334d" ;;
    Qwen-Image-2.1-Turbo-Uncensored-BF16|BF16) echo "Qwen-Image-2.1-Turbo-Uncensored-BF16.gguf|16388045536|af8502723461ba196d3b486c93b198e4163ce20c39a64916cce52f14bf5cafe3" ;;
    Qwen-Image-2.1-Turbo-Uncensored-Q8_0|Q8_0) echo "Qwen-Image-2.1-Turbo-Uncensored-Q8_0.gguf|8709520096|f8f9f6276b726db5291f4a5343089612cb5fd08aa81e8f0791dc66d2c03d07ca" ;;
    mmproj-Qwen-Image-2.1-Turbo-Uncensored-BF16.gguf|mmproj-Qwen-Image-2.1-Turbo-Uncensored-BF16) echo "mmproj-Qwen-Image-2.1-Turbo-Uncensored-BF16.gguf|1162568928|5cc50e36ab57d7467e7016113525cc699e4c34c3eff7cd7b98d2ecfdba8ab720" ;;
    mmproj-Qwen-Image-2.1-Turbo-Uncensored-F16.gguf|mmproj-Qwen-Image-2.1-Turbo-Uncensored-F16) echo "mmproj-Qwen-Image-2.1-Turbo-Uncensored-F16.gguf|1159029984|d9870a1f168db3d814596216aaf35702154147b443572c7939acca1802621ac6" ;;
    *) echo "unknown quant: $1 (run ./download.sh --list)" >&2; exit 1 ;;
  esac
}

if [ "${1:-}" = "--help" ] || [ "${1:-}" = "-h" ]; then
  echo "Usage: ./download.sh [QUANT]"
  echo "       ./download.sh --list        list all available quants and sizes"
  echo "       ./download.sh --mmproj      download the mmproj vision file only"
  echo "Default QUANT: $DEFAULT_QUANT"
  exit 0
fi
if [ "${1:-}" = "--list" ]; then list_quants; exit 0; fi
if [ "${1:-}" = "--mmproj" ]; then
  WANT="mmproj-Qwen-Image-2.1-Turbo-Uncensored-BF16.gguf|1162568928|5cc50e36ab57d7467e7016113525cc699e4c34c3eff7cd7b98d2ecfdba8ab720 mmproj-Qwen-Image-2.1-Turbo-Uncensored-F16.gguf|1159029984|d9870a1f168db3d814596216aaf35702154147b443572c7939acca1802621ac6"
else
  WANT="$(files_for "${1:-$DEFAULT_QUANT}")"
fi

# total size reminder
TOTAL=0
for spec in $WANT; do
  sz="${spec#*|}"; sz="${sz%%|*}"
  TOTAL=$((TOTAL + sz))
done
echo "Total download size: $((TOTAL / 1000000000)) GB ($TOTAL bytes) — make sure you have enough disk space."
echo "Source: https://huggingface.co/$HF_REPO"

for spec in $WANT; do
  fname="${spec%%|*}"
  rest="${spec#*|}"
  fsize="${rest%%|*}"
  fsha="${rest##*|}"
  echo "== $fname ($((fsize / 1000000000)) GB)"
  curl -L --fail --retry 3 -o "$fname" "$BASE/$fname"
  actual_size="$(wc -c < "$fname" | tr -d " ")"
  if [ "$actual_size" != "$fsize" ]; then
    echo "SIZE MISMATCH for $fname: expected $fsize, got $actual_size" >&2
    rm -f "$fname"; exit 1
  fi
  actual_sha="$(sha256sum "$fname" | cut -d" " -f1)"
  if [ "$actual_sha" != "$fsha" ]; then
    echo "SHA256 MISMATCH for $fname: expected $fsha, got $actual_sha" >&2
    rm -f "$fname"; exit 1
  fi
  echo "OK $fname (size + sha256 verified)"
done
echo "All files downloaded and verified."
