function linio-rake
    if test -d .git
        set -x REVISION (git log -n1 --format=%h)
    end

    if [ (basename $PWD) = "docker-rake" ]
        docker run --rm -it -v $HOME/.kube/config:/root/.kube/config -e REVISION -e RELEASE_CONTROL_API_KEY 137361304112.dkr.ecr.us-east-1.amazonaws.com/docker-rake:latest $argv

        return $status
    end

    docker run --rm -it -v $HOME/.kube/config:/root/.kube/config -v $PWD:/application -e REVISION -e RELEASE_CONTROL_API_KEY 137361304112.dkr.ecr.us-east-1.amazonaws.com/docker-rake:latest $argv

    return $status
end
