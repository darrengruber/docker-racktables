#!/usr/bin/env bash

cat <<EOF > /usr/local/share/RackTables/wwwroot/inc/secret.php
<?php
\$pdo_dsn = 'mysql:host=mysql;dbname=$MYSQL_ENV_MYSQL_DATABASE';
\$db_username = '$MYSQL_ENV_MYSQL_USER';
\$db_password = '$MYSQL_ENV_MYSQL_PASSWORD';
#\$user_auth_src = 'database';
#\$require_local_account = TRUE;
EOF

chown www-data: /usr/local/share/RackTables/wwwroot/inc/secret.php
chmod 400 /usr/local/share/RackTables/wwwroot/inc/secret.php

exec apache2-foreground
