function rabbitmq-login
    set -l environment $argv[1]

    if test -z "$environment"
        echo "You must specify an environment!"
        return 1
    end

    echo "Retrieving credentials from vault..."
    set credentials (vault read "rabbitmq-$environment/creds/manager" -format=json)

    if test -z "$credentials"
      echo "Failed to retrieve credentials"
      return 1
    end

    set username (echo $credentials | jq -r .data.username)
    set password (echo $credentials | jq -r .data.password)

    echo "Updating 1password entry..."
    op item edit "RabbitMQ (syntage-$environment)" "username=$username" "password=$password" > /dev/null

    echo "Done!"
end
