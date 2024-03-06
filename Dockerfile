FROM debian:stable

RUN apt-get update && apt-get install -y \
    wget
    
RUN wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm -f packages-microsoft-prod.deb

RUN apt-get update && apt-get install -y \
    dotnet-sdk-8.0 \
    dotnet-runtime-8.0 \
    libopengl-dev \
    libegl-dev

# Preparing local directories
WORKDIR /Celeste

COPY . .

RUN dotnet build Celeste64.csproj
