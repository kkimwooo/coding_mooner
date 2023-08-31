#!/bin/bash

m4t_predict "$1" t2tt eng --src_lang kor --model_name=seamlessM4T_medium 2>&1 | grep -v cached | grep -v "torch.float32" | cut -c 86-
