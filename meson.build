project('my_vala_project', 'vala', 'c')

vapi_dir = join_paths(meson.project_source_root(), 'vapi')
add_project_arguments(['--vapidir', vapi_dir], language : 'vala')

vala_sources = [
    'src/main.vala'
]

executable(
    'my_app',
    vala_sources,
    dependencies: [
        dependency('glib-2.0'),
        dependency('gobject-2.0'),
        meson.get_compiler('vala').find_library('sdl3', dirs : vapi_dir),
    ]
)