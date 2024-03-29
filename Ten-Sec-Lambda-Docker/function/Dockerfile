FROM public.ecr.aws/lambda/python@sha256:3286a1e546d0bbed297fd82e259414ff3d3d6f710b4b2d918a547b22eb74dd92 as build

# Install Chromium Browser
RUN yum install -y unzip && \
    curl -Lo "/tmp/chromedriver.zip" "https://chromedriver.storage.googleapis.com/96.0.4664.45/chromedriver_linux64.zip" && \
    curl -Lo "/tmp/chrome-linux.zip" "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2F929511%2Fchrome-linux.zip?alt=media" && \
    unzip /tmp/chromedriver.zip -d /opt/ && \
    unzip /tmp/chrome-linux.zip -d /opt/

FROM public.ecr.aws/lambda/python@sha256:3286a1e546d0bbed297fd82e259414ff3d3d6f710b4b2d918a547b22eb74dd92

# Install dependencies
RUN yum install atk cups-libs gtk3 libXcomposite alsa-lib \
    libXcursor libXdamage libXext libXi libXrandr libXScrnSaver \
    libXtst pango at-spi2-atk libXt xorg-x11-server-Xvfb \
    xorg-x11-xauth dbus-glib dbus-glib-devel -y

# Copy Requirements file
COPY requirements.txt .

# Install Python dependencies for function
RUN pip install -r requirements.txt

# Copy Chrome files
COPY --from=build /opt/chrome-linux /opt/chrome
COPY --from=build /opt/chromedriver /opt/

# Copy function code
COPY app.py .

CMD [ "app.lambda_handler" ]
