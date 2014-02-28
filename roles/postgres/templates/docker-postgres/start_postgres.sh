#!/bin/bash
DATADIR=/data
BINDIR={{ postgres.bin_dir }}
CONFDIR={{ postgres.conf_dir }}

# test if DATADIR is existent
if [ ! -d $DATADIR ]; then
  echo "Creating Postgres data at $DATADIR"
  mkdir -p $DATADIR
fi

# test if DATADIR has content
if [ ! "$(ls -A $DATADIR)" ]; then
  echo "Initializing Postgres Database at $DATADIR"
  chown -R postgres $DATADIR
  su - postgres -c "$BINDIR/initdb $DATADIR -E 'UTF-8' --lc-collate='en_US.UTF-8' --lc-ctype='en_US.UTF-8'"
  su - postgres -c "$BINDIR/postgres --single -D $DATADIR -c config_file=$CONFDIR/postgresql.conf" <<< "CREATE USER $POSTGRES_SU_USER WITH SUPERUSER ENCRYPTED PASSWORD '$POSTGRES_SU_PASSWORD';"
  su - postgres -c "$BINDIR/postgres --single -D $DATADIR -c config_file=$CONFDIR/postgresql.conf" <<< "CREATE USER $POSTGRES_USER WITH ENCRYPTED PASSWORD '$POSTGRES_PASSWORD';"
  su - postgres -c "$BINDIR/postgres --single -D $DATADIR -c config_file=$CONFDIR/postgresql.conf" <<< "CREATE DATABASE $POSTGRES_DB OWNER $POSTGRES_USER;"
  su - postgres -c "$BINDIR/postgres --single -D $DATADIR -c config_file=$CONFDIR/postgresql.conf" <<< "GRANT ALL ON DATABASE $POSTGRES_DB TO $POSTGRES_USER;"
fi

# don't expose to linked containers
unset POSTGRES_SU_USER
unset POSTGRES_SU_PASSWORD

su - postgres -c "$BINDIR/postgres -D $DATADIR -c config_file=$CONFDIR/postgresql.conf"
