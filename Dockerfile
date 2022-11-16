FROM python

RUN useradd -ms /bin/bash pyusr

RUN mkdir -p /home/pyusr/app && chown -R pyusr:pyusr /home/pyusr/app

WORKDIR /home/pyusr/app

USER pyusr

COPY . .

COPY --chown=pyusr:pyusr . .

RUN pip install twilio

RUN chmod +x .git/hooks/post-commit

RUN git config --global user.email "vchen118@gmail.com"

RUN git config --global user.name "sleepybuns"

CMD ["ls", "-a"]