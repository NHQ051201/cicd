FROM busybox:1.35.0-uclibc AS busybox_shell

FROM fluent/fluent-bit:3.0.0

COPY --from=busybox_shell /bin /bin