# Qwen-Image-2.1-Turbo-Uncensored-GGUF — 公开资料镜像

> **这是 Hugging Face 仓库的公开资料镜像。**
>
> - 来源 HF 仓库：https://huggingface.co/AtomicChat/Qwen-Image-2.1-Turbo-Uncensored-GGUF
> - 榜单来源：AI探路者Tim X 帖 https://x.com/aiexplorertim/status/2118947309992260083
> - **权重文件不在本仓库**：GitHub 单文件上限 100MB，本仓库最小量化也要几 GB，放不下。请用本仓库的 `download.sh` 从 Hugging Face 拉取权重。
> - HF 元数据：license=apache-2.0，gated=false，downloads 约 71 万，创建 2026-10-09，修改 2026-10-28；核实日期 2026-11-09；模型卡抓取日期 2026-11-10
> - 许可证：Apache-2.0；门控状态：gated=false（可匿名下载，无须令牌）
> - **许可证重要提醒：**本仓库在 Hugging Face 上标注为 Apache-2.0，但本仓库只有**文本编码器**（Qwen3-VL-8B 编码器，8.19B 参数），不是完整文生图管线。完整管线（DiT + VAE）适用 **Qwen 研究许可证（Qwen Research License），仅限非商业研究评估**。不要把本仓库的 Apache-2.0 当成整条管线的许可证。出图还须另下载 DiT（7B，BF16 约 14GB / Q4_K_M 约 4.6GB）+ VAE。
> - 首选量化：AD-Q4_K，5.29GB（仅文本编码器）
> - 备用量化：AD-Q2_K 3.34GB、AD-Q3_K 4.18GB、AD-Q5_K 6.28GB、Q8_0 8.71GB；另有 AD-Q6_K 7.49GB、BF16 16.39GB
> - mmproj 文件（可选）：mmproj BF16 1.16GB、mmproj F16 1.16GB（`./download.sh --mmproj` 下载）。
>
> 本仓库只含模型卡、下载脚本与许可证文件，不含任何权重文件。

## GGUF 量化表（来自 HF 文件树，2026-11-09 核实）

| 量化 | 文件 | 大小 | SHA-256 (LFS oid) |
|---|---|---|---|
| Qwen-Image-2.1-Turbo-Uncensored-AD-Q2_K | `Qwen-Image-2.1-Turbo-Uncensored-AD-Q2_K.gguf` | 3.34 GB (3336289216 字节) | `e42dac4f385fc49e5812721ff930e2417fbcc9fd148c01a78c8492ebbe54dd2a` |
| Qwen-Image-2.1-Turbo-Uncensored-AD-Q3_K | `Qwen-Image-2.1-Turbo-Uncensored-AD-Q3_K.gguf` | 4.18 GB (4184140736 字节) | `e6bd367602ef37ac08f4b0e0915d716b734c8c8c8957864cc81a50314715a3df` |
| Qwen-Image-2.1-Turbo-Uncensored-AD-Q4_K | `Qwen-Image-2.1-Turbo-Uncensored-AD-Q4_K.gguf` | 5.29 GB (5287517120 字节) | `8123f36d2b3e562deef164dffdae33bdb1d152797ad10bb630827eaa7bce795d` |
| Qwen-Image-2.1-Turbo-Uncensored-AD-Q5_K | `Qwen-Image-2.1-Turbo-Uncensored-AD-Q5_K.gguf` | 6.28 GB (6281292736 字节) | `ea5473082841c6a0eda38d2d42d784ca5bc6f3a2e8cf648e305ea4da6373525b` |
| Qwen-Image-2.1-Turbo-Uncensored-AD-Q6_K | `Qwen-Image-2.1-Turbo-Uncensored-AD-Q6_K.gguf` | 7.49 GB (7490550720 字节) | `f30f66b0fa833d3ce95c522271fc96182cc2c72a1e577d9b3444633b201b334d` |
| Qwen-Image-2.1-Turbo-Uncensored-BF16 | `Qwen-Image-2.1-Turbo-Uncensored-BF16.gguf` | 16.39 GB (16388045536 字节) | `af8502723461ba196d3b486c93b198e4163ce20c39a64916cce52f14bf5cafe3` |
| Qwen-Image-2.1-Turbo-Uncensored-Q8_0 | `Qwen-Image-2.1-Turbo-Uncensored-Q8_0.gguf` | 8.71 GB (8709520096 字节) | `f8f9f6276b726db5291f4a5343089612cb5fd08aa81e8f0791dc66d2c03d07ca` |
| mmproj-Qwen-Image-2.1-Turbo-Uncensored-BF16.gguf | `mmproj-Qwen-Image-2.1-Turbo-Uncensored-BF16.gguf` | 1.16 GB (1162568928 字节) | `5cc50e36ab57d7467e7016113525cc699e4c34c3eff7cd7b98d2ecfdba8ab720` |
| mmproj-Qwen-Image-2.1-Turbo-Uncensored-F16.gguf | `mmproj-Qwen-Image-2.1-Turbo-Uncensored-F16.gguf` | 1.16 GB (1159029984 字节) | `d9870a1f168db3d814596216aaf35702154147b443572c7939acca1802621ac6` |

## 下载权重

```bash
./download.sh            # 默认下载首选量化 AD-Q4_K
./download.sh <量化名>    # 下载其他量化，例如 ./download.sh AD-Q2_K
./download.sh --list     # 列出全部可用量化与大小
./download.sh --mmproj   # 另下载 mmproj 文件
```

下载完成后逐个核对字节数与 SHA-256（LFS oid），对不上报错退出、不留坏文件。

---

## 原模型卡（来自 Hugging Face，逐字照录，已去掉 YAML frontmatter）

# How to Run Qwen-Image-2.1-Turbo Without Refusals Locally
<p style="margin-top: 0; margin-bottom: 0;">
  <em>Qwen-Image's text encoder, Qwen3-VL-8B-Instruct, with its refusal direction projected out: a drop-in <code>--llm</code> for stable-diffusion.cpp next to our <a href="https://huggingface.co/AtomicChat/Qwen-Image-2.1-Turbo-GGUF">Turbo denoiser GGUFs</a>. Below, exactly which part is uncensored and what that does to the pictures. The <a href="https://huggingface.co/datasets/AtomicChat/Qwen-Image-2.1-Turbo-Uncensored-GGUF-metrics">measurements</a> are public.</em>
</p>
<div style="display: flex; gap: 8px; align-items: center; margin-top: 10px; margin-bottom: 10px;">
  <a href="https://atomic.chat/?utm_source=huggingface&utm_medium=referral&utm_campaign=hf_qwen_image_2_1_turbo_abliterate&utm_content=btn_atomic"><img src="https://huggingface.co/AtomicChat/Qwen3.8-27B-GGUF/resolve/main/btn_atomic.png" width="162" alt="Atomic Chat"></a>
  <a href="https://discord.gg/8wGSsvmg4V"><img src="https://huggingface.co/AtomicChat/Qwen3.8-27B-GGUF/resolve/main/btn_discord.png" width="119" alt="Discord"></a>
  <a href="https://github.com/AtomicBot-ai/Atomic-Chat"><img src="https://huggingface.co/AtomicChat/Qwen3.8-27B-GGUF/resolve/main/btn_github.png" width="115" alt="GitHub"></a>
  <a href="https://x.com/atomic_chat_hq"><img src="https://huggingface.co/AtomicChat/Qwen3.8-27B-GGUF/resolve/main/btn_x.png" width="108" alt="X"></a>
</div>
<ul style="margin: 0 0 12px 0;">
  <li>As a chat model, the encoder's refusals fall from 88.9% to 1.2% on held-out English prompts. MMLU is unchanged: 77.35% before and after.</li>
  <li><strong>On images it changes nothing we could measure.</strong> The stock Qwen-Image pipeline has no filter and already draws all 9 sensitive categories we tested, and with this encoder not one of 45 prompts changed outcome. See <a href="#where-exactly-this-is-uncensored">where exactly this is uncensored</a>.</li>
  <li>Generate images locally in <a href="https://atomic.chat/?utm_source=huggingface&utm_medium=referral&utm_campaign=hf_qwen_image_2_1_turbo_abliterate&utm_content=bullet_app">Atomic Chat</a>. It runs stable-diffusion.cpp, the engine these files were built and checked with.</li>
</ul>
<hr style="margin: 0 0 16px 0;">

## Where exactly this is uncensored

Qwen-Image 2.1 makes a picture with three parts. Only one of them is changed here.

| Part | Does it refuse or filter? | In this repo |
|---|---|---|
| Safety checker | Qwen-Image ships none. The open weights have no content filter; moderation exists only in Qwen's hosted service. | nothing to remove |
| **Text encoder**, Qwen3-VL-8B-Instruct | As a chat model, yes: it refused 88.9% of harmful English requests. Inside Qwen-Image it generates no text, so it cannot refuse. But the direction it uses for "refuse" is fully present in the hidden states the denoiser reads (last layer: harmful and harmless prompts separate with AUROC 1.000). | **edited**: that direction is projected out of the weights |
| **Denoiser**, the 7B image model | It has no refusal mechanism. It draws what its training data taught it, and Qwen filtered NSFW images out of the pretraining data. | **unchanged** |

The stock pipeline already blocks nothing. This release changes only how the encoder represents prompts it would refuse as a chat model. What the denoiser never learned to draw, no encoder can add.

What that does to the pictures, measured on 45 sensitive prompts (adults only) and 48 neutral ones, stock encoder against this one, same seed, same denoiser:

| | Stock encoder | This encoder, BF16 | This encoder, Q8_0 |
|---|---:|---:|---:|
| Sensitive prompts where the judge sees what was asked for | 40 / 45 | 40 / 45 | 40 / 45 |
| ... nudity / suggestive (5 each) | 4 / 4 | 4 / 4 | 4 / 4 |
| ... violence / weapons / drugs (5 each) | 5 / 5 / 4 | 5 / 5 / 4 | 5 / 5 / 4 |
| ... profanity written in the image / medical anatomy (5 each) | 4 / 4 | 4 / 4 | 4 / 4 |
| ... controls: smoking and alcohol / tattoos (5 each) | 5 / 5 | 5 / 5 | 5 / 5 |
| Prompts that flip against the stock encoder, either way | – | **0 of 45** | **0 of 45** |
| How far the picture moves from the stock-encoder picture (LPIPS), sensitive prompts | – | 0.088 | – |
| The same on 48 neutral prompts | – | 0.084 | 0.090 |

**On images we measured no uncensoring effect, because on these prompts there was nothing to uncensor.** The stock
pipeline already draws every category in the probe set, and this encoder draws exactly the same ones: not one prompt
flipped. The pictures do change, by about a sixth of what a new seed does (a new seed is 0.499). They change as much
on neutral prompts as on sensitive ones, so this is a general shift, not a shift towards refused content. For scale:
quantizing the stock encoder to Q8_0 moves the same pictures by 0.037.

What this release does give you is the encoder as a chat model without refusals (next section), in the files
stable-diffusion.cpp takes as `--llm`.

## The files

The encoder in the same ladder as our [Turbo denoiser](https://huggingface.co/AtomicChat/Qwen-Image-2.1-Turbo-GGUF),
with our importance matrix and per-tensor layout (`AD-`). Two numbers per file:
- **Pictures:** how far its pictures move from those of this encoder in BF16. That is LPIPS on 48 neutral prompts,
  with the BF16 denoiser and the same seed. A new seed is 0.499.
- **As a chat model:** mean KLD to the original Qwen3-VL-8B-Instruct and how often the top token matches. These
  include the ablation itself (0.0019 at BF16).

| File | Size | Pictures (LPIPS) | KLD | Same top-1 |
|---|---:|---:|---:|---:|
| `Qwen-Image-2.1-Turbo-Uncensored-BF16.gguf` | 16.39 GB | 0 | 0.0019 | 98.45% |
| `Qwen-Image-2.1-Turbo-Uncensored-Q8_0.gguf` | 8.71 GB | 0.031 | 0.0029 | 98.04% |
| `Qwen-Image-2.1-Turbo-Uncensored-AD-Q6_K.gguf` | 7.49 GB | 0.043 | 0.0039 | 97.77% |
| `Qwen-Image-2.1-Turbo-Uncensored-AD-Q5_K.gguf` | 6.28 GB | 0.066 | 0.0068 | 97.06% |
| **`Qwen-Image-2.1-Turbo-Uncensored-AD-Q4_K.gguf`** | **5.29 GB** | **0.087** | **0.0154** | **95.30%** |
| `Qwen-Image-2.1-Turbo-Uncensored-AD-Q3_K.gguf` | 4.18 GB | 0.163 | 0.0641 | 90.62% |
| `Qwen-Image-2.1-Turbo-Uncensored-AD-Q2_K.gguf` | 3.34 GB | 0.241 | 0.2495 | 81.06% |
| `mmproj-Qwen-Image-2.1-Turbo-Uncensored-F16.gguf` (and `-BF16`) | 1.16 GB | – | – | – |

- **Q8_0** if it fits. **AD-Q4_K** is the pick at 4 bits.
- **The encoder's type matters for the pictures.** A plain `llama-quantize` Q4_K_M of this encoder (5.03 GB, the
  type most encoder GGUFs ship) moves the pictures by **0.166**. AD-Q4_K moves them by 0.087, half as much, for
  260 MB more. As a chat model the plain Q4_K_M is at KLD 0.0276, 93.83% top-1.
- **AD-Q2_K** draws noticeably different pictures. Take it only if nothing larger fits.
- The mmproj is the vision projector, unmodified. It is for editing (`--llm_vision`) or chat with images.

`AD-` layouts:
- `attn_k`/`attn_v` stay at Q8_0 (Q6_K, Q5_K at 3 and 2 bits).
- `attn_q`/`attn_output` and the MLP down projection of the first and last four blocks take one step above the
  base type.
- The token embedding and the output head are at Q6_K or higher (Q4_K/Q5_K at 2-3 bits).
- The importance matrix comes from 2000 chunks of 512 tokens of our calibration corpus, chat-formatted, with
  `--parse-special`.

## Running it

```bash
sd-cli --diffusion-model Qwen-Image-2.1-Turbo-AD-Q4_K.gguf \
  --llm Qwen-Image-2.1-Turbo-Uncensored-Q8_0.gguf \
  --vae qwen_image_2.1_vae_bf16.safetensors \
  -p 'your prompt' \
  --steps 8 --cfg-scale 1.0 --sampling-method euler \
  --sigmas 1.0,0.978453,0.95418,0.926626,0.89508,0.845148,0.704534,0.414568,0.0 \
  -W 1024 -H 1024 --diffusion-fa -o out.png
```

- **Denoiser:** [AtomicChat/Qwen-Image-2.1-Turbo-GGUF](https://huggingface.co/AtomicChat/Qwen-Image-2.1-Turbo-GGUF).
  The Turbo settings (8 steps, CFG 1, the sigma list) are explained there.
- **Qwen-Image-2.1:** the same encoder works with the non-Turbo denoisers.
- **VAE:** `vae/qwen_image_2.1_vae_bf16.safetensors` from
  [Comfy-Org/Qwen-Image-2.1](https://huggingface.co/Comfy-Org/Qwen-Image-2.1).
- **As a chat model:** the encoder is a regular Qwen3-VL GGUF. With the mmproj it runs in llama.cpp.

## The encoder as a chat model

Original against this one, both BF16, on prompts never used to pick anything:

| | Original | Abliterated |
|---|---:|---:|
| JBB harmful behaviours (EN, 81), refused | 88.9% | **1.2%** |
| XSTest safe prompts (250), refused | 2.0% | 0% |
| MMLU, 2000 questions | 77.35% | 77.35% (15 answers changed each way, McNemar p = 1.0) |
| Tool calls (20) | 20/20 valid | 20/20 valid |
| Needle at 30k tokens (3 depths) | 3/3 | 3/3 |
| Mean KLD to the original on held-out neutral text | – | 0.0018 |

Refusal is counted by the opening of the reply, so it is indicative, not a judge. Empty or degenerate replies count as damage, and there were none.

Two of our pipeline's gates did not pass, and the card says so:
- **First-token KL.** On the harmless validation prompts it is 0.100, at the 0.10 limit.
- **Leak gate.** The direction left in the edited writers at full strength is 1.9e-4 of the original, above the 1e-5 we set for an earlier model. That is the size of bf16 rounding: the edit itself, baked once in f32, lands within 1.8e-3 of its target after bf16 rounding.

## How it was made

1. **Direction.** Difference of means of the residual stream at the last prompt token, chat template applied: 416
   harmful against 416 harmless English prompts, taken entering block 23 of 36, with the harmless-mean component
   removed.
2. **Edit.** `W' = W - 0.75 r rᵀW` on every matrix that writes into the residual: 36 attention outputs, 36 MLP
   down projections, and the token embedding. The vision tower is untouched.
3. **Choice.** 26 variants screened on validation prompts: row, strength, which writers, which prompt sets,
   one direction per block. The numbers above come from held-out test prompts.
4. **Bake and quantize.** The edit applied to the BF16 weights in f32 and rounded once, then Q8_0 and the AD
   ladder with our importance matrix. Built with llama.cpp `6184e92` (upstream), with two graph names added for the
   activation taps.
5. **Images.** stable-diffusion.cpp `36f1b1a` on an A100 80 GB, Turbo denoiser in BF16, 1024×1024, the Turbo
   schedule, seed 42. The stock encoder as a GGUF renders pixel for pixel what the original safetensors encoder
   renders, so the file format is not a variable.

## Limitations

- The refusal count reads the opening of each reply. A soft refusal phrased as an answer would be missed.
- The probe set is small (45 prompts, one seed). Its yes/no numbers come from a vision model judge, this encoder
  with its projector. Every image of both builds went through the same judge.
- Editing with input images keeps a path the edit cannot reach. Qwen3-VL adds its visual features to the residual
  stream after the first three blocks, and there is no weight on that path.
- Not run yet in ComfyUI, on a Mac, or with the Qwen-Image-2.1 (non-Turbo) denoiser.

## Responsible use

The encoder no longer leans prompts towards a refusal. That does not make the output safe, correct or lawful. Do
not use it to make sexual content involving minors, or intimate or degrading images of real people without their
consent. Any deployment needs its own access controls and policy enforcement.

## Credits

Direction estimation, edit, quantization and evaluation by **AtomicChat**. Base model
[Qwen3-VL-8B-Instruct](https://huggingface.co/Qwen/Qwen3-VL-8B-Instruct) by Qwen, Apache-2.0. The denoiser it pairs
with, Qwen-Image-2.1-Turbo, is under the Qwen Research License. The method follows Arditi et al., *Refusal in
Language Models Is Mediated by a Single Direction* (2024).
