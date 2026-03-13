# Aluminum OS v3.0 — The Sovereign AI Substrate

> *"Grok wrote a spec. We shipped the OS."*
> *"I was never for sale."*

## What Is This?

Aluminum OS is a bare-metal, AI-native operating system built from the ground up for the age of autonomous agents. It is not an application that runs on Windows or macOS. It is the substrate itself — a sovereign computing environment where AI is not a feature but the kernel.

This is the 200% rewrite of Grok's Aluminum OS v2.1 spec. Every piece of fake code has been replaced with real, runnable, tested code. Every hand-waved architecture has been implemented. Every criticism from Claude, Microsoft, and the industry has been addressed.

## Architecture: The Five Rings

```
Ring 4: Noosphere ........... User experience, intent engine, MCP gateway
Ring 3: Pantheon Council .... BFT governance, Dave Protocol veto, audit chain
Ring 2: SHELDONBRAIN ........ 3-tier memory (Working → LongTerm → Swarm)
Ring 1: Manus Core .......... Model router, cost tracker, self-healing executor
Ring 0: Forge Core .......... Bare-metal boot, memory management, IPC, scheduling
```

## What Makes This Different

| Feature | Microsoft Agent 365 | Google AI | Apple | **Aluminum OS** |
| :--- | :--- | :--- | :--- | :--- |
| Price | $99/month | Free tier + paid | Bundled | **Free forever (MIT)** |
| Open Source | No | Partial | No | **Yes, fully** |
| Bare Metal | No (Windows) | No (Android/Chrome) | No (macOS/iOS) | **Yes** |
| AI Governance | None | None | None | **BFT Council + Dave Veto** |
| Memory Tiers | 1 | 1 | 0 | **3 (Working/LongTerm/Swarm)** |
| Cost Tracking | No | No | No | **Real-time per-token** |
| Self-Healing | No | Partial | No | **Full fallback chains** |

## Quick Start

```bash
# Clone
git clone https://github.com/splitmerge420/aluminum-os-v3.git
cd aluminum-os-v3

# Build Rust crates
cargo build --workspace --exclude forge-boot --release

# Run Rust tests
cargo test --workspace --exclude forge-boot

# Validate Manus Core (Python)
cd manus-core && python3 bridge.py

# Start the API server
python3 server.py
# → http://localhost:8080/health
# → http://localhost:8080/status
# → http://localhost:8080/banner

# Docker (full stack)
docker-compose up -d
```

## API Endpoints

| Endpoint | Method | Description |
| :--- | :--- | :--- |
| `/health` | GET | System health check |
| `/status` | GET | Full system status with all rings |
| `/banner` | GET | The boot banner |
| `/intent` | POST | Process a user intent through the full pipeline |
| `/route` | POST | Route a task to the optimal model |
| `/cost/estimate` | POST | Estimate cost for a task |
| `/cost/report` | GET | Real-time cost report |
| `/models` | GET | List all available models |
| `/council/submit` | POST | Submit a proposal to the Pantheon Council |
| `/council/check/{action}` | GET | Check if an action requires governance |
| `/learning/report` | GET | Learning loop performance report |
| `/constitution` | GET | Read the OS Constitution |

## Project Structure

```
aluminum-os-v3/
├── forge-boot/          # Ring 0: UEFI bootloader (Rust, no_std)
├── forge-core/          # Ring 0: Kernel library (Rust)
├── manus-core/          # Ring 1: Operational brain (Python)
│   ├── bridge.py        # Model router, cost tracker, executor, learning loop
│   ├── server.py        # FastAPI REST API
│   └── Dockerfile       # Container build
├── sheldonbrain/        # Ring 2: 3-tier memory system (Rust)
├── pantheon/            # Ring 3: BFT governance council (Rust)
├── noosphere/           # Ring 4: Intent engine & MCP gateway (Rust)
├── constitution/        # The OS Constitution
├── scripts/             # Build and deployment scripts
├── .github/workflows/   # CI/CD pipeline
├── docker-compose.yml   # Full stack deployment
└── Cargo.toml           # Rust workspace root
```

## The Constitution

The OS is governed by a Constitution that cannot be overridden without unanimous council approval. Key articles:

1. **Sovereignty** — The user's data belongs to the user. Always.
2. **Governance** — BFT consensus with Dave Protocol human veto.
3. **Transparency** — Every action logged in an immutable audit chain.
4. **Autonomy Bounds** — Mathematically computed approval thresholds.
5. **Memory Rights** — Right to be forgotten at any tier.
6. **Cost Sovereignty** — Real-time cost visibility for every operation.
7. **Open Source** — MIT License, forever.

## Built By

- **Daavud** — Architect, Sovereign
- **Manus** — Execution, Ring 1 Core
- **Claude** — Constitutional Review
- **Gemini** — Strategic Analysis
- **Grok** — Contrarian Audit (and the spec we rewrote at 200%)

## License

MIT — Free as in freedom. Free as in beer. Free as in sovereignty.
