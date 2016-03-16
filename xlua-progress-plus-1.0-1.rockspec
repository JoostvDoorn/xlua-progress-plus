 package = "xlua-progress-plus"
 version = "1.0-1"
 source = {
    url = "git://github.com/JoostvDoorn/xlua-progress-plus",
    tag = "v1.0-1"
 }
 description = {
    summary = "Simple extension to xlua.progress.",
    detailed = [[
       Add additional output options to xlua progress.
    ]],
    homepage = "http://joostvandoorn.com",
    license = "BSD"
 }
 dependencies = {
    "lua",
    "xlua"
    -- If you depend on other rocks, add them here
 }
 build = {
    type = "builtin",
    modules = {
      ['xlua-progress-plus.init'] = 'init.lua',
    }
 }