FROM swift:5.2.4

RUN apt-get update \
	&& apt-get install -y curl \
	&& curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh \
	&& bash nodesource_setup.sh \
	&& apt-get install -y nodejs \
	&& rm -rf /var/lib/apt/lists/*

RUN npm install -g danger

RUN git clone https://github.com/danger/danger-swift.git \
	&& cd danger-swift \
	&& make install \
	&& cd .. \
	&& rm -rf danger-swift

RUN git clone https://github.com/yonaskolb/Mint.git \
	&& cd Mint \
	&& make install \
	&& cd .. \
	&& rm -rf Mint

RUN mint install realm/SwiftLint@0.40.3

RUN mint install nicklockwood/SwiftFormat@0.47.0

WORKDIR /tool
