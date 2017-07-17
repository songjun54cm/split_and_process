__author__ = 'JunSong<songjun54cm@gmail.com>'
import argparse
import os
import time
import datetime
from user_process_methods import get_all_samples, process_one_sample, write_one_sample


def main(config):
    in_file = config['in_file']
    out_file = config['out_file']
    temp_folder, temp_fname=os.path.split(config['in_file'])
    finish_flag_file=os.path.join(temp_folder, 'finish', 'flag_%s'%temp_fname)

    fname = os.path.basename(in_file)
    count = 0
    print('input file: %s' % in_file)
    # in_ff = open(in_file, mode='rb')
    print('output file: %s' % out_file)
    new_ff = open(out_file, mode='wb')

    all_samples = get_all_samples(in_file)
    num_samples = len(all_samples)
    print('read all lines.')
    in_ff.close()
    for sample in all_samples:
        new_sample = process_one_sample(sample)
        count += 1
        write_one_sample(new_sample, new_ff)
        print('%6d/%6d-th %s sample in %.3f seconds at time: %s.' %
              (count, num_samples, fname, etime, datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")))

    print('finish %s' % fname)
    new_ff.close()
    flg_f = open(finish_flag_file, 'wb')
    flg_f.write('finish!')
    flg_f.close()


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--in_file', dest='in_file', type=str)
    parser.add_argument('--out_file', dest='out_file', type=str)
    parser.add_argument('--debug', dest='debug', type=bool, default=False)
    args = parser.parse_args()
    config = vars(args)
    if config['debug']:
        print config
    main(config)