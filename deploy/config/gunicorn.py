import os
import multiprocessing as mp

# bind
HOST = os.getenv('HOST', '0.0.0.0')
PORT = os.getenv('PORT', 5000)
bind = '{}:{}'.format(HOST, PORT)
# workers
workers = os.getenv('WORKERS', mp.cpu_count() * 2 + 1)
# logging
accesslog = '-'
