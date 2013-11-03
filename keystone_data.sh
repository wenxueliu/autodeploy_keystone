#! /bin/sh

get_id ( ) {
	echo `$@ | awk '/ id / { print $4 } '` 
}

export SERVICE_TOKEN=admin
export SERVICE_ENDPOINT=http://10.1.2.112:35357/v2.0

ADMIN_TENANT=$(get_id keystone tenant-create --name=adminTenant \
                                             --enable=true)
ADMIN_USER=$(get_id keystone user-create --name=admin \
                                          --pass=openstack \
                                          --enable=true )
ADMIN_ROLE=$(get_id keystone role-create --name=adminRole)
echo $ADMIN_TENANT
echo $ADMIN_ROLE
echo $ADMIN_USER
keystone user-role-add --user $ADMIN_USER --role $ADMIN_ROLE --tenant_id $ADMIN_TENANT
