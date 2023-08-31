#!/bin/bash

m4t_predict "$1" t2tt kor --src_lang eng --model_name=seamlessM4T_medium 2>&1 | grep -v cached | grep -v "torch.float32" | cut -c 86-
