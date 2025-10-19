# refs: https://aws.amazon.com/jp/blogs/compute/setting-up-an-envoy-front-proxy-on-amazon-ecs/
FROM envoyproxy/envoy:v1.32.2
ADD envoy.yaml /etc/envoy.yaml
EXPOSE 80
ENTRYPOINT ["envoy", "-c", "/etc/envoy.yaml"]

