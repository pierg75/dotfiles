After configuring mbsync and neomutt, you can create systemd services to 
run automatically at a specific interval.
First create a mbsync service:

```
$ cat ~/.config/systemd/user/mbsync.service
[Unit]
Description=Mailbox synchronization service

[Service]
Type=oneshot
ExecStart=/usr/bin/mbsync -Va

[Install]
WantedBy=default.target
```

Then create a timer to run the service every X minutes:
```
$ cat ~/.config/systemd/user/mbsync.timer
[Unit]
Description=Mailbox synchronization timer

[Timer]
OnBootSec=2m
OnUnitActiveSec=3m
Unit=mbsync.service

[Install]
WantedBy=timers.target
```

Reload the systemd daemon and enable the timer:
```
$ sudo systemctl daemon-reload
systemctl start --user mbsync.timer
```
