# ~/.local/bin/accelerate launch  \
accelerate launch  \
--num_processes=1  \
--mixed_precision="fp16"  \
peft_lora_embedding_semantic_search.py   \
--dataset_name="../data/quora_dq_train.csv"   \
--max_length=70   \
--model_name_or_path="intfloat/e5-small-v2"   \
--per_device_train_batch_size=64   \
--per_device_eval_batch_size=128   \
--learning_rate=5e-4   \
--weight_decay=0.0   \
--num_train_epochs 3   \
--gradient_accumulation_steps=1   \
--output_dir="../model/peft_lora_e5"   \
--with_tracking   \
--report_to="tensorboard"   \
--seed=42   \
--use_peft \
--checkpointing_steps "epoch" \
--dataset_handling "streaming"
# --dataset_handling "memory"

# --model_name_or_path="intfloat/multilingual-e5-large-instruct"   \
