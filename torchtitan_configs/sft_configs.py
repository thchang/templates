# Copyright (c) Meta Platforms, Inc. and affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

"""Fine-tuning configs for Llama 3.

`--module llama3` only auto-discovers config_registry.py, so select configs
in this file with the fully qualified module path, e.g.:

    MODULE=path.from.torchtitan.base.to.sft_configs CONFIG=llama3_8b_sft ./run_train.sh
"""

from torchtitan.hf_datasets.text_datasets import ChatDataLoader
from torchtitan.trainer import Trainer

from .config_registry import llama3_8b

MODEL_PATH="/path/to/Models/Llama-3.1-8B-Instruct"


def llama3_8b_sft() -> Trainer.Config:
    """Fine-tune the pretrained Llama 3.1 8B Instruct checkpoint on a chat dataset.

    Uses the Instruct variant (not the base model) because ChatDataLoader
    requires a chat_template in tokenizer_config.json, which only the
    Instruct release ships.

    Swap out `dataset_path` / `load_dataset_kwargs` / `process_sample` below
    for your own dataset -- see docs/datasets.md for single-source and
    interleaved SFT dataloader options.
    """

    # Default dataset: openai/gsm8k, single-turn [user, assistant] pairs.
    # Replace with your own HF dataset path (or "json"/"csv" plus a local
    # path via load_dataset_kwargs={"data_files": ...}), and update
    # process_sample to map your dataset's fields into a
    # [{"role": "user", ...}, {"role": "assistant", ...}] pair.
    def process_sample(sample: dict) -> list[dict]:
        return [
            {"role": "user", "content": sample["question"]},
            {"role": "assistant", "content": sample["answer"]},
        ]

    config = llama3_8b()
    # Load pretrained HF weights from `hf_assets_path` instead of random init.
    config.checkpoint.initial_load_in_hf = True
    config.hf_assets_path = MODEL_PATH
    config.dataloader = ChatDataLoader.Config(
        dataset_path="openai/gsm8k",
        load_dataset_kwargs={"name": "main", "split": "train"},
        sample_processor=process_sample,
    )
    return config
