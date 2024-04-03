vim.filetype.add {
    pattern = {
        ['.*/kernel/.*'] = "c-kernel",
        ['.*/rhel-.*/.*'] = "c-kernel",
    }
}
