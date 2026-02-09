def cuda_library(**kwargs):
    # Stub: treat as regular cc_library for CPU-only builds.
    native.cc_library(**kwargs)

def if_cuda(if_true, if_false = []):
    return if_false

def if_cuda_exec(if_true, if_false = []):
    return if_false

def if_cuda_is_configured(if_true, no_cuda = []):
    return no_cuda

def if_cuda_newer_than(wanted_ver, if_true, if_false = []):
    return if_false

def is_cuda_configured():
    return False

def cuda_gpu_architectures():
    return []
