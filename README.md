# split_and_process
scripts to split one big file to multiple files and process them in parallel.

## requirements
following tools are required:
- bash
- screen
- python

## adapt
modify following files to adapt your data:
- user_process_methods.py
- user_one_process.sh

file `user_process_methods.py` provides methods for `get item from file`, `process item` and `write item to file`.

if you do not use python to process you data, you need to modify `user_one_process.sh` to adapt your command.

## usage
after adapt the method to your data, run `split_and_process.sh`.
Example:
```
bash ./split_and_process.sh data.txt 100 10 0 0
```

after the all the processes finish, run `merge_files.sh` to merge them in to one file called `processed_***`
Example:
```
bash ./merge_files.sh data.txt 100
```
this will give you `processed_data.txt` as the process result.