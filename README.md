# split_and_process
scripts to split one big file to multiple files and process them in parallel.

## requirements
following tools are required:
- bash
- screen
- python

## usage
modify following files to adapt your data:
- user_process_methods.py
- user_one_process.sh

file `user_process_methods.py` provides methods for `get item for file`, `process item` and `write item to file`.

if you do not use python to process you data, you need to modify `user_one_process.sh` to adapt your command.
