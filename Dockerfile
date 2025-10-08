# استخدم صورة أساسية خفيفة
FROM v2fly/v2fly-core:latest

# أنسخ ملفات config الخاصة بك
COPY config.json /etc/v2ray/config.json

# اجعل المنفذ ديناميكيًا حسب البيئة
ENV PORT=8080

# استبدل المنفذ في config.json قبل التشغيل
# هذا يعتمد على أن لديك سكربت صغير أو sed لتغيير المنفذ
RUN sed -i "s/\"port\": [0-9]\+/\"port\": ${PORT}/" /etc/v2ray/config.json

# افتح المنفذ (Cloud Run يستخدم متغير البيئة)
EXPOSE $PORT

# شغّل V2Ray
CMD ["/usr/bin/v2ray", "-config", "/etc/v2ray/config.json"]
