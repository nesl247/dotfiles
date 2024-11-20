function syntage-cli-login
  vault login -method=oidc
  aws --profile syntage sso login
  rabbitmq-login production
  rabbitmq-login staging
end
