function __ip_from_instance
    echo (aws ec2 describe-instances --filters "{\"Name\":\"tag:Name\", \"Values\":[\"$argv[1]\"]}" --query='Reservations[0].Instances[0].PrivateIpAddress' | tr -d '"')
end

function assh
    if contains -- "--help" $argv || not set -q argv[1]
        ssh

        return
    end

    if contains -- "--no-tmux" $argv
        ssh (__ip_from_instance "$argv[2]") $argv[3..-1]

        return
    end

    ssh (__ip_from_instance "$argv[1]") $argv[2..-1] -t 'tmux -CC new-session -A -s main'
end
