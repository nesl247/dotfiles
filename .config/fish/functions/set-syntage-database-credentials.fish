function set-syntage-database-credentials --argument-names 'environment'
    argparse c/clear r/role e/envFile -- $argv or return

    if not set -ql _flag_envFile
        set envFile ".env.dev.local"
    end

    if set -ql _flag_clear
        sed -ie "/^DATABASE_HOST=.*/d" $envFile
        sed -ie "/^DATABASE_NAME=.*/d" $envFile
        sed -ie "/^DATABASE_USER=.*/d" $envFile
        sed -ie "/^DATABASE_PASSWORD=.*/d" $envFile
        sed -ie "/^DATABASE_REPLICA_HOST=.*/d" $envFile
        sed -ie "/^DATABASE_REPLICA_NAME=.*/d" $envFile
        sed -ie "/^DATABASE_REPLICA_USER=.*/d" $envFile
        sed -ie "/^DATABASE_REPLICA_PASSWORD=.*/d" $envFile

        return
    end

    if test -z "$environment"
        echo "You must specify an environment!"
        return 1
    end

    if not set -ql _flag_role
        set role "read_only"
    end

    set environmentEnv (string upper "$environment")
    set database_host (eval echo \$DATABASE_HOST_"$environmentEnv")
    if test -z "$database_host"
        echo "You must have set DATABASE_HOST_$environmentEnv"

        return 1
    end

    set database_name (eval echo \$DATABASE_NAME_"$environmentEnv")
    if test -z "$database_name"
        echo "You must have set DATABASE_NAME_$environmentEnv"

        return 1
    end

    set application (path basename (pwd | sed 's/\./-/g'))

    echo "Retrieving credentials from vault..."
    set credentials (vault read "databases/$environment/creds/$role.$application" -format=json)

    if not test $status
        echo "Failed to get credentials"

        return 1
    end

    set username (echo $credentials | jq -r .data.username)
    set password (echo $credentials | jq -r .data.password)

    echo "Updating $envFile entry..."

    if test -f $envFile
        sed -ie "/^DATABASE_HOST=.*/d" $envFile
        sed -ie "/^DATABASE_NAME=.*/d" $envFile
        sed -ie "/^DATABASE_USER=.*/d" $envFile
        sed -ie "/^DATABASE_PASSWORD=.*/d" $envFile
        sed -ie "/^DATABASE_REPLICA_HOST=.*/d" $envFile
        sed -ie "/^DATABASE_REPLICA_NAME=.*/d" $envFile
        sed -ie "/^DATABASE_REPLICA_USER=.*/d" $envFile
        sed -ie "/^DATABASE_REPLICA_PASSWORD=.*/d" $envFile
    end

    echo "DATABASE_HOST=$database_host" >> $envFile
    echo "DATABASE_NAME=$database_name" >> $envFile
    echo "DATABASE_USER=$username" >> $envFile
    echo "DATABASE_PASSWORD=$password" >> $envFile
    echo "DATABASE_REPLICA_HOST=$database_host" >> $envFile
    echo "DATABASE_REPLICA_NAME=$database_name" >> $envFile
    echo "DATABASE_REPLICA_USER=$username" >> $envFile
    echo "DATABASE_REPLICA_PASSWORD=$password" >> $envFile

    echo "Done!"
end
