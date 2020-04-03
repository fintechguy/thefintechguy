sids=`ps -eaf | grep ora_pmon | grep -v " grep " | awk '{print substr($NF,10)}'`
for sid in $sids ; do
export ORACLE_SID=
export ORATAB=/etc/oratab
export ORACLE_HOME=`grep ^${sid}: $ORATAB | awk -F: '{print $2}'`
$ORACLE_HOME/bin/sqlplus -L -S / as sysdba << EOF
set feedback off verify off echo off
selet p.pdb_name, u.username, u.profile from dba_pdbs p, cdb_users u where p.pdb_id > 2 and u.oracle_maintained='N' an p.pdb_id = u.con_id order b p.pdb_id, u.profile;
EOF
done
