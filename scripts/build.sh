#!/bin/bash
# Aluminum OS v3.0 — Build Script
# Builds all Rust crates and validates the Python bridge

set -euo pipefail

echo "============================================"
echo "  Aluminum OS v3.0 — Build System"
echo "============================================"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

# Step 1: Build Rust crates (library mode, skip no_std boot for now)
echo ""
echo "[1/4] Building Rust crates..."
cd "$ROOT_DIR"

# Build forge-core (the kernel library)
echo "  Building forge-core..."
cd forge-core && cargo build --release 2>&1 && cd ..
echo "  forge-core: OK"

# Build sheldonbrain
echo "  Building sheldonbrain..."
cd sheldonbrain && cargo build --release 2>&1 && cd ..
echo "  sheldonbrain: OK"

# Build pantheon
echo "  Building pantheon..."
cd pantheon && cargo build --release 2>&1 && cd ..
echo "  pantheon: OK"

# Build noosphere
echo "  Building noosphere..."
cd noosphere && cargo build --release 2>&1 && cd ..
echo "  noosphere: OK"

# Step 2: Run Rust tests
echo ""
echo "[2/4] Running Rust tests..."
cd "$ROOT_DIR"
cargo test --workspace --exclude forge-boot 2>&1
echo "  All Rust tests: PASSED"

# Step 3: Validate Python bridge
echo ""
echo "[3/4] Validating Manus Core (Python bridge)..."
cd "$ROOT_DIR/manus-core"
python3 bridge.py
echo "  Manus Core: VALIDATED"

# Step 4: Generate build report
echo ""
echo "[4/4] Generating build report..."
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
cat > "$ROOT_DIR/BUILD_REPORT.json" << EOF
{
    "version": "3.0.0",
    "build_time": "$TIMESTAMP",
    "components": {
        "forge-core": "BUILT",
        "sheldonbrain": "BUILT",
        "pantheon": "BUILT",
        "noosphere": "BUILT",
        "manus-core": "VALIDATED"
    },
    "tests": "ALL PASSED",
    "status": "READY"
}
EOF

echo ""
echo "============================================"
echo "  BUILD COMPLETE — ALL SYSTEMS READY"
echo "  Report: $ROOT_DIR/BUILD_REPORT.json"
echo "============================================"
