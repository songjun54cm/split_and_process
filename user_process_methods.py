__author__ = 'JunSong<songjun54cm@gmail.com>'
# functions need to be implemented:
# - get_one_sample
# - process_one_sample
# - write_one_sample

def get_one_sample(in_ff):
    """
    :param in_ff:
        file handle can read in
    :return: one sample item
    """
    
    raise NotImplementedError('function get_one_sample is not implemented.')

    line = in_ff.readline()
    if not line:
        return None
    else:
        # 
        # NEED TO IMPLEMENTED:
        # 
        # get one sample here and return it.
        # 
        return sample

def process_one_sample(in_sample):
    """
    :param in_sample:
        the old sample not processed.
    :return the new sample after process.
    """
    #
    # NEED TO BE IMPLEMENTED:
    # 
    # process one sample.
    # 
    raise NotImplementedError('function process_one_sample is not implemented.')

    return new_sample

def write_one_sample(new_sample, out_ff):
    """
    :param new_sample:
        the processed sample need to be write to file.
    :param out_ff:
        file handle can be write to.
    :no return
    """
    # 
    # NEED TO IMPLEMENTED:
    # 
    # write the new_sample to out_ff here
    # 
    raise NotImplementedError('function write_one_sample is not implemented.')


def get_all_samples(in_file):
    """
    :param in_file:
        path of input file
    :return: list of items
    """
    in_ff = open(in_file, mode='rb')
    samples = []

    item = get_one_sample(in_ff)
    while(item is not None):
        samples.append(item)
        item = get_one_sample(in_ff)

    in_ff.close()
    return samples

    