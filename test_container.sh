### TRY TO MAKE A DOCKERFILE FOR ALL PROGRAMS
###############################################
### Dockerfile for 10X Genomics Long Ranger ###
###############################################

# Iport an image to run the programs below
#FROM centos:7
#FROM biocontainers/biocontainers:latest


# File Author / Maintainer
MAINTAINER Jeffrey Miller <jtmiller@umn.edu>

# Install some utilities
RUN yum install -y \
	file \
	git \
	sssd-client \
	which \
	wget \
	unzip

# Install bcl2fastq
RUN cd /tmp/ && \
	wget https://support.illumina.com/content/dam/illumina-support/documents/downloads/software/bcl2fastq/bcl2fastq2-v2-19-1-linux.zip && \
	unzip bcl2fastq2-v2-19-1-linux.zip && \
	yum -y --nogpgcheck localinstall bcl2fastq2-v2.19.1.403-Linux-x86_64.rpm && \
	rm -rf bcl2fastq2-v2-19-1-linux.zip

# Install longranger 2.2.2
RUN cd /tmp/ && \
  wget -O longranger-2.2.2.tar.gz "https://cf.10xgenomics.com/releases/genome/longranger-2.2.2.tar.gz?Expires=1595403985&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvZ2Vub21lL2xvbmdyYW5nZXItMi4yLjIudGFyLmd6IiwiQ29uZGl0aW9uIjp7IkRhdGVMZXNzVGhhbiI6eyJBV1M6RXBvY2hUaW1lIjoxNTk1NDAzOTg1fX19XX0_&Signature=feM-viLSwgyWSWbjMnZTUYVtPErB492Q1TrIRUAw2goEKvVgT-7GdZB9fy-47DDRtTXF6aWNO9IaCQzQiGn5oMzOD4nB6H1lDmflbhk3yriUH~0veTnJwDcbDChqaEWZwJGGagdo5LZR4j82c3dyDYY-~WTKLBO1kQhxYqbLe-1-gkyN5RnErscxnllnSDrkavmIFdwC-urN8hPLaIZS1PISysET2ALqgm9g1qEV7OsfOgnspTbzaD1wWjS5UHUUY0JLGKzk66M6QGbR1Da73bNgpEHq4mjIm06D7T7EMU9difjM9E9Fpy-iHVWDOlkRShCMetugcxjDns7sFEoShw__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"
	mv longranger-2.2.2.tar.gz /opt/ && \
	cd /opt/ && \
	tar -xzvf longranger-2.2.2.tar.gz && \
	rm -f longranger-2.2.2.tar.gz

# path
ENV PATH /opt/longranger-2.2.2:$PATH
