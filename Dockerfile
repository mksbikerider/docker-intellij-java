FROM mksbikerider/docker-intellij

MAINTAINER Michael Sutherland "mike@msutherland.name"

ARG java_download_url=http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.tar.gz
ARG download_folder=/tmp
ARG java_archive="/tmp/jdk-8u101-linux-x64.tar.gz"
ARG java_name=/opt/jdk1.8.0_101"

RUN echo 'Downloading and installing JDK'
# remove -q for logging
RUN wget -q -O ${java_archive} --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "${java_download_url}"
RUN sudo tar -zxf ${java_archive} -C /opt
RUN sudo chown root:root ${java_name}
RUN sudo update-alternatives --install /usr/bin/java java ${java_name}/bin/java 0
RUN rm ${java_archive}
