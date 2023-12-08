#FROM ubuntu:latest
FROM debian:10.11


# Install ngrok and other dependencies
RUN apt-get update -y > /dev/null 2>&1 && apt-get upgrade -y > /dev/null 2>&1 && apt-get install ssh wget unzip vim curl python3 -y > /dev/null 2>&1

# Install ngrok
RUN wget -q https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -O /ngrok-stable-linux-amd64.zip \
    && unzip /ngrok-stable-linux-amd64.zip -d / \
    && chmod +x /ngrok

RUN mkdir /run/sshd \
    #&& echo "/ngrok tcp --authtoken 2Z9JnNgTw3xNzxqA7q9GwexVogN_5FSc461rh5GFQxGUwCApc --region ap 22 &" >>/openssh.sh \
    && echo "sleep 5" >> /openssh.sh \
    #&& echo "curl -s http://localhost:4040/api/tunnels | python3 -c \"import sys, json; print(\\\"ssh info:\\\n\\\",\\\"ssh\\\",\\\"root@\\\"+json.load(sys.stdin)['tunnels'][0]['public_url'][6:].replace(':', ' -p '),\\\"\\\nROOT Password:hacker\\\")\" || echo \"\nError：NGROK_TOKEN，Ngrok Token\n\"" >> /openssh.sh \
    && echo '/usr/sbin/sshd -D' >>/openssh.sh \
    && echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config  \
    && echo root:hacker|chpasswd \
    && echo "/ngrok tcp --authtoken 2Z4KgBO5emOG8Y9LSYYYGfZRvlh_3CjH5DeBwXAr4k6FcWPEz --region ap 22" >>/openssh.sh \
    && chmod 755 /openssh.sh

RUN ssh-keygen -t rsa -b 4096 -f /root/.ssh/id_rsa -P ""


CMD /openssh.sh && tail -f /dev/null

EXPOSE 22 80 443




