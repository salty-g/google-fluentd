# For systems without journald.
mkdir -p /var/log/journal

# Copy host libsystemd into image to avoid compatibility issues. This operation
# is only performed if the host's lib is mounted into the container through a 
# volume such as -v /usr/lib64/:/host/lib/.
if [ ! -z "$(ls /host/lib/libsystemd* 2>/dev/null)" ]; then
  rm /lib/x86_64-linux-gnu/libsystemd*
  cp -a /host/lib/libsystemd* /lib/x86_64-linux-gnu/
fi

/usr/sbin/google-fluentd $@