FROM ekidd/rust-musl-builder:1.24.0
ADD cobalt.rs/ /home/rust/src
RUN cargo build --release

FROM alpine:3.4
MAINTAINER Stas Rudakou "stas@garage22.net"
COPY --from=0 /home/rust/src/target/x86_64-unknown-linux-musl/release/cobalt /usr/bin/cobalt
EXPOSE 3000
CMD ["/usr/bin/cobalt"]