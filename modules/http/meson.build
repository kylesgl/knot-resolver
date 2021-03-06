# LUA module: http

lua_http_config = configuration_data()
lua_http_config.set('modules_dir', modules_dir)

lua_http = configure_file(
  input: 'http.lua.in',
  output: 'http.lua',
  configuration: lua_http_config,
)

lua_mod_src += [
  lua_http,
  files('http_doh.lua'),
  files('http_trace.lua'),
  files('http_tls_cert.lua'),
  files('prometheus.lua'),
]

config_tests += [
  ['http', files('http.test.lua')],
  ['http.doh', files('http_doh.test.lua')],
  ['http.tls', files('test_tls/tls.test.lua')],
]

# install static files
install_subdir(
  'static',
  strip_directory: true,
  install_dir: join_paths(modules_dir, 'http'),
)

# auxiliary debug library for HTTP module
if openssl.found()
  debug_opensslkeylog_mod = shared_module(
    'debug_opensslkeylog',
    ['debug_opensslkeylog.c'],
    # visibility=default == public is required for LD_PRELOAD trick
    c_args: '-fvisibility=default',
    name_prefix: '',
    install: true,
    install_dir: lib_dir,
    dependencies: [
      openssl,
    ],
  )
endif
