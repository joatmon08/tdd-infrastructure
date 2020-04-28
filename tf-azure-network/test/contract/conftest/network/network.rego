package network

check_resources_have_environment_in_name(resources, environment) = [resources_without_environment_in_name] {
  resources_without_environment_in_name := [r | r := resources[_]; not startswith(r.values.name, environment)]
  count(resources_without_environment_in_name) != 0
}