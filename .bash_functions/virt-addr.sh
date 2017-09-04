# Return the IP address of a running KVM guest VM.
#
# source: https://gist.github.com/mistofvongola/4447791
#
# Usage:
#   $ virt-addr <domain-name>
#   192.0.2.16
virt-addr() {
    VM="$1"
    arp -an \
        | grep "`virsh dumpxml $VM | grep "mac address" | sed "s/.*'\(.*\)'.*/\1/g"`" \
        | awk '{ gsub(/[\(\)]/,"",$2); print $2 }'
}
