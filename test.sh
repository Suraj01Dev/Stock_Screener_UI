#!/bin/bash
pylint stock_app.py -r n --msg-template="{path}:{line}: [{msg_id}({symbol}), {obj}] {msg}" > pylint-report.txt 

