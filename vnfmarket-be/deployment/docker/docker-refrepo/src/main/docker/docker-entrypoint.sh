#!/bin/bash
#
# Copyright 2016-2017 Huawei Technologies Co., Ltd.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# vnf-sdk-marketplace/target/docker-entrypoint.sh
#

umask 000 && sudo chmod +x /service/bin/*.sh /service/*.sh && mkdir -p /service/logs && mkdir -p /var/log/nginx/ && sudo chown -R vnfadmin:vnfadmin /var/log/nginx/ /service/ /opt/vtp /var/log && sudo chmod -R +w /service/ /opt/vtp /var/log && sudo touch /run/nginx.pid && sudo chown -R vnfadmin:vnfadmin /run/nginx.pid && chmod 644 /run/nginx.pid  && sudo chown -R vnfadmin:vnfadmin /var/log/nginx/ && sudo usermod -aG www-data vnfadmin && sudo chmod -R a+w /var/lib/nginx

if [ -z "$SERVICE_IP" ]; then
    export SERVICE_IP=`hostname -i`
fi
if [ -z "$POSTGRES_SERVICE_HOST" ]; then
    export POSTGRES_SERVICE_HOST=127.0.0.1
fi

echo
echo Environment Variables:
echo "SERVICE_IP=$SERVICE_IP"


echo

# Configure service based on docker environment variables
./instance-config.sh



# Perform one-time config
if [ ! -e init.log ]; then
    # Perform workarounds due to defects in release binary
    ./instance-workaround.sh



    # microservice-specific one-time initialization
    ./instance-init.sh

    date > init.log
fi

# Start the microservice
./instance-run.sh
