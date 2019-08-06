#!/bin/env bash

# --security-opt seccomp:unconfined
# --mount type=bind,source=/sys/fs/cgroup,target=/sys/fs/cgroup \
# --mount type=bind,source=/sys/fs/fuse,target=/sys/fs/fuse \
# --mount type=tmpfs,destination=/run \
# --mount type=tmpfs,destination=/run/lock

ssudd='';
access_user_share='sensor-dream';

source_config_share='/mnt/sda/Development/docker_share/container/centos_lap/config';
target_config_share='Host_share/config';

source_www_share='/mnt/sda/Development/www_share';
target_www_share='Host_share/www';

source_var_log_share='/mnt/sda/Development/docker_share/container/centos_lap/var/log';
target_var_log_share='/var/log';

source_var_cache_share='/mnt/sda/Development/docker_share/container/centos_lap/var/cache';
target_var_cache_share='/var/cache';

source_var_tmp_share='/mnt/sda/Development/docker_share/container/centos_lap/var/tmp';
target_var_tmp_share='/var/tmp';

source_run_share='/mnt/sda/Development/docker_share/container/centos_lap/run';
target_run_share='/run';

source_tmp_share='/mnt/sda/Development/docker_share/container/centos_lap/tmp';
target_tmp_share='/tmp';


[[ "$(echo $USER)" != 'root'  ]] && ssudd='sudo';

[[  ! -f "/$source_config_share"  ]] && $($ssudd mkdir -p -m 0775 "/$source_config_share" && $ssudd chown $access_user_share.$access_user_share "/$source_config_share");
[[  ! -f "/$source_www_share"  ]] && $($ssudd mkdir -p -m 0775 "/$source_www_share" && $ssudd chown $access_user_share.$access_user_share "/$source_www_share");
[[  ! -f "/$source_var_log_share"  ]] && $($ssudd mkdir -p -m 0775 "/$source_var_log_share" && $ssudd chown $access_user_share.$access_user_share "/$source_var_log_share");
[[  ! -f "/$source_var_cache_share"  ]] && $($ssudd mkdir -p -m 0775 "/$source_var_cache_share" && $ssudd chown $access_user_share.$access_user_share "/$source_var_cache_share");
[[  ! -f "/$source_var_tmp_share"  ]] && $($ssudd mkdir -p -m 0775 "/$source_var_tmp_share" && $ssudd chown $access_user_share.$access_user_share "/$source_var_tmp_share");
[[  ! -f "/$source_run_share"  ]] && $($ssudd mkdir -p -m 0775 "/$source_run_share" && $ssudd chown $access_user_share.$access_user_share "/$source_run_share");
[[  ! -f "/$source_tmp_share"  ]] && $($ssudd mkdir -p -m 0775 "/$source_tmp_share" && $ssudd chown $access_user_share.$access_user_share "/$source_tmp_share");

docker run \
  -p 9090:9090 -p 9091:9091 -p 9092:9092 -p 9093:9093 -p 9094:9094 \
  -p 9095:9095 -p 9096:9096 -p 9097:9097 -p 9098:9098 -p 9099:9099 \
  --detach \
  --privileged \
  --name=centos-lap \
  --mount type=bind,source=/"$source_config_share",target=/"$target_config_share",readonly \
  --mount type=bind,source=/"$source_www_share",target=/"$target_www_share" \
  --mount type=bind,source=/"$source_var_log_share",target=/"$target_var_log_share" \
  --mount type=bind,source=/"$source_var_cache_share",target=/"$target_var_cache_share" \
  --mount type=bind,source=/"$source_var_tmp_share",target=/"$target_var_tmp_share" \
  --mount type=bind,source=/"$source_run_share",target=/"$target_run_share" \
  --mount type=bind,source=/"$source_tmp_share",target=/"$target_tmp_share" \
  centos-lap

. docker_install_centos_lap_service.bash
