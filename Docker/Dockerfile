FROM public.ecr.aws/lambda/python:3.8
# FROM public.ecr.aws/lambda/provided:al2

COPY requirements.txt .
COPY install-browser.sh .

# Install dependencies
RUN yum install xz atk cups-libs gtk3 libXcomposite alsa-lib tar \
    libXcursor libXdamage libXext libXi libXrandr libXScrnSaver \
    libXtst pango at-spi2-atk libXt xorg-x11-server-Xvfb \
    xorg-x11-xauth dbus-glib dbus-glib-devel unzip bzip2 -y -q

# Install Chromium Browser
RUN /usr/bin/bash install-browser.sh

# Install Python dependencies for function
RUN pip install --upgrade pip -q
RUN pip install -r requirements.txt -q

# Remove not needed packages
RUN yum remove xz tar unzip bzip2 -y

# Copy function code
COPY app.py .

CMD [ "app.lambda_handler" ]
