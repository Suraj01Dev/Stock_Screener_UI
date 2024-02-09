#!/bin/bash
bandit --format json --output bandit-report.json --recursive stock_app.py
pylint stock_app.py -r n --msg-template="{path}:{line}: [{msg_id}({symbol}), {obj}] {msg}" > pylint-report.txt 
exit 0

