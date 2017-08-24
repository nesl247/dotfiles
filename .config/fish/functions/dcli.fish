function dcli
  if not test -e docker-compose.cli.yml
    echo "You must have a docker-compose.cli.yml file!"
    return 1
  end

  docker-compose -f docker-compose.cli.yml run --rm $argv
end
