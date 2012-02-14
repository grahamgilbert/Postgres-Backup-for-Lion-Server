#!/bin/bash

FINAL_BACKUP_DIR=/Backups/Postgres
pguser=_postgres
psql=/usr/bin/psql
pg_dumpall=/usr/bin/pg_dumpall

if ! mkdir -p $FINAL_BACKUP_DIR; then
        echo "Cannot create backup directory in $FINAL_BACKUP_DIR. Go and fix it!"
        exit 1;
fi;

mkdir -p $FINAL_BACKUP_DIR/01
mkdir -p $FINAL_BACKUP_DIR/02
mkdir -p $FINAL_BACKUP_DIR/03
mkdir -p $FINAL_BACKUP_DIR/04
mkdir -p $FINAL_BACKUP_DIR/05
mkdir -p $FINAL_BACKUP_DIR/06
mkdir -p $FINAL_BACKUP_DIR/07

rm -rf $FINAL_BACKUP_DIR/07
mv $FINAL_BACKUP_DIR/06 $FINAL_BACKUP_DIR/07
mv $FINAL_BACKUP_DIR/05 $FINAL_BACKUP_DIR/06
mv $FINAL_BACKUP_DIR/04 $FINAL_BACKUP_DIR/05
mv $FINAL_BACKUP_DIR/03 $FINAL_BACKUP_DIR/04
mv $FINAL_BACKUP_DIR/02 $FINAL_BACKUP_DIR/03
mv $FINAL_BACKUP_DIR/01 $FINAL_BACKUP_DIR/02

mkdir $FINAL_BACKUP_DIR/01

if ! $pg_dumpall -U $pguser --clean | gzip > $FINAL_BACKUP_DIR/01/$(date +%Y-%0m-%0d_%0H%0M.sql.gz.partial); then
        echo "[!!ERROR!!] Failed to produce backup"
else
        mv $FINAL_BACKUP_DIR/01/$(date +%Y-%0m-%0d_%0H%0M.sql.gz.partial) $FINAL_BACKUP_DIR/01/$(date +%Y-%0m-%0d_%0H%0M.sql.gz)
fi

$pg_dump -U $pguser device_management -c -f $backuplocation
$psql -U $pguser -d device_management -c "REINDEX table public.apn_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.auto_join_profiles;"
$psql -U $pguser -d device_management -c "REINDEX table public.cal_dav_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.cal_sub_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.card_dav_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.certificate_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.cfprefs_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.data_files;"
$psql -U $pguser -d device_management -c "REINDEX table public.device_groups;"
$psql -U $pguser -d device_management -c "REINDEX table public.device_groups_devices;"
$psql -U $pguser -d device_management -c "REINDEX table public.devices;"
$psql -U $pguser -d device_management -c "REINDEX table public.devices_provisioning_profiles;"
$psql -U $pguser -d device_management -c "REINDEX table public.directory_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.dock_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.dock_knob_sets_system_applications;"
$psql -U $pguser -d device_management -c "REINDEX table public.email_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.energy_saver_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.enet_addresses;"
$psql -U $pguser -d device_management -c "REINDEX table public.exchange_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.general_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.group_mappings;"
$psql -U $pguser -d device_management -c "REINDEX table public.ichat_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.interface_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.ios_application_library_item_relations;"
$psql -U $pguser -d device_management -c "REINDEX table public.ios_applications;"
$psql -U $pguser -d device_management -c "REINDEX table public.knob_sets_profiles;"
$psql -U $pguser -d device_management -c "REINDEX table public.lab_sessions;"
$psql -U $pguser -d device_management -c "REINDEX table public.ldap_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.login_item_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.login_item_knob_sets_system_applications;"
$psql -U $pguser -d device_management -c "REINDEX table public.login_window_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.mac_restrictions_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.mac_restrictions_knob_sets_system_applications;"
$psql -U $pguser -d device_management -c "REINDEX table public.mac_restrictions_knob_sets_widgets;"
$psql -U $pguser -d device_management -c "REINDEX table public.mcx_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.members_profiles;"
$psql -U $pguser -d device_management -c "REINDEX table public.mobility_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.parental_controls_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.printers;"
$psql -U $pguser -d device_management -c "REINDEX table public.printers_printing_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.printing_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.privacy_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.profiles;"
$psql -U $pguser -d device_management -c "REINDEX table public.provisioning_profiles;"
$psql -U $pguser -d device_management -c "REINDEX table public.restrictions_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.scep_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.schema_migrations;"
$psql -U $pguser -d device_management -c "REINDEX table public.sessions;"
$psql -U $pguser -d device_management -c "REINDEX table public.settings;"
$psql -U $pguser -d device_management -c "REINDEX table public.software_update_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.system_applications;"
$psql -U $pguser -d device_management -c "REINDEX table public.tasks;"
$psql -U $pguser -d device_management -c "REINDEX table public.user_groups;"
$psql -U $pguser -d device_management -c "REINDEX table public.users;"
$psql -U $pguser -d device_management -c "REINDEX table public.vpn_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.web_clip_knob_sets;"
$psql -U $pguser -d device_management -c "REINDEX table public.widgets;"
$psql -U $pguser -d device_management -c "REINDEX table public.wifi_knob_sets;"

exit 0;

