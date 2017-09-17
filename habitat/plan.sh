# This file is the heart of your application's habitat.
# See full docs at https://www.habitat.sh/docs/reference/plan-syntax/

# Required.
# Sets the name of the package. This will be used in along with `pkg_origin`,
# and `pkg_version` to define the fully-qualified package name, which determines
# where the package is installed to on disk, how it is referred to in package
# metadata, and so on.
pkg_name=mediahub
# Required unless overridden by the `HAB_ORIGIN` environment variable.
# The origin is used to denote a particular upstream of a package.
pkg_origin=jmaya
# Required.
# Sets the version of the package
pkg_scaffolding="core/scaffolding-ruby"

pkg_deps=(core/curl)

pkg_version=0.0.1

pkg_binds_optional=( [database]="port" [redis]="port")


declare -A scaffolding_env

scaffolding_env[RAILS_ENV]="{{cfg.app.rails_env}}"
scaffolding_env[RACK_ENV]="{{cfg.app.rack_env}}"
scaffolding_env[ASSET_HOST]="{{cfg.app.asset_host}}:{{cfg.app.port}}"
scaffolding_env[HOST]="{{cfg.app.asset_host}}:{{cfg.app.port}}"
scaffolding_env[SECRET_KEY_BASE]="{{cfg.secret_key_base}}"
scaffolding_env[SMTP_ADDRESS]="{{cfg.app.smtp_address}}"
scaffolding_env[SMTP_DOMAIN]="{{cfg.app.smtp_domain}}"
scaffolding_env[SMTP_PASSWORD]="{{cfg.app.smtp_password}}"
scaffolding_env[SMTP_USERNAME]="{{cfg.app.smtp_username}}"
scaffolding_env[COURSE_ARCHIVE_DIRECTORY]="{{cfg.app.course_archive_directory}}"
scaffolding_env[REDIS_PORT_6379_TCP_ADDR]="{{cfg.app.redis_port_6379_tcp_addr}}"
scaffolding_env[REDIS_PORT_6379_TCP_PORT]="{{cfg.app.redis_port_6379_tcp_port}}"
