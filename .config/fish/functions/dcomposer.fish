function dcomposer
    docker run \
	--tty \
        --interactive \
        --rm \
        --volume (pwd):/app \
	--volume composer-cache:/tmp/cache \
        composer $argv
end
