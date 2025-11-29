ilibc_include = include_directories('../ilibc/include')

cxx_flags = [
  '-std=c++20',
  '-nostdlib',
  '-nostdinc',
  '-nostdinc++',
  '-ffreestanding',
  '-fno-stack-protector',
  '-fno-builtin',
  '-fno-rtti',
]

ilicxx_sources = files(
  'src/cxx/cxxabi.cpp',
  'src/cxx/new.cpp',
  'src/cxx/iostream.cpp',
  'src/cxx/exception.cpp',
)

nasm = find_program('nasm')

crt0_cxx_o = custom_target('crt0_cxx.o',
  input: 'src/asm/crt0.asm',
  output: 'crt0_cxx.o',
  command: [nasm, '-felf64', '@INPUT@', '-o', '@OUTPUT@'],
)

libilicxx = static_library('ilibcxx',
  sources: ilicxx_sources,
  include_directories: [include_directories('include'), ilibc_include],
  cpp_args: cxx_flags,
  pic: false,
)

crt0_cxx = declare_dependency(
  sources: [crt0_cxx_o],
  include_directories: include_directories('include'),
)
