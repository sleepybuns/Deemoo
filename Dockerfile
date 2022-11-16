FROM python

RUN useradd -ms /bin/bash pyusr

RUN mkdir -p /home/pyusr/app && chown -R pyusr:pyusr /home/pyusr/app

WORKDIR /home/pyusr/app

USER pyusr

COPY . .

COPY --chown=pyusr:pyusr . .

RUN pip install twilio

RUN chmod +x .git/hooks/post-commit

CMD ["ls", "-a"]