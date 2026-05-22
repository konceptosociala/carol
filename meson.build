project('my_vala_project', 'vala', 'c')

vapi_dir = join_paths(meson.project_source_root(), 'vapi')
add_project_arguments(['--vapidir', vapi_dir], language : 'vala')
add_project_arguments(['--enable-experimental-non-null'], language: 'vala')
add_project_arguments(['--enable-experimental'], language: 'vala')

vala_sources = run_command(
    'find', 'src', '-name', '*.vala',
    check: true
).stdout().strip().split('\n')

executable(
    'my_app',
    vala_sources,
    dependencies: [
        dependency('glib-2.0'),
        dependency('gobject-2.0'),
        dependency('sdl3'),
        dependency('gee-0.8'),
        meson.get_compiler('vala').find_library('sdl3', dirs : vapi_dir),
        meson.get_compiler('c').find_library('m'),
    ]
)