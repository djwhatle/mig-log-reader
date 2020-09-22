stern "migration-controller|migration-ui|registry|restic|velero" \
--color always \
--exclude-container discovery \
--exclude "watch is too old"  \
--exclude "level=debug msg=.*s3aws.Stat" \
--exclude "Found new dockercfg secret" \
--tail=0 \
--kubeconfig /var/cache/sa2kubeconfig/kubeconfig \