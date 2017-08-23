function dcomposer
    docker run \
      	--tty \
        --interactive \
        --rm \
        --volume (pwd):/app \
      	--volume composer-cache:/tmp \
        composer $argv
end
