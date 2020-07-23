
## 部署说明
```
sudo docker run --name themis-ui --restart always -d  \
-e BASE_API="192.168.1.250:8081" \
-p 8090:80 \
registry.cn-hangzhou.aliyuncs.com/vdo/themis-ui:v1.0.2
```