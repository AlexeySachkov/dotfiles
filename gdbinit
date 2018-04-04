add-auto-load-safe-path /usr/lib64/libthread_db-1.0.so

source ~/.dotfiles/gdb-dashboard/.gdbinit

define hookpost-up
dashboard
end

define hookpost-down
dashboard
end

dashboard -enabled off
