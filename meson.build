project('carol', 'vala', 'c')

vapi_dir = join_paths(meson.project_source_root(), 'vapi')
add_project_arguments(['--vapidir', vapi_dir], language : 'vala')
add_project_arguments(['--enable-experimental-non-null'], language: 'vala')
add_project_arguments(['--enable-experimental'], language: 'vala')

vala_sources = run_command(
    'find', 'src', '-name', '*.vala',
    check: true
).stdout().strip().split('\n')

tmx_sources = [
    'libs/tmx/src/tmx.c',
    'libs/tmx/src/tmx_err.c',
    'libs/tmx/src/tmx_hash.c',
    'libs/tmx/src/tmx_mem.c',
    'libs/tmx/src/tmx_utils.c',
    'libs/tmx/src/tmx_xml.c',
]

libxml2_dep = dependency('libxml-2.0')
zlib_dep = dependency('zlib')

tmx_lib = static_library(
    'tmx',
    tmx_sources,
    dependencies: [libxml2_dep, zlib_dep],
    include_directories: include_directories('libs/tmx/src'),
)

executable(
    'carol',
    vala_sources,
    dependencies: [
        dependency('glib-2.0'),
        dependency('gobject-2.0'),
        dependency('sdl3'),
        dependency('gee-0.8'),
        libxml2_dep,
        zlib_dep,
        meson.get_compiler('vala').find_library('sdl3', dirs : vapi_dir),
        # meson.get_compiler('vala').find_library('sdl3-image', dirs : vapi_dir),
        meson.get_compiler('vala').find_library('tmx', dirs : vapi_dir),
        meson.get_compiler('c').find_library('m'),
    ],
    include_directories: include_directories('libs/tmx/src'),
    link_with: tmx_lib,
)