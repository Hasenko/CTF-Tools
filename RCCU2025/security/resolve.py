import psycopg2

# Database connection parameters
default = {'ATOMIC_REQUESTS': False,
             'AUTOCOMMIT': True,
             'CONN_HEALTH_CHECKS': False,
             'CONN_MAX_AGE': 0,
             'ENGINE': 'django.db.backends.postgresql',
             'HOST': 'cha.ccu-ctf.be',
             'NAME': 'postgres',
             'OPTIONS': {},
             'PASSWORD': 'iopIuT5pJ8dKnEbwY3RxF7vaIO',
             'PORT': '5432',
             'TEST': {'CHARSET': None,
                      'COLLATION': None,
                      'MIGRATE': True,
                      'MIRROR': None,
                      'NAME': None},
             'TIME_ZONE': None,
             'USER': 'postgres'}

# Connect to the database
try:
    conn = psycopg2.connect(**default)
    print("Connection successful!")
except Exception as e:
    print(f"Connection failed: {e}")