require 'schema_plus/core'

require_relative 'pg_functions/active_record'
require_relative 'pg_functions/middleware'
require_relative 'pg_functions/version'

SchemaMonkey.register SchemaPlus::PgFunctions
